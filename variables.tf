# ID do projeto GCP onde os recursos serão criados
variable "project_id" {
  description = "ID do projeto no GCP"
  type        = string
}

# Região principal onde a VPC será criada
variable "region" {
  description = "Região do GCP onde os recursos serão criados"
  type        = string
  default     = "us-central1"
}

# Lista de regiões secundárias (para Multi-AZ)
variable "secondary_regions" {
  description = "Lista de regiões adicionais para distribuir as subnets (Multi-AZ)"
  type        = list(string)
  default     = ["us-east1", "us-west1"]  # Exemplo de 3 regiões
}

# Nome da VPC
variable "vpc_name" {
  description = "Nome da VPC"
  type        = string
}

# Subnets privadas distribuídas em múltiplas regiões
variable "private_subnets" {
  description = "Mapa de subnets privadas com nome, região e CIDR"
  type = map(object({
    cidr   = string
    region = string
  }))
}

# Subnets públicas distribuídas em múltiplas regiões
variable "public_subnets" {
  description = "Mapa de subnets públicas com nome, região e CIDR"
  type = map(object({
    cidr   = string
    region = string
  }))
}

# Subnets para banco de dados distribuídas em múltiplas regiões
variable "database_subnets" {
  description = "Mapa de subnets de banco de dados com nome, região e CIDR"
  type = map(object({
    cidr   = string
    region = string
  }))
}
