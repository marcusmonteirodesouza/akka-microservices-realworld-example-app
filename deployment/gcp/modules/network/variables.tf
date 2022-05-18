variable "project_id" {
  type = string
}

variable "subnetworks" {
  type = map(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
}
