# Handoff de Infraestructura - Proyecto Final

## 1. Estado de la infraestructura

La infraestructura del Proyecto Final fue desplegada completamente mediante Terraform en Oracle Cloud Infrastructure.

Estado validado:

- `terraform validate`: OK.
- `terraform plan`: No changes.
- La infraestructura quedo validada operativamente.
- No existen cambios pendientes en Terraform.
- La red publica, la red privada, la VM publica y la VM privada se encuentran creadas y administradas desde Terraform.

La infraestructura queda lista para continuar con la instalacion de MySQL/MariaDB y el despliegue de la aplicacion Flask.

---

## 2. Topologia

```text
Internet
   |
   v
VM Publica
lab4-oci-vm
   |
   v
Red privada
   |
   v
VM Base de Datos
proyecto-final-db-vm
```

La aplicacion Flask se ejecutara en la VM publica `lab4-oci-vm`. La base de datos MySQL/MariaDB se instalara en la VM privada `proyecto-final-db-vm`.

La VM publica funciona como punto de entrada del proyecto y como puente de administracion hacia la VM privada. La VM privada no tiene IP publica y solo se comunica mediante la red interna de OCI.

---

## 3. Direccionamiento

### VCN

```text
10.0.0.0/16
```

### Subred publica

```text
10.0.1.0/24
```

### Subred privada

```text
10.0.2.0/24
```

### VM Publica

Nombre:

```text
lab4-oci-vm
```

IP publica:

```text
129.80.190.44
```

IP privada:

```text
10.0.1.176
```

Usuario SSH:

```text
opc
```

Ejemplo de conexion SSH:

```bash
ssh -i keys/lab4_oci_vm_key opc@129.80.190.44
```

### VM Base de Datos

Nombre:

```text
proyecto-final-db-vm
```

IP privada:

```text
10.0.2.45
```

IP publica:

```text
No posee.
```

---

## 4. Seguridad

### VM publica

Puertos permitidos:

- SSH: `22`
- HTTP: `80`
- HTTPS: `443`

La VM publica recibe las conexiones externas necesarias para administracion y para el despliegue de la aplicacion web.

### VM privada

La VM privada no tiene acceso directo desde Internet.

Puertos permitidos:

- SSH: permitido unicamente desde la red privada / subred publica del proyecto.
- MySQL/MariaDB: puerto `3306`, permitido unicamente desde la subred publica `10.0.1.0/24`.

La base de datos queda protegida dentro de la subred privada y solo debe recibir conexiones internas desde la VM publica.

---

## 5. Conectividad validada

Se verificaron correctamente las siguientes pruebas:

- SSH a la VM publica `lab4-oci-vm`.
- Ping desde la VM publica hacia la VM privada `10.0.2.45`.
- Acceso SSH interno hacia la VM privada `proyecto-final-db-vm`.
- Comunicacion entre ambas maquinas mediante la red privada de OCI.
- `terraform plan` sin diferencias:

```text
No changes. Your infrastructure matches the configuration.
```

Resultado de la prueba interna hacia la VM privada:

```text
db-ok
```

---

## 6. Recursos Terraform

Recursos administrados por Terraform:

- `oci_core_vcn.lab4_vcn`
- `oci_core_internet_gateway.lab4_internet_gateway`
- `oci_core_route_table.lab4_public_route_table`
- `oci_core_route_table.lab4_private_route_table`
- `oci_core_security_list.lab4_public_security_list`
- `oci_core_security_list.lab4_private_security_list`
- `oci_core_subnet.lab4_public_subnet`
- `oci_core_subnet.lab4_private_subnet`
- `oci_core_instance.lab4_vm`
- `oci_core_instance.proyecto_final_db_vm`

Estos recursos corresponden a la red principal, la separacion entre subred publica y privada, las reglas de seguridad y las dos maquinas virtuales requeridas por el proyecto.

---

## 7. Trabajo correspondiente a Emanuel

La infraestructura ya esta lista. Las tareas restantes corresponden unicamente a la capa de software.

Tareas de Emanuel:

- Instalar MySQL o MariaDB en la VM privada `proyecto-final-db-vm`.
- Crear la base de datos requerida por el proyecto.
- Crear el usuario de base de datos correspondiente.
- Configurar Flask para utilizar la IP privada `10.0.2.45` como servidor de base de datos.
- Configurar la conexion de base de datos hacia el puerto `3306`.
- Desplegar la aplicacion Flask en la VM publica `lab4-oci-vm`.
- Validar la comunicacion entre Flask y la base de datos.
- Realizar las pruebas funcionales de la aplicacion.

Valores principales para la configuracion de Flask:

```text
DB_HOST=10.0.2.45
DB_PORT=3306
```

---

## 8. Observaciones

- No es necesario ejecutar Terraform nuevamente.
- No deben modificarse los archivos Terraform.
- La infraestructura ya fue validada y documentada.
- Cualquier cambio futuro debera realizarse unicamente si el proyecto requiere ampliar la infraestructura.
- No se incluyen secretos, llaves privadas ni credenciales en este documento.

Este documento sirve como referencia tecnica para continuar el proyecto desde la capa de aplicacion.
