# Oracle VM Setup

## Create Instance

1. Login to Oracle Cloud
2. Menu → Compute → Instances → Create Instance

**Basic Information:**

- Name: `minecraft-server`
- Image: Oracle Linux 9
- Shape: Ampere (4 OCPU, 24 GB RAM (_Maximum_))

**Networking:**

- VNIC name: Any name
- Network: Create new or select existing
- Subnet: Create new public subnet or select existing
- **Download SSH private key**

Click **Create**.

## Add Public IP

Source: https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/assigning-ephemeral-public-existing-private-ip.html

1. Compute → Instance → Networking → Attached VNICs
2. Select VNIC → IP Administration → Actions → Edit
3. Public IP type: Ephemeral public IP
4. Enter name → Update

## Configure Firewall

1. Virtual Cloud Network → Select instance → Security → Default Security List
2. Ingress Rules → Add Ingress Rules

**Add both rules:**

TCP:

- Source CIDR: `0.0.0.0/0`
- Protocol: TCP
- Port: `25565`

UDP:

- Source CIDR: `0.0.0.0/0`
- Protocol: UDP
- Port: `25565`
