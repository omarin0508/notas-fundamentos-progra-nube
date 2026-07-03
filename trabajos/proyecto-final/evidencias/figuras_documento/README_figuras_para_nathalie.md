# Mapa de figuras para Nathalie

Documento base:

`Natalia-Emanuel-Oscar-Proyecto-Final-Infraestructura.md`

Carpeta de trabajo para insertar capturas:

`trabajos/proyecto-final/evidencias/figuras_documento/`

## Figuras del documento

| Figura | Titulo en el documento | Archivo a usar | Estado | Donde obtenerla / que debe verse |
|---:|---|---|---|---|
| 1 | Infraestructura creada en Oracle Cloud | `figura_01_infraestructura_oci.png` | PENDIENTE | Oracle Cloud > vista general del compartimento o recursos. Debe verse un resumen de la VCN, subredes y maquinas virtuales del proyecto. |
| 2 | VCN | `figura_02_vcn.png` | PENDIENTE | Oracle Cloud > Networking > Virtual Cloud Networks > `lab4-vcn`. Debe verse nombre, CIDR `10.0.0.0/16` y estado. |
| 3 | Subred publica | `figura_03_subred_publica.png` | PENDIENTE | Oracle Cloud > VCN `lab4-vcn` > Subnets > `lab4-public-subnet`. Debe verse CIDR `10.0.1.0/24`. |
| 4 | Subred privada | `figura_04_subred_privada.png` | PENDIENTE | Oracle Cloud > VCN `lab4-vcn` > Subnets > `lab4-private-subnet`. Debe verse CIDR `10.0.2.0/24` y que no permite IP publica. |
| 5 | Maquina virtual publica | `figura_05_vm_publica.png` | PENDIENTE | Oracle Cloud > Compute > Instances > `lab4-oci-vm`. Debe verse IP publica `129.80.190.44` e IP privada `10.0.1.176`. |
| 6 | Maquina virtual privada | `figura_06_vm_privada_db.png` | PENDIENTE | Oracle Cloud > Compute > Instances > `proyecto-final-db-vm`. Debe verse IP privada `10.0.2.45` y ausencia de IP publica. |
| 7 | Security Lists | `figura_07_security_lists.png` | PENDIENTE | Oracle Cloud > VCN `lab4-vcn` > Security Lists. Deben verse reglas para SSH, HTTP, HTTPS y MySQL/MariaDB `3306`. |
| 8 | Route Tables | `figura_08_route_tables.png` | PENDIENTE | Oracle Cloud > VCN `lab4-vcn` > Route Tables. Debe verse ruta publica hacia Internet Gateway y tabla privada sin exposicion directa. |
| 9 | Terraform Apply exitoso | `figura_09_terraform_apply_exitoso.png` | LISTA | Ya copiada desde `capturas/25-terraform-apply-complete.png`. Insertar en Figura 9. |
| 10 | Terraform Plan sin cambios | `figura_10_terraform_plan_no_changes.png` | PENDIENTE | Terminal en `trabajos/proyecto-final/terraform` ejecutando `terraform plan`. Debe verse `No changes. Your infrastructure matches the configuration.` |
| 11 | Terraform State | `figura_11_terraform_state.png` | PENDIENTE | Terminal en `trabajos/proyecto-final/terraform` ejecutando `terraform state list`. Deben verse VCN, IGW, route tables, security lists, subredes y ambas VM. |
| 12 | Terraform Outputs | `figura_12_terraform_outputs.png` | PENDIENTE | Terminal en `trabajos/proyecto-final/terraform` ejecutando `terraform output`. Deben verse VM publica, VM privada e IP `10.0.2.45`. |
| 13 | Conexion SSH a la VM publica | `figura_13_ssh_vm_publica.png` | LISTA | Ya copiada desde `capturas/26-ssh-oracle-linux-ok.png`. Insertar en Figura 13 si Nathalie acepta la evidencia de SSH existente. |
| 14 | Comunicacion VM publica a VM privada | `figura_14_comunicacion_vm_publica_a_db.png` | PENDIENTE | Terminal mostrando `ping -c 4 10.0.2.45` desde la VM publica. Debe verse `4 received` y `0% packet loss`. |
| 15 | Acceso SSH interno a la VM privada | `figura_15_ssh_interno_db_ok.png` | PENDIENTE | Terminal mostrando acceso interno a la VM privada y salida `db-ok`. |
| 24 | Aplicacion Flask con formulario | `figura_24_aplicacion_flask_formulario.png` | LISTA | Navegador mostrando `http://129.80.190.44/`, el formulario de usuarios y registros almacenados en MariaDB. |

## Capturas ya disponibles en esta carpeta

- `figura_09_terraform_apply_exitoso.png`
- `figura_13_ssh_vm_publica.png`
- `extra_terraform_validate_ok.png`
- `figura_24_aplicacion_flask_formulario.png`

## Capturas originales relacionadas

Estas capturas originales se mantienen sin mover en:

`trabajos/proyecto-final/capturas/`

- `16-terraform-validate.png`
- `23-terraform-plan-ok.png`
- `25-terraform-apply-complete.png`
- `26-ssh-oracle-linux-ok.png`

## Nota para insertar en el documento

En el documento `Natalia-Emanuel-Oscar-Proyecto-Final-Infraestructura.md`, cada espacio aparece como:

```text
> **[Insertar aqui la Figura X]**
```

Nathalie solo debe reemplazar cada espacio por la imagen correspondiente de esta carpeta.
