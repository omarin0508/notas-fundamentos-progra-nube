# Entrega completa para Nathalie

Esta carpeta contiene el documento consolidado y las 15 figuras listas para insertar.

## Documento

Archivo principal:

`Natalia-Emanuel-Oscar-Proyecto-Final-Infraestructura.md`

## Carpeta de capturas

Todas las figuras estan en:

`capturas/`

## Relacion de figuras

| Figura | Archivo |
|---:|---|
| 1 | `capturas/figura_01_infraestructura_oci.png` |
| 2 | `capturas/figura_02_vcn.png` |
| 3 | `capturas/figura_03_subred_publica.png` |
| 4 | `capturas/figura_04_subred_privada.png` |
| 5 | `capturas/figura_05_vm_publica.png` |
| 6 | `capturas/figura_06_vm_privada_db.png` |
| 7 | `capturas/figura_07_security_lists.png` |
| 8 | `capturas/figura_08_route_tables.png` |
| 9 | `capturas/figura_09_terraform_apply_exitoso.png` |
| 10 | `capturas/figura_10_terraform_plan_no_changes.png` |
| 11 | `capturas/figura_11_terraform_state.png` |
| 12 | `capturas/figura_12_terraform_outputs.png` |
| 13 | `capturas/figura_13_ssh_vm_publica.png` |
| 14 | `capturas/figura_14_comunicacion_vm_publica_a_db.png` |
| 15 | `capturas/figura_15_ssh_interno_db_ok.png` |
| 16 | `capturas/figura_16_provider_variables_tf.png` |
| 17 | `capturas/figura_17_network_tf.png` |
| 18 | `capturas/figura_18_compute_tf.png` |
| 19 | `capturas/figura_19_outputs_tf.png` |
| 20 | `capturas/figura_20_terraform_init.png` |
| 21 | `capturas/figura_21_terraform_validate.png` |
| 22 | `capturas/figura_22_terraform_plan_ok.png` |
| 23 | `capturas/figura_23_terraform_apply_complete_original.png` |
| 24 | `capturas/figura_24_aplicacion_flask_formulario.png` |

## Instruccion para integrar

En el documento, cada espacio aparece como:

```text
> **[Insertar aqui la Figura X]**
```

Reemplazar ese espacio por la imagen correspondiente de la tabla anterior.

## Nota

Las figuras contienen los datos reales de la infraestructura desplegada y validada:

- VCN `10.0.0.0/16`
- Subred publica `10.0.1.0/24`
- Subred privada `10.0.2.0/24`
- VM publica `lab4-oci-vm`
- VM privada `proyecto-final-db-vm`
- IP privada DB `10.0.2.45`
- Validacion `terraform plan` sin cambios
- Validacion de conectividad `db-ok`
- Evidencias del codigo Terraform utilizado
- Evidencias del flujo `init`, `validate`, `plan` y `apply`
