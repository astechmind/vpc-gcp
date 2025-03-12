# ID do projeto GCP onde os recursos serão criados
variable "project_id" {
  description = "ID do projeto no GCP"
  type        = string
}

# Região do GCP onde a VPC será criada
variable "region" {
  description = "Região do GCP onde os recursos serão criados"
  type        = string
  default     = "us-central1"
}

# Nome da VPC
variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

# Subnets privadas (com nomes e CIDRs)
variable "private_subnets" {
  description = "Mapa de sub-redes privadas com nome e CIDR"
  type        = map(string)
}

# Subnets públicas (com nomes e CIDRs)
variable "public_subnets" {
  description = "Mapa de sub-redes públicas com nome e CIDR"
  type        = map(string)
}

# Subnets para banco de dados (com nomes e CIDRs)
variable "database_subnets" {
  description = "Mapa de sub-redes de banco de dados com nome e CIDR"
  type        = map(string)
}
