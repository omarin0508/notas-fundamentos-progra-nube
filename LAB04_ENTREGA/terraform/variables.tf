# OCID del tenancy de Oracle Cloud Infrastructure.
# El tenancy representa la cuenta principal de OCI donde se administran
# usuarios, compartimentos y recursos en la nube.
variable "tenancy_ocid" {
  description = "OCID del tenancy de Oracle Cloud Infrastructure."
  type        = string
}

# OCID del usuario de OCI que utilizara Terraform.
# Este usuario debe tener permisos suficientes para crear y administrar
# los recursos requeridos por el laboratorio.
variable "user_ocid" {
  description = "OCID del usuario de OCI utilizado por Terraform."
  type        = string
}

# Fingerprint de la llave API registrada en OCI.
# OCI utiliza esta huella para identificar que llave publica corresponde
# a la llave privada local usada por Terraform.
variable "fingerprint" {
  description = "Fingerprint de la llave API configurada en el usuario de OCI."
  type        = string
}

# Ruta local hacia la llave privada API de OCI.
# Esta llave permite que Terraform firme las solicitudes enviadas a OCI.
# El archivo debe mantenerse fuera del repositorio por seguridad.
variable "private_key_path" {
  description = "Ruta local de la llave privada API usada para autenticarse contra OCI."
  type        = string
}

# Region de Oracle Cloud Infrastructure donde se desplegaran los recursos.
# Ejemplos de regiones: us-ashburn-1, us-phoenix-1, sa-saopaulo-1.
variable "region" {
  description = "Region de OCI donde se crearan los recursos."
  type        = string
}

# OCID del compartimento donde se crearan los recursos del laboratorio.
# Los compartimentos permiten organizar recursos y controlar permisos
# dentro de Oracle Cloud Infrastructure.
variable "compartment_ocid" {
  description = "OCID del compartimento de OCI donde se desplegaran los recursos."
  type        = string
}

