# Validacion Operativa de Infraestructura - Proyecto Final FCN

## Alcance

Validacion de la infraestructura final del Proyecto Final FCN despues de agregar salida controlada a Internet desde la subred privada mediante Terraform.

## Resultado general

La infraestructura declarada en Terraform coincide con los recursos existentes en OCI. Se agrego un NAT Gateway para permitir salida controlada a Internet desde la subred privada, manteniendo la VM privada sin IP publica y sin acceso entrante desde Internet.

Resultado:

```text
No changes. Your infrastructure matches the configuration.
```

## Estado de las VM

| Recurso | Nombre | IP publica | IP privada | Estado | Observacion |
|---|---|---|---|---|---|
| VM publica | `lab4-oci-vm` | `129.80.190.44` | `10.0.1.176` | `RUNNING` | Tiene IP publica y privada. |
| VM privada DB | `proyecto-final-db-vm` | No posee | `10.0.2.45` | `RUNNING` | `public_ip = null` y `assign_public_ip = false`. |

## Estado de la VCN

| Recurso | CIDR | Estado |
|---|---:|---|
| `lab4-vcn` | `10.0.0.0/16` | `AVAILABLE` |

## Estado de las subredes

| Subred | CIDR | Estado | IP publica en VNIC | Ruta asociada | Security List |
|---|---:|---|---|---|---|
| `lab4-public-subnet` | `10.0.1.0/24` | `AVAILABLE` | Permitida | `lab4-public-route-table` | `lab4-public-security-list` |
| `lab4-private-subnet` | `10.0.2.0/24` | `AVAILABLE` | Prohibida | `lab4-private-route-table` | `lab4-private-security-list` |

## Estado de las Route Tables

| Route Table | Estado | Rutas |
|---|---|---|
| `lab4-public-route-table` | `AVAILABLE` | `0.0.0.0/0` hacia Internet Gateway. |
| `lab4-private-route-table` | `AVAILABLE` | `0.0.0.0/0` hacia NAT Gateway. |

## Estado de las Security Lists

### Security List publica

`lab4-public-security-list`

- Egreso: permitido hacia `0.0.0.0/0`.
- Ingreso TCP `22` desde `0.0.0.0/0`.
- Ingreso TCP `80` desde `0.0.0.0/0`.
- Ingreso TCP `443` desde `0.0.0.0/0`.

### Security List privada

`lab4-private-security-list`

- Egreso: permitido hacia `10.0.0.0/16`.
- Egreso: permitido hacia `0.0.0.0/0` para salida mediante NAT Gateway.
- Ingreso ICMP desde `10.0.0.0/16`.
- Ingreso TCP `22` desde `10.0.1.0/24`.
- Ingreso TCP `3306` desde `10.0.1.0/24`.

La regla TCP `3306` existe y permite la futura comunicacion MySQL/MariaDB desde la subred publica hacia la VM privada. MySQL/MariaDB todavia no esta instalado, por lo que no se espera un servicio activo en ese puerto.

## Ajuste de salida controlada desde subred privada

Se agrego el recurso `oci_core_nat_gateway.lab4_nat_gateway` para permitir salida controlada a Internet desde la subred privada. La tabla de rutas privada `lab4-private-route-table` envia el destino `0.0.0.0/0` hacia el NAT Gateway, y la security list privada permite egreso hacia `0.0.0.0/0`.

La VM privada `proyecto-final-db-vm` continua sin IP publica, con `assign_public_ip = false`, y la subred privada mantiene `prohibit_public_ip_on_vnic = true`. No se abrio acceso entrante desde Internet hacia la VM privada. El cambio permite instalar MySQL/MariaDB desde los repositorios de Oracle Linux y Terraform quedo nuevamente validado.

## Pruebas de conectividad

### Desde equipo local hacia VM publica

Prueba TCP y SSH al puerto `22` de la VM publica:

```text
TcpTestSucceeded: True
ssh opc@129.80.190.44 "echo ok"
ok
```

Esto confirma que el puerto `22` de la VM publica es alcanzable desde el equipo local y que la autenticacion SSH con llave funciona correctamente.

### SSH a VM publica

Despues del reboot normal de la VM publica realizado desde OCI Console, el acceso SSH fue validado correctamente.

Resultado:

```text
Authenticated to 129.80.190.44 using publickey.
ok
```

Interpretacion:

- La conexion llega correctamente a la VM publica.
- El servidor SSH responde correctamente despues del reboot.
- La llave SSH fue aceptada.
- Es posible ejecutar comandos remotos en la VM publica.

### Desde VM publica hacia VM privada

Se ejecuto una prueba desde la VM publica hacia la IP privada de la VM DB `10.0.2.45`.

Resultado de ICMP:

```text
PING 10.0.2.45 (10.0.2.45) 56(84) bytes of data.
64 bytes from 10.0.2.45: icmp_seq=1 ttl=64 time=0.495 ms
64 bytes from 10.0.2.45: icmp_seq=2 ttl=64 time=0.449 ms
64 bytes from 10.0.2.45: icmp_seq=3 ttl=64 time=0.566 ms
64 bytes from 10.0.2.45: icmp_seq=4 ttl=64 time=0.485 ms

--- 10.0.2.45 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss
```

Resultado de TCP hacia SSH:

```text
TCP_22_DB_OK
```

Resultado de SSH hacia la VM privada usando la VM publica como salto:

```text
db-ok
```

Interpretacion:

- La VM publica puede alcanzar la VM privada por la red interna.
- La ruta entre subred publica y subred privada funciona correctamente dentro de la VCN.
- La regla de seguridad privada permite el trafico esperado hacia la VM DB.
- La VM privada esta disponible para la siguiente fase de instalacion de MySQL/MariaDB.

## Terraform plan

Resultado de `terraform plan`:

```text
No changes. Your infrastructure matches the configuration.
```

No existen recursos Terraform pendientes.

## Veredicto tecnico

La infraestructura queda consistente en Terraform y OCI, con ambas VM en estado `RUNNING`, red publica y privada disponibles, reglas de seguridad correctas y sin cambios pendientes en `terraform plan`.

La validacion operativa final fue completada correctamente:

- SSH hacia la VM publica funcionando.
- Conectividad ICMP desde la VM publica hacia la VM privada funcionando.
- TCP `22` hacia la VM privada funcionando.
- SSH hacia la VM privada funcionando mediante salto por la VM publica.
- Salida a Internet desde la VM privada funcionando mediante NAT Gateway.

Veredicto actual:

```text
La infraestructura quedo completamente validada y lista para la instalacion de MySQL/MariaDB y el desarrollo de la aplicacion Flask.
```
