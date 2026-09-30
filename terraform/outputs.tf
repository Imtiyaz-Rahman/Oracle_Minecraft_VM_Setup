output "instance_public_ip" {
  description = "Public IP address of the Minecraft server"
  value       = oci_core_instance.minecraft.public_ip
}

output "ssh_private_key_path" {
  description = "Path to the generated SSH private key file"
  value       = local_sensitive_file.private_key.filename
}
