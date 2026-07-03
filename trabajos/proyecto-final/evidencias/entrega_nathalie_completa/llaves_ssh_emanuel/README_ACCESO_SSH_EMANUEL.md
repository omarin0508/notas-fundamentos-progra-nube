# Acceso SSH para Emanuel

Esta carpeta contiene la llave necesaria para ingresar por SSH a la infraestructura del Proyecto Final FCN.

## Archivos

- `lab4_oci_vm_key_emanuel`: llave privada para SSH.
- `lab4_oci_vm_key_emanuel.pub`: llave publica asociada.

## VM publica

Nombre: `lab4-oci-vm`

IP publica: `129.80.190.44`

Usuario: `opc`

Comando desde PowerShell, ubicado en esta carpeta:

```powershell
ssh -i .\lab4_oci_vm_key_emanuel opc@129.80.190.44
```

Comando desde Git Bash o Linux/macOS:

```bash
ssh -i ./lab4_oci_vm_key_emanuel opc@129.80.190.44
```

## VM privada de base de datos

Nombre: `proyecto-final-db-vm`

IP privada: `10.0.2.45`

La VM privada no tiene IP publica. Se accede pasando por la VM publica:

```bash
ssh -i ./lab4_oci_vm_key_emanuel -J opc@129.80.190.44 opc@10.0.2.45
```

## Nota de seguridad

No subir la llave privada al informe, GitHub, chats publicos ni capturas. Compartirla solo de forma privada con Emanuel.

Si OpenSSH muestra una advertencia de permisos en Windows, corregir permisos sobre la llave privada antes de conectarse.
