# Archivos Terraform del Laboratorio 4

En esta carpeta se almacenaran los archivos de configuracion de Terraform necesarios para crear una maquina virtual en Oracle Cloud Infrastructure (OCI).

Los archivos se iran agregando de forma incremental durante el desarrollo del laboratorio, incluyendo la configuracion del proveedor, variables, red, instancia de computo y salidas.

Por seguridad, no se deben almacenar aqui llaves privadas, archivos `.tfstate`, ni archivos `terraform.tfvars` con credenciales reales dentro del repositorio.

## Carpetas de llaves

- `keys/`: contiene las llaves SSH utilizadas para acceder a la maquina virtual creada en OCI. La llave publica se registra en la instancia y la llave privada permanece en el equipo local para conectarse por SSH.
- `oci-api-key/`: contiene las llaves API utilizadas por Terraform para autenticarse contra Oracle Cloud Infrastructure. Estas llaves permiten que Terraform solicite a OCI la creacion, modificacion o eliminacion de recursos.

Ambas carpetas pueden contener informacion sensible y no deben subirse al repositorio.
