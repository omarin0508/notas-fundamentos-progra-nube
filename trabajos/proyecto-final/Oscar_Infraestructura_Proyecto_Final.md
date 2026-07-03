# Proyecto Final FCN

## Infraestructura OCI con Terraform

**Responsable:** Oscar Marin

**Grupo:** Nathalie, Emanuel y Oscar

---

## 1. Introduccion

Como parte del Proyecto Final de Fundamentos de Computacion en la Nube, se implemento la infraestructura base en Oracle Cloud Infrastructure (OCI) utilizando Terraform como herramienta de Infrastructure as Code.

El objetivo de esta infraestructura fue separar la aplicacion web y la base de datos en capas distintas: una capa publica para recibir conexiones externas y hospedar la aplicacion Flask, y una capa privada para alojar la base de datos MySQL/MariaDB sin exponerla directamente a Internet.

---

## 2. Arquitectura

La arquitectura implementada sigue un modelo de red publica y privada dentro de una VCN en OCI.

```text
Internet
   |
   v
VM publica Oracle Linux
lab4-oci-vm
IP publica: 129.80.190.44
IP privada: 10.0.1.176
   |
   v
Subred publica: 10.0.1.0/24
   |
   v
VCN: 10.0.0.0/16
   |
   v
Subred privada: 10.0.2.0/24
   |
   v
VM privada para base de datos
proyecto-final-db-vm
IP privada: 10.0.2.45
Sin IP publica
```

La VM publica funciona como punto de entrada para la administracion y para la aplicacion Flask. La VM privada queda reservada para la base de datos y no recibe IP publica.

---

## 3. Recursos creados

| Recurso | Nombre en OCI / Terraform | Proposito |
|---|---|---|
| VCN | `lab4-vcn` | Red virtual principal del proyecto. |
| Internet Gateway | `lab4-internet-gateway` | Permite salida/entrada a Internet para la subred publica. |
| Route Table publica | `lab4-public-route-table` | Define la ruta `0.0.0.0/0` hacia el Internet Gateway. |
| Route Table privada | `lab4-private-route-table` | Mantiene la subred privada sin ruta directa hacia Internet. |
| Security List publica | `lab4-public-security-list` | Permite acceso SSH, HTTP y HTTPS hacia la VM publica. |
| Security List privada | `lab4-private-security-list` | Permite comunicacion interna hacia SSH y MySQL/MariaDB. |
| Subred publica | `lab4-public-subnet` | Subred para la VM publica. |
| Subred privada | `lab4-private-subnet` | Subred para la VM privada de base de datos. |
| VM publica | `lab4-oci-vm` | Servidor para Flask y punto de administracion. |
| VM privada DB | `proyecto-final-db-vm` | Servidor destinado a MySQL/MariaDB. |

---

## 4. Direccionamiento

| Elemento | Direccionamiento |
|---|---|
| VCN | `10.0.0.0/16` |
| Subred publica | `10.0.1.0/24` |
| Subred privada | `10.0.2.0/24` |
| VM publica - IP publica | `129.80.190.44` |
| VM publica - IP privada | `10.0.1.176` |
| VM privada DB - IP privada | `10.0.2.45` |

La VM privada de base de datos fue creada con la asignacion de IP publica deshabilitada, por lo que solo es accesible por medio de la red interna de OCI.

---

## 5. Seguridad

La configuracion de seguridad separa el trafico externo del trafico interno.

En la subred publica, la VM `lab4-oci-vm` permite:

- SSH por el puerto `22`.
- HTTP por el puerto `80`.
- HTTPS por el puerto `443`.

En la subred privada, la VM `proyecto-final-db-vm`:

- No tiene IP publica.
- No queda expuesta directamente a Internet.
- Permite SSH desde la subred publica para administracion interna.
- Permite MySQL/MariaDB por el puerto `3306` desde la subred publica `10.0.1.0/24`.

Con esta configuracion, la base de datos queda protegida de conexiones externas directas. La aplicacion Flask se comunica con la base de datos mediante la IP privada `10.0.2.45`.

---

## 6. Archivos Terraform

| Archivo | Descripcion |
|---|---|
| `provider.tf` | Define la version minima de Terraform y configura el proveedor de Oracle Cloud Infrastructure. |
| `variables.tf` | Declara las variables utilizadas para tenancy, usuario, fingerprint, region, llave API y compartimento. |
| `terraform.tfvars` | Contiene valores locales reales para ejecutar Terraform. No debe incluirse en el informe ni compartirse por contener datos sensibles. |
| `network.tf` | Define VCN, Internet Gateway, route tables, security lists, subred publica y subred privada. |
| `compute.tf` | Define la VM publica `lab4-oci-vm` en la subred publica. |
| `compute-db.tf` | Define la VM privada `proyecto-final-db-vm` en la subred privada, sin IP publica. |
| `outputs.tf` | Expone salidas relevantes como nombres de VM, IP publica de la VM principal e IP privada de la VM DB. |

---

## 7. Flujo de despliegue

El despliegue se realizo siguiendo el flujo normal de Terraform:

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
```

Primero se valido el formato y la sintaxis de la configuracion. Luego se reviso el plan de ejecucion antes de aplicar cambios en OCI. Finalmente, se ejecutaron los `apply` necesarios para crear la red publica, la red privada, la VM publica y la VM privada de base de datos.

---

## 8. Validaciones realizadas

Durante la implementacion se realizaron las siguientes validaciones:

| Validacion | Estado | Observacion |
|---|---|---|
| `terraform validate` | OK | La configuracion fue validada correctamente. |
| `terraform plan` | OK | El plan fue revisado antes de aplicar cambios. |
| `terraform apply` | OK | La infraestructura fue creada mediante Terraform. |
| `terraform state list` | OK | Los recursos principales quedaron registrados en el estado de Terraform. |
| VM publica creada | OK | `lab4-oci-vm` fue creada en la subred publica. |
| VM privada DB creada | OK | `proyecto-final-db-vm` fue creada en la subred privada. |
| VM privada sin IP publica | OK | La VM DB fue creada con `assign_public_ip = false`. |
| Validacion SSH final | OK | El acceso SSH hacia la VM publica fue validado correctamente. |
| Conectividad privada final | OK | La comunicacion desde la VM publica hacia `10.0.2.45` fue validada correctamente. |

Recursos esperados en el estado de Terraform:

```text
oci_core_vcn.lab4_vcn
oci_core_internet_gateway.lab4_internet_gateway
oci_core_route_table.lab4_public_route_table
oci_core_route_table.lab4_private_route_table
oci_core_security_list.lab4_public_security_list
oci_core_security_list.lab4_private_security_list
oci_core_subnet.lab4_public_subnet
oci_core_subnet.lab4_private_subnet
oci_core_instance.lab4_vm
oci_core_instance.proyecto_final_db_vm
```

La validacion final confirmo que la infraestructura desplegada coincide con el estado esperado en Terraform y con la arquitectura documentada.

---

## 9. Entrega a Emanuel

La infraestructura queda preparada para que Emanuel realice la instalacion y configuracion del software.

Elementos entregados:

- VM publica `lab4-oci-vm`, destinada a hospedar Flask.
- VM privada `proyecto-final-db-vm`, destinada a hospedar MySQL/MariaDB.
- IP privada de base de datos: `10.0.2.45`.
- Puerto esperado para MySQL/MariaDB: `3306`.
- Regla de seguridad ya preparada para permitir conexion desde la subred publica hacia la VM privada por el puerto `3306`.

Actividades de software asignadas a Emanuel:

- Instalar MySQL o MariaDB en la VM privada.
- Crear la base de datos `nombresdb`.
- Crear la tabla `nombres`.
- Instalar y configurar Flask en la VM publica.
- Configurar la aplicacion para conectarse a `10.0.2.45:3306`.

---

## 10. Evidencias

| Nombre de evidencia | Archivo sugerido | Estado | Descripcion |
|---|---|---|---|
| Validacion Terraform | `01_terraform_validate_ok.png` | LISTA | Muestra `terraform validate` ejecutado correctamente. |
| Plan Terraform | `02_terraform_plan_vm_publica_ok.png` | LISTA | Evidencia del plan inicial de infraestructura. |
| Apply infraestructura base | `03_terraform_apply_vm_publica_ok.png` | LISTA | Evidencia de creacion inicial de recursos base. |
| VCN en OCI | `04_oci_vcn.png` | PENDIENTE | Debe mostrar `lab4-vcn`, CIDR `10.0.0.0/16` y estado. |
| Subred publica | `05_oci_subred_publica.png` | PENDIENTE | Debe mostrar `lab4-public-subnet` y CIDR `10.0.1.0/24`. |
| Subred privada | `06_oci_subred_privada.png` | PENDIENTE | Debe mostrar `lab4-private-subnet`, CIDR `10.0.2.0/24` y prohibicion de IP publica. |
| VM publica | `07_oci_vm_publica.png` | PENDIENTE | Debe mostrar `lab4-oci-vm`, IP publica `129.80.190.44` e IP privada `10.0.1.176`. |
| VM privada DB | `08_oci_vm_privada_db.png` | PENDIENTE | Debe mostrar `proyecto-final-db-vm`, IP privada `10.0.2.45` y ausencia de IP publica. |
| SSH VM publica | `09_ssh_vm_publica.png` | LISTA | Debe mostrar el acceso SSH exitoso hacia `lab4-oci-vm`. |
| Conexion interna VM publica a DB | `10_conexion_vm_a_db.png` | LISTA | Debe mostrar la prueba hacia `10.0.2.45` desde la VM publica. |
| Formulario web | `11_web_formulario.png` | PENDIENTE | Evidencia del formulario de la aplicacion Flask. |
| Confirmacion web | `12_web_confirmacion.png` | PENDIENTE | Evidencia de insercion desde la aplicacion. |
| Consulta MySQL | `13_select_mysql.png` | PENDIENTE | Evidencia de registros guardados en base de datos. |
| Apply VM privada DB | `14_terraform_apply_vm_privada_db.png` | PENDIENTE | Debe mostrar `1 added, 0 changed, 0 destroyed` para la VM privada DB. |
| Outputs finales | `15_terraform_outputs_finales.png` | PENDIENTE | Debe mostrar outputs con VM publica, VM privada e IP `10.0.2.45`. |

---

# Desarrollo de la Infraestructura en Oracle Cloud con Terraform

## Implementacion de la infraestructura

La infraestructura del Proyecto Final se desarrollo tomando como base el trabajo realizado en el Laboratorio 4. A partir de esa configuracion inicial, enfocada en la creacion de una maquina virtual en Oracle Cloud Infrastructure, se evoluciono la arquitectura hasta cumplir los requerimientos del proyecto final: separar la capa publica de aplicacion y la capa privada destinada a la base de datos.

El componente central de red fue una Virtual Cloud Network con el bloque `10.0.0.0/16`. Dentro de esta VCN se definieron dos subredes con funciones claramente diferenciadas. La subred publica `10.0.1.0/24` fue utilizada para ubicar la maquina virtual `lab4-oci-vm`, la cual cuenta con IP publica y funciona como punto de entrada para administracion y despliegue de la aplicacion Flask. La subred privada `10.0.2.0/24` fue utilizada para ubicar la maquina virtual `proyecto-final-db-vm`, destinada a alojar MySQL/MariaDB y configurada sin IP publica.

La separacion entre ambas subredes permite que la aplicacion se comunique internamente con la base de datos, sin exponer directamente el servidor de base de datos a Internet. Para habilitar este modelo, se configuraron reglas de seguridad especificas: la subred publica permite trafico SSH, HTTP y HTTPS hacia la VM publica, mientras que la subred privada permite trafico interno hacia SSH y hacia el puerto `3306` desde la subred publica. De esta forma, el acceso a la base de datos queda restringido al trafico proveniente de la red interna del proyecto.

## Validacion de Terraform

La configuracion de Terraform fue validada exitosamente mediante `terraform validate`, confirmando que los archivos de infraestructura estaban correctamente definidos. Posteriormente, `terraform apply` creo los recursos requeridos en Oracle Cloud Infrastructure, incluyendo la VCN, subredes, tablas de rutas, listas de seguridad y las dos maquinas virtuales del proyecto.

Como parte de la revision final, se ejecuto `terraform plan` y el resultado fue:

```text
No changes. Your infrastructure matches the configuration.
```

Este resultado confirma que la infraestructura desplegada en OCI coincide con el codigo Terraform. Adicionalmente, el Terraform State contiene todos los recursos esperados: VCN, Internet Gateway, route tables, security lists, subred publica, subred privada, VM publica y VM privada para base de datos.

## Incidentes encontrados durante el desarrollo

Durante la creacion de la VM privada para base de datos se presento un error de cuota de OCI:

```text
400-LimitExceeded
standard-e2-micro-core-count
```

El incidente se relaciono con la existencia de una maquina virtual antigua del Laboratorio 3, la cual seguia consumiendo cuota de la cuenta Student. Para liberar capacidad, se elimino la instancia anterior y tambien su Boot Volume. Una vez liberada la cuota, Terraform pudo crear correctamente la VM privada `proyecto-final-db-vm`.

Tambien se presento un inconveniente temporal de acceso SSH hacia la VM publica, identificado mediante el mensaje:

```text
Connection timed out during banner exchange
```

El diagnostico mostro que el puerto `22` respondia a nivel TCP, pero el servicio SSH no completaba el intercambio inicial. La conectividad quedo restablecida despues de revisar la llave utilizada para la autenticacion y realizar un reinicio normal de la instancia publica desde OCI.

## Validaciones operativas finales

Luego del reinicio normal de la VM publica, el acceso SSH hacia `lab4-oci-vm` fue validado exitosamente. La autenticacion con llave funciono correctamente y fue posible ejecutar comandos remotos en la instancia publica.

Desde la VM publica se valido la comunicacion hacia la VM privada `proyecto-final-db-vm` mediante la IP `10.0.2.45`. La prueba ICMP respondio correctamente con `0% packet loss`, y tambien se valido conectividad TCP hacia el puerto `22` de la VM privada. Ademas, se verifico el acceso SSH interno hacia la VM privada utilizando la VM publica como punto de salto, obteniendo la respuesta esperada:

```text
db-ok
```

Finalmente, `terraform plan` confirmo que no existian diferencias entre la infraestructura real y la configuracion declarada en Terraform. Con esto se comprobo que la implementacion coincide con la documentacion tecnica y con el codigo de infraestructura.

## Conclusion

La infraestructura quedo completamente operativa y validada. La arquitectura en OCI cumple con la separacion entre capa publica y capa privada, mantiene la base de datos protegida de Internet y permite la comunicacion interna necesaria entre la aplicacion y la base de datos.

Con esta validacion, la infraestructura quedo preparada para que Emanuel realizara la instalacion de MySQL/MariaDB en la VM privada y el despliegue de la aplicacion Flask en la VM publica.

---

## 11. Conclusion

La infraestructura del Proyecto Final FCN quedo desplegada mediante Terraform en Oracle Cloud Infrastructure. Se creo una arquitectura con red publica y red privada, una VM publica para la aplicacion Flask y una VM privada para la base de datos MySQL/MariaDB.

La configuracion de red protege la base de datos al mantenerla sin IP publica y permitir el acceso al puerto `3306` solamente desde la subred publica. Con esto, la infraestructura queda preparada para soportar la aplicacion y la base de datos del Proyecto Final.

La validacion SSH final y la prueba de conectividad privada hacia `10.0.2.45` fueron completadas correctamente, por lo que la infraestructura queda descrita como completamente implementada y validada.
