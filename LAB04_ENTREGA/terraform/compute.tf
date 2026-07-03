# Consulta de dominios de disponibilidad en OCI.
# Los Availability Domains son ubicaciones fisicas dentro de una region
# donde se pueden desplegar recursos de computo como maquinas virtuales.
data "oci_identity_availability_domains" "lab4_availability_domains" {
  compartment_id = var.tenancy_ocid
}

# Consulta de imagenes disponibles para Oracle Linux 9.
# Terraform buscara una imagen compatible con el shape seleccionado para
# usarla como sistema operativo base de la maquina virtual.
data "oci_core_images" "oracle_linux_9" {
  compartment_id = var.compartment_ocid

  # Sistema operativo solicitado para el laboratorio.
  operating_system = "Oracle Linux"

  # Version del sistema operativo que se instalara en la instancia.
  operating_system_version = "9"

  # Shape de la instancia para filtrar imagenes compatibles.
  shape = "VM.Standard.E2.1.Micro"

  # Ordena las imagenes desde la mas reciente hacia la mas antigua.
  sort_by    = "TIMECREATED"
  sort_order = "DESC"
}

# Instancia de computo principal del Laboratorio 4.
# Esta maquina virtual se conectara a la subred publica definida en network.tf
# y recibira una direccion IP publica para permitir acceso desde Internet.
resource "oci_core_instance" "lab4_vm" {
  compartment_id = var.compartment_ocid

  # Se utiliza el primer dominio de disponibilidad encontrado en la region.
  availability_domain = data.oci_identity_availability_domains.lab4_availability_domains.availability_domains[2].name

  # Nombre visible de la instancia en la consola de OCI.
  display_name = "lab4-oci-vm"

  # Shape alternativo seleccionado para evitar falta de capacidad en A1.Flex.
  # Este shape no utiliza bloque shape_config porque no es flexible.
  shape = "VM.Standard.E2.1.Micro"

  # Configuracion de red primaria de la instancia.
  # La VM se conecta a la subred publica creada en network.tf y se le asigna
  # una direccion IP publica para acceso desde Internet.
  create_vnic_details {
    subnet_id        = oci_core_subnet.lab4_public_subnet.id
    assign_public_ip = true
    display_name     = "lab4-vnic"
    hostname_label   = "lab4vm"
  }

  # Imagen base del sistema operativo.
  # Se usa la imagen mas reciente encontrada para Oracle Linux 9 compatible
  # con el shape VM.Standard.A1.Flex.
  source_details {
    source_type = "image"
    source_id   = data.oci_core_images.oracle_linux_9.images[0].id
  }

  # Metadatos enviados a la instancia durante su creacion.
  # La llave publica SSH permite conectarse posteriormente a la VM usando
  # la llave privada correspondiente almacenada localmente.
  metadata = {
    ssh_authorized_keys = file("${path.module}/keys/lab4_oci_vm_key.pub")
  }
}
