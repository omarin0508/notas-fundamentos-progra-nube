from flask import Flask, redirect, render_template_string, request, url_for
from dotenv import load_dotenv
import os
import re
import time
import unicodedata

import pymysql

load_dotenv()

app = Flask(__name__)


def get_connection():
    return pymysql.connect(
        host=os.getenv("DB_HOST", "10.0.2.45"),
        port=int(os.getenv("DB_PORT", "3306")),
        user=os.getenv("DB_USER", "flaskuser"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "proyecto_final"),
        cursorclass=pymysql.cursors.DictCursor,
        autocommit=True,
    )


def generar_correo(nombre):
    normalizado = unicodedata.normalize("NFKD", nombre)
    ascii_nombre = normalizado.encode("ascii", "ignore").decode("ascii")
    slug = re.sub(r"[^a-z0-9]+", ".", ascii_nombre.lower()).strip(".")
    slug = slug or "usuario"
    return f"{slug}.{int(time.time())}@example.com"


def obtener_usuarios():
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("SELECT id, nombre, correo FROM usuarios ORDER BY id")
            return cursor.fetchall()


@app.route("/", methods=["GET", "POST"])
def index():
    mensaje = request.args.get("mensaje", "")
    error = ""

    if request.method == "POST":
        nombre = request.form.get("nombre", "").strip()
        if not nombre:
            error = "El nombre es obligatorio"
        else:
            correo = generar_correo(nombre)
            with get_connection() as connection:
                with connection.cursor() as cursor:
                    cursor.execute(
                        "INSERT INTO usuarios (nombre, correo) VALUES (%s, %s)",
                        (nombre, correo),
                    )
            return redirect(url_for("index", mensaje="Nombre guardado correctamente"))

    usuarios = obtener_usuarios()
    return render_template_string(
        """
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <title>Proyecto Final - Usuarios</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 40px; color: #1f2937; }
    form { margin: 0 0 24px; display: flex; gap: 10px; align-items: end; flex-wrap: wrap; }
    label { display: grid; gap: 6px; font-weight: 700; }
    input { padding: 9px 10px; min-width: 260px; border: 1px solid #9ca3af; }
    button { padding: 10px 16px; border: 0; background: #2563eb; color: white; font-weight: 700; cursor: pointer; }
    table { border-collapse: collapse; min-width: 520px; }
    th, td { border: 1px solid #d1d5db; padding: 10px 12px; text-align: left; }
    th { background: #f3f4f6; }
    .mensaje { color: #047857; font-weight: 700; margin: 0 0 16px; }
    .error { color: #b91c1c; font-weight: 700; margin: 0 0 16px; }
  </style>
</head>
<body>
  <h1>Usuarios</h1>

  {% if mensaje %}<p class="mensaje">{{ mensaje }}</p>{% endif %}
  {% if error %}<p class="error">{{ error }}</p>{% endif %}

  <form method="post">
    <label>
      Nombre
      <input type="text" name="nombre" required maxlength="100" autocomplete="name">
    </label>
    <button type="submit">Guardar</button>
  </form>

  <table>
    <thead>
      <tr><th>ID</th><th>Nombre</th><th>Correo</th></tr>
    </thead>
    <tbody>
      {% for usuario in usuarios %}
      <tr>
        <td>{{ usuario.id }}</td>
        <td>{{ usuario.nombre }}</td>
        <td>{{ usuario.correo }}</td>
      </tr>
      {% endfor %}
    </tbody>
  </table>
</body>
</html>
        """,
        usuarios=usuarios,
        mensaje=mensaje,
        error=error,
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "5000")))
