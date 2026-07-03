# Nombre visible de la maquina virtual creada en OCI.
# Este valor permite identificar rapidamente la instancia desde la salida
# de Terraform y compararla con la consola web de Oracle Cloud.
output "vm_name" {
  description = "Nombre visible de la maquina virtual creada en OCI."
  value       = oci_core_instance.lab4_vm.display_name
}

# OCID de la maquina virtual.
# El OCID es el identificador unico asignado por OCI a cada recurso creado.
output "vm_ocid" {
  description = "OCID de la maquina virtual creada en Oracle Cloud Infrastructure."
  value       = oci_core_instance.lab4_vm.id
}

# ID de la Virtual Cloud Network creada para el laboratorio.
# Esta salida ayuda a documentar que red virtual fue utilizada por la VM.
output "vcn_id" {
  description = "ID de la VCN creada para el Laboratorio 4."
  value       = oci_core_vcn.lab4_vcn.id
}

# ID de la subred publica donde se conecto la maquina virtual.
# Permite confirmar que la instancia fue desplegada en la subred esperada.
output "public_subnet_id" {
  description = "ID de la subred publica utilizada por la maquina virtual."
  value       = oci_core_subnet.lab4_public_subnet.id
}

# Direccion IP publica asignada a la instancia.
# Esta IP se utilizara posteriormente para conectarse por SSH y validar
# el acceso externo a la maquina virtual.
output "instance_public_ip" {
  description = "Direccion IP publica asignada a la instancia."
  value       = oci_core_instance.lab4_vm.public_ip
}

