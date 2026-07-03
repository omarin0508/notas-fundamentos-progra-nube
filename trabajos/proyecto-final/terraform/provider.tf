# Bloque principal de Terraform.
# Aqui se define la version minima de Terraform y los proveedores necesarios
# para que el laboratorio pueda ejecutarse de forma controlada y reproducible.
terraform {
  # Version minima requerida de Terraform para ejecutar esta configuracion.
  # Esto ayuda a evitar errores por usar una version demasiado antigua.
  required_version = ">= 1.5.0"

  # Lista de proveedores que Terraform debe descargar para interactuar
  # con servicios externos. En este laboratorio se utiliza Oracle Cloud
  # Infrastructure mediante el proveedor oficial de OCI.
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = "~> 6.0"
    }
  }
}

# Configuracion del proveedor de Oracle Cloud Infrastructure.
# Terraform usa estos datos para autenticarse contra OCI y poder administrar
# recursos dentro del tenancy y compartimento indicados.
provider "oci" {
  # OCID del tenancy de Oracle Cloud donde se encuentran los recursos.
  tenancy_ocid = var.tenancy_ocid

  # OCID del usuario de OCI que ejecutara las acciones mediante Terraform.
  user_ocid = var.user_ocid

  # Huella digital de la llave API registrada en el perfil del usuario de OCI.
  fingerprint = var.fingerprint

  # Ruta local de la llave privada API usada para firmar solicitudes hacia OCI.
  private_key_path = var.private_key_path

  # Region de OCI donde se crearan los recursos del laboratorio.
  region = var.region
}

