# Instancia privada para la base de datos del proyecto final.
# En esta fase solo se crea la VM dentro de la subred privada; la instalacion
# de MySQL/MariaDB se realizara posteriormente.
resource "oci_core_instance" "proyecto_final_db_vm" {
  compartment_id = var.compartment_ocid

  # Se usa el mismo dominio de disponibilidad que la VM publica del proyecto.
  availability_domain = data.oci_identity_availability_domains.lab4_availability_domains.availability_domains[2].name

  # Nombre visible para identificar la VM privada de base de datos en OCI.
  display_name = "proyecto-final-db-vm"

  # Shape liviano ya validado en la fase anterior.
  shape = "VM.Standard.E2.1.Micro"

  # La VM se conecta a la subred privada y no recibe IP publica.
  create_vnic_details {
    subnet_id        = oci_core_subnet.lab4_private_subnet.id
    assign_public_ip = false
    display_name     = "proyecto-final-db-vnic"
    hostname_label   = "pfdbvm"
  }

  # Imagen base Oracle Linux 9 compatible con el shape seleccionado.
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_9.images[0].id
  }

  # Se reutiliza la misma llave publica SSH de la VM publica.
  metadata = {
    ssh_authorized_keys = file("${path.module}/keys/lab4_oci_vm_key.pub")
  }
}
