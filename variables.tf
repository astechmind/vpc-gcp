# ID do projeto GCP
variable "project_id" {
  description = "ID do projeto no GCP"
  type        = string
}

# Região onde os recursos serão criados
variable "region" {
  description = "Região do GCP onde os recursos serão criados"
  type        = string
  default     = "us-central1"
}

# Nome da VPC
variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
  default     = "devsecops-vpc"
}

# Mapa de subnets privadas (nome + CIDR)
variable "private_subnets" {
  description = "Mapa de sub-redes privadas (Nome e CIDR)"
  type        = map(string)
}

# Mapa de subnets públicas (nome + CIDR)
variable "public_subnets" {
  description = "Mapa de sub-redes públicas (Nome e CIDR)"
  type        = map(string)
}

# Mapa de subnets para banco de dados (nome + CIDR)
variable "database_subnets" {
  description = "Mapa de sub-redes de banco de dados (Nome e CIDR)"
  type        = map(string)
}
