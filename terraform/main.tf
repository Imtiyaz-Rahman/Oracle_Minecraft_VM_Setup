# SSH Key Pair

resource "tls_private_key" "minecraft" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_sensitive_file" "private_key" {
  content         = tls_private_key.minecraft.private_key_pem
  filename        = "${path.module}/minecraft_server.pem"
  file_permission = "0600"
}

# Networking

resource "oci_core_vcn" "minecraft" {
  compartment_id = var.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "minecraft-vcn"
}

resource "oci_core_internet_gateway" "minecraft" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.minecraft.id
  display_name   = "minecraft-igw"
  enabled        = true
}

resource "oci_core_route_table" "minecraft" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.minecraft.id
  display_name   = "minecraft-route-table"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.minecraft.id
  }
}

resource "oci_core_security_list" "minecraft" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.minecraft.id
  display_name   = "minecraft-security-list"

  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "all"
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 25565
      max = 25565
    }
  }

  ingress_security_rules {
    protocol = "17" # UDP
    source   = "0.0.0.0/0"
    udp_options {
      min = 25565
      max = 25565
    }
  }
}

resource "oci_core_subnet" "minecraft" {
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.minecraft.id
  cidr_block        = "10.0.1.0/24"
  display_name      = "minecraft-subnet"
  route_table_id    = oci_core_route_table.minecraft.id
  security_list_ids = [oci_core_security_list.minecraft.id]
}

# Compute Instance

resource "oci_core_instance" "minecraft" {
  compartment_id      = var.compartment_id
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  display_name        = "minecraft-server"
  shape               = var.instance_shape

  shape_config {
    ocpus         = var.ocpus
    memory_in_gbs = var.memory_in_gbs
  }

  source_details {
    source_type = "image"
    source_id   = var.instance_image_ocid
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.minecraft.id
    assign_public_ip = true
  }

  metadata = {
    ssh_authorized_keys = tls_private_key.minecraft.public_key_openssh
    user_data           = filebase64("${path.module}/../oracle_image_v9_run.sh")
  }
}

# Data Sources

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}
