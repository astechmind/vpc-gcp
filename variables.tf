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
  default     = "devsecops-vpc"
}

variable "private_subnets_cidrs" {
  description = "Lista de CIDRs para sub-redes privadas"
  type        = list(string)
}

variable "public_subnets_cidrs" {
  description = "Lista de CIDRs para sub-redes públicas"
  type        = list(string)
}

variable "database_subnets_cidrs" {
  description = "Lista de CIDRs para sub-redes de banco de dados"
  type        = list(string)
}
