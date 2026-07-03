# Evidencias para informe final - Proyecto Final FCN

Ruta de evidencias organizadas:

`trabajos/proyecto-final/evidencias/`

Para el documento consolidado `Natalia-Emanuel-Oscar-Proyecto-Final-Infraestructura.md`, usar el mapa de figuras ubicado en:

`trabajos/proyecto-final/evidencias/figuras_documento/README_figuras_para_nathalie.md`

## Evidencias listas y pendientes

| Numero | Archivo | Descripcion | Estado | Uso sugerido en el informe |
|---:|---|---|---|---|
| 01 | `01_terraform_validate_ok.png` | Validacion correcta de Terraform. | LISTA | Seccion de validacion de infraestructura como codigo. |
| 02 | `02_terraform_plan_vm_publica_ok.png` | Plan de Terraform exitoso para la infraestructura base con VM publica. | LISTA | Antecedente de despliegue inicial desde Lab 4. |
| 03 | `03_terraform_apply_vm_publica_ok.png` | Apply exitoso de la infraestructura base con red publica y VM publica. | LISTA | Evidencia de creacion inicial de recursos OCI. |
| 04 | `04_oci_vcn.png` | Vista de la VCN del proyecto en Oracle Cloud. | PENDIENTE | Seccion de arquitectura de red. |
| 05 | `05_oci_subred_publica.png` | Vista de la subred publica en OCI. | PENDIENTE | Explicar acceso publico hacia la VM principal. |
| 06 | `06_oci_subred_privada.png` | Vista de la subred privada `10.0.2.0/24` en OCI. | PENDIENTE | Explicar aislamiento de la capa de base de datos. |
| 07 | `07_oci_vm_publica.png` | Vista de la VM publica creada en OCI. | PENDIENTE | Seccion de computo publico y punto de entrada. |
| 08 | `08_oci_vm_privada_db.png` | Vista de la VM privada de base de datos `proyecto-final-db-vm`. | PENDIENTE | Seccion de base de datos privada y aislamiento sin IP publica. |
| 09 | `09_ssh_vm_publica.png` | Conexion SSH exitosa a la VM publica Oracle Linux. | LISTA | Validacion de acceso administrativo a la VM publica. |
| 10 | `10_conexion_vm_a_db.png` | Prueba de conexion desde la VM publica hacia la VM/base de datos privada. | PENDIENTE | Validacion de comunicacion interna entre capas. |
| 11 | `11_web_formulario.png` | Formulario web de la aplicacion. | LISTA | Seccion de aplicacion desplegada. |
| 12 | `12_web_confirmacion.png` | Confirmacion web luego de insertar datos. | PENDIENTE | Flujo funcional de la aplicacion. |
| 13 | `13_select_mysql.png` | Consulta `SELECT` mostrando datos guardados en MySQL/MariaDB. | PENDIENTE | Evidencia final de persistencia en base de datos. |
| 14 | `14_terraform_apply_vm_privada_db.png` | Apply final donde se crea la VM privada DB con `1 added, 0 changed, 0 destroyed`. | PENDIENTE | Evidencia de despliegue Terraform de la capa privada de base de datos. |
| 15 | `15_terraform_outputs_finales.png` | Outputs finales con VM publica, VM privada DB e IP privada `10.0.2.45`. | PENDIENTE | Resumen tecnico de infraestructura entregada. |

## Capturas copiadas

| Original | Copia organizada |
|---|---|
| `capturas/16-terraform-validate.png` | `evidencias/01_terraform_validate_ok.png` |
| `capturas/23-terraform-plan-ok.png` | `evidencias/02_terraform_plan_vm_publica_ok.png` |
| `capturas/25-terraform-apply-complete.png` | `evidencias/03_terraform_apply_vm_publica_ok.png` |
| `capturas/26-ssh-oracle-linux-ok.png` | `evidencias/09_ssh_vm_publica.png` |
| Captura real de `http://129.80.190.44/` | `evidencias/11_web_formulario.png` |

## Capturas no copiadas por seguridad

No se copiaron evidencias que muestran datos sensibles o administrativos, como API keys, `terraform.tfvars`, rutas de llaves, OCIDs de usuario/compartimento o configuracion local de credenciales.
