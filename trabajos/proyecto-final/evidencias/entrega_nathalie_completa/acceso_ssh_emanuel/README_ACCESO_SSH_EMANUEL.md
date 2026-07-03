# Acceso SSH para Emanuel

Esta carpeta contiene la llave SSH necesaria para administrar las VM del Proyecto Final.

## Archivos

- `lab4_oci_vm_key`: llave privada SSH. No publicarla ni subirla a repositorios.
- `lab4_oci_vm_key.pub`: llave publica asociada.

## VM publica

Nombre: `lab4-oci-vm`

IP publica: `129.80.190.44`

Usuario SSH: `opc`

Comando desde Linux, macOS o Git Bash:

```bash
chmod 600 lab4_oci_vm_key
ssh -i lab4_oci_vm_key opc@129.80.190.44
```

Comando desde Windows PowerShell, ejecutando desde esta carpeta:

```powershell
ssh -i .\lab4_oci_vm_key opc@129.80.190.44
```

## VM privada DB

Nombre: `proyecto-final-db-vm`

IP privada: `10.0.2.45`

La VM privada no tiene IP publica. Se accede usando la VM publica como salto:

```bash
ssh -i lab4_oci_vm_key -J opc@129.80.190.44 opc@10.0.2.45
```

Comando alternativo con ProxyCommand:

```bash
ssh -i lab4_oci_vm_key -o ProxyCommand="ssh -i lab4_oci_vm_key -W %h:%p opc@129.80.190.44" opc@10.0.2.45
```

## Nota de seguridad

Compartir esta carpeta solo por un canal privado. No incluir la llave privada en el informe final.
