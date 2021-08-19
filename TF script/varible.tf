variable "labels" {
  description = "(optional) - A set of key/value label pairs assigned to the instance."
  type        = map(string)
  default     = {
      env     = "dev"
      server  = "jenkins"
  }
}

variable "machine_type" {
  description = "(required) - The machine type to create."
  type        = string
}

variable "name" {
  description = "(required) - The name of the instance. One of name or self_link must be provided."
  type        = string
}

variable "project" {
  description = "(optional) - The ID of the project in which the resource belongs. If self_link is provided, this value is ignored. If neither self_link nor project are provided, the provider project is used."
  type        = string
}

variable "tags" {
  description = "(optional) - The list of tags attached to the instance."
  type        = set(string)
  default     = ["jenkins"]
}

variable "zone" {
  description = "(optional) - The zone of the instance. If self_link is provided, this value is ignored. If neither self_link nor zone are provided, the provider zone is used."
  type        = string
}

variable "region" {
  description = "(optional) - The zone of the instance. If self_link is provided, this value is ignored. If neither self_link nor zone are provided, the provider zone is used."
  type        = string
}

variable "attached_disk" {
  description = "nested block: NestingList, min items: 0, max items: 0"
  type = set(object(
    {
      mode                       = string
    }
  ))
  default = [{
      mode                      =  "READ_WRITE"
  }]
}

#boot disk

variable "image_name" {
  description = "Image used as os on the server"
  type        = string
}

variable "image_project" {
  description = "Image used as os on the server"
  type        = string
}

variable "disk_name" {
  description = "disk name"
  type        = string
  default     = "jenkins-disk"
}

variable "disk_size" {
  description = "size of the disk"
  type        = number
  default     = 10
}

variable "disk_type" {
  description = "Type of the disk"
  type        = string
  default     = "pd-standard"
}

variable    "network" {

    description =   "VPC name"
    type        =   string
    default     =   "default"
}

variable "preemptible" {
    description = "Based on requirement True/false"
    type        =  bool
    default     =  true
}

variable "automatic_restart"{
  description = "Based on Preemptible requirement True/false"
  type          = bool
  default       = false
}

variable "scope" {
    description =   "scope for the service account"
    type        =   list(string)
    default     =   ["cloud-platform"]
}