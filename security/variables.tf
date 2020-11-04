variable "tls_cidr_443" {
  type = list(string)
  default = ["10.10.10.0/24", "10.26.125.0/27"]
}

variable "tls1_cidr_80" {
  type = list(string)
  default =  ["10.10.10.0/24", "10.26.125.0/27"]
}
