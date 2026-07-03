# Comandos para capturas pendientes

Ejecutar estos comandos solo para tomar capturas de evidencia. No modifican infraestructura.

## Figura 10 - Terraform Plan sin cambios

Ruta:

```powershell
cd "C:\Users\Oscar Marin\notas-fundamentos-nube\trabajos\proyecto-final\terraform"
```

Comando:

```powershell
terraform plan
```

Debe verse:

```text
No changes. Your infrastructure matches the configuration.
```

Guardar captura como:

```text
figura_10_terraform_plan_no_changes.png
```

## Figura 11 - Terraform State

Ruta:

```powershell
cd "C:\Users\Oscar Marin\notas-fundamentos-nube\trabajos\proyecto-final\terraform"
```

Comando:

```powershell
terraform state list
```

Debe verse:

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

Guardar captura como:

```text
figura_11_terraform_state.png
```

## Figura 12 - Terraform Outputs

Ruta:

```powershell
cd "C:\Users\Oscar Marin\notas-fundamentos-nube\trabajos\proyecto-final\terraform"
```

Comando:

```powershell
terraform output
```

Debe verse:

```text
db_vm_name = "proyecto-final-db-vm"
db_vm_private_ip = "10.0.2.45"
instance_public_ip = "129.80.190.44"
vm_name = "lab4-oci-vm"
```

Guardar captura como:

```text
figura_12_terraform_outputs.png
```

## Figura 14 - Comunicacion VM publica a VM privada

Desde la VM publica `lab4-oci-vm`, ejecutar:

```bash
ping -c 4 10.0.2.45
```

Debe verse:

```text
4 packets transmitted, 4 received, 0% packet loss
```

Guardar captura como:

```text
figura_14_comunicacion_vm_publica_a_db.png
```

## Figura 15 - Acceso SSH interno a la VM privada

Desde la validacion realizada, la salida esperada fue:

```text
db-ok
```

Si se repite la prueba con salto SSH, guardar la captura como:

```text
figura_15_ssh_interno_db_ok.png
```
