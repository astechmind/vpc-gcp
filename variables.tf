variable "project_id" {
  description = "ID do projeto no GCP"
  type        = string
}

variable "region" {
  description = "Região do GCP onde os recursos serão criados"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

variable "private_subnets" {
  description = "Mapa de sub-redes privadas com nome e CIDR"
  type        = map(object({
    name  = string
    cidr  = string
    region = string
  }))
}

variable "public_subnets" {
  description = "Mapa de sub-redes públicas com nome e CIDR"
  type        = map(object({
    name  = string
    cidr  = string
    region = string
  }))
}

variable "database_subnets" {
  description = "Mapa de sub-redes de banco de dados com nome e CIDR"
  type        = map(object({
    name  = string
    cidr  = string
    region = string
  }))
}
