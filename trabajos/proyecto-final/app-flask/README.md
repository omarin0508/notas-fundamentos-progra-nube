# Aplicacion Flask del proyecto final

Esta carpeta contiene el codigo Python/Flask usado para el formulario web del proyecto final.

## Archivos

- `app.py`: aplicacion Flask que muestra el formulario, consulta usuarios e inserta registros en MariaDB.
- `requirements.txt`: dependencias de Python.
- `.env.example`: plantilla de variables de entorno. No subir un `.env` real con credenciales.

## Ejecucion local o en VM

```bash
python3 -m pip install -r requirements.txt
cp .env.example .env
python3 app.py
```

En la VM del proyecto se uso `PORT=80` para exponer la aplicacion por HTTP.
