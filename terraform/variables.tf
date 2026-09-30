variable "oci_config_profile" {
  description = "OCI config file profile to use for authentication"
  type        = string
  default     = "DEFAULT"
}

variable "region" {
  description = "OCI region to deploy into (e.g. uk-london-1)"
  type        = string
}

variable "compartment_id" {
  description = "OCID of the compartment to deploy resources into"
  type        = string
}

variable "instance_image_ocid" {
  description = "OCID of the Oracle Linux 9 ARM image for the target region"
  type        = string
}

variable "instance_shape" {
  description = "Compute shape for the instance"
  type        = string
  default     = "VM.Standard.A1.Flex"
}

variable "ocpus" {
  description = "Number of OCPUs to allocate to the instance"
  type        = number
  default     = 2
}

variable "memory_in_gbs" {
  description = "Amount of memory in GB to allocate to the instance"
  type        = number
  default     = 12
}
