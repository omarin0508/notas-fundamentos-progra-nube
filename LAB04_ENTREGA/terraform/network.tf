# Virtual Cloud Network (VCN) principal del laboratorio.
# Una VCN es una red virtual privada dentro de OCI donde se conectaran
# los recursos del laboratorio, como la maquina virtual.
resource "oci_core_vcn" "lab4_vcn" {
  compartment_id = var.compartment_ocid

  # Rango de direcciones IP privadas disponibles dentro de la VCN.
  cidr_block = "10.0.0.0/16"

  # Nombre visible de la VCN en la consola de OCI.
  display_name = "lab4-vcn"

  # Nombre DNS interno para identificar recursos dentro de esta red.
  dns_label = "lab4vcn"
}

# Internet Gateway para permitir comunicacion entre la VCN e Internet.
# Este recurso es necesario para que una maquina virtual con IP publica
# pueda recibir conexiones externas, por ejemplo mediante SSH o HTTP.
resource "oci_core_internet_gateway" "lab4_internet_gateway" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.lab4_vcn.id

  # Mantiene habilitado el gateway para permitir trafico hacia Internet.
  enabled = true

  # Nombre visible del gateway en la consola de OCI.
  display_name = "lab4-internet-gateway"
}

# Tabla de rutas publica.
# Define hacia donde se enviara el trafico que sale desde la subred.
resource "oci_core_route_table" "lab4_public_route_table" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.lab4_vcn.id

  # Nombre visible de la tabla de rutas en OCI.
  display_name = "lab4-public-route-table"

  # Ruta por defecto hacia Internet.
  # Todo trafico cuyo destino no pertenezca a la red local se enviara
  # al Internet Gateway para permitir salida a Internet.
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.lab4_internet_gateway.id
  }
}

# Lista de seguridad para la subred publica.
# Controla que trafico de entrada y salida se permite para los recursos
# conectados a la subred, incluyendo la futura maquina virtual.
resource "oci_core_security_list" "lab4_public_security_list" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.lab4_vcn.id

  # Nombre visible de la lista de seguridad en OCI.
  display_name = "lab4-public-security-list"

  # Permite trafico de salida desde la VM hacia cualquier destino.
  # Esto facilita actualizaciones del sistema y descarga de paquetes.
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  # Permite conexiones SSH desde Internet hacia la maquina virtual.
  # SSH utiliza el puerto TCP 22 y sera necesario para administrar la VM.
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  # Permite trafico HTTP desde Internet.
  # HTTP utiliza el puerto TCP 80 y puede usarse para probar un servidor web.
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  # Permite trafico HTTPS desde Internet.
  # HTTPS utiliza el puerto TCP 443 para servicios web cifrados.
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
  }
}

# Subred publica donde se conectara la futura maquina virtual.
# Se considera publica porque permite asignar direcciones IP publicas
# y utiliza una tabla de rutas con salida hacia el Internet Gateway.
resource "oci_core_subnet" "lab4_public_subnet" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.lab4_vcn.id

  # Rango de direcciones IP privadas asignado a la subred publica.
  cidr_block = "10.0.1.0/24"

  # Nombre visible de la subred en la consola de OCI.
  display_name = "lab4-public-subnet"

  # Nombre DNS interno de la subred.
  dns_label = "lab4pub"

  # Asociacion con la tabla de rutas publica para salida a Internet.
  route_table_id = oci_core_route_table.lab4_public_route_table.id

  # Asociacion con la lista de seguridad que permite SSH, HTTP y HTTPS.
  security_list_ids = [
    oci_core_security_list.lab4_public_security_list.id
  ]

  # Permite que las instancias de esta subred puedan recibir IP publica.
  prohibit_public_ip_on_vnic = false
}

