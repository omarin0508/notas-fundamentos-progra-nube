# Fundamentos de Programacion en la Nube

**Alumno:** Oscar Marin Zamora

Repositorio de trabajo para organizar notas, laboratorios, evidencias, recursos, PDFs y entregas del curso.

## Diagnostico actual

La estructura base ya esta creada y coincide parcialmente con la organizacion objetivo:

- `notas/` contiene apuntes Markdown de clase (`clase-01.md` a `clase-10.md`).
- `pdf/` contiene PDFs finales de algunas clases.
- `laboratorios/lab-01-cloud-vm/` ya usa una estructura adecuada con `README.md`, `evidencias/`, `recursos/` y PDFs.
- `recursos/`, `trabajos/` y `capturas/` existen, pero aun no tienen una subdivision clara o archivos versionables.
- `.vscode/` ya contiene configuracion para exportar Markdown a PDF con la extension `markdown-pdf`.

Inconsistencias detectadas:

- Hay PDFs y HTML generados dentro de `notas/`, por ejemplo `clase-04.pdf`, `clase-04-evidencia-metadatos.pdf`, `clase-04-evidencia-metadatos.html`, `clase-06.pdf` y `clase-07_tmp.html`.
- Existe `pdf/clase-04.pdf` y tambien `notas/clase-04.pdf`; ambos tienen nombres parecidos, pero hashes distintos, por lo que no se deben reemplazar sin revisar su contenido.
- El laboratorio 01 guarda un PDF final en `laboratorios/lab-01-cloud-vm/pdf/`, mientras la estructura objetivo sugiere `informe.pdf` en la raiz del laboratorio. Ambas opciones son validas, pero conviene elegir una convencion.
- `capturas/` puede duplicar el rol de `laboratorios/*/evidencias/`. Se recomienda usar `capturas/` solo para imagenes generales no asociadas a un laboratorio.

## Estructura recomendada

```text
NOTAS-FUNDAMENTOS-NUBE/
+-- notas/
|   +-- clase-01.md
|   +-- clase-02.md
|   +-- ...
+-- pdf/
|   +-- clase-01.pdf
|   +-- clase-02.pdf
|   +-- ...
+-- laboratorios/
|   +-- lab-01-cloud-vm/
|   |   +-- README.md
|   |   +-- informe.md
|   |   +-- informe.pdf
|   |   +-- evidencias/
|   |   +-- recursos/
|   +-- lab-02-terraform-docker/
|   |   +-- main.tf
|   |   +-- README.md
|   |   +-- informe.md
|   |   +-- informe.pdf
|   |   +-- evidencias/
|   |   +-- recursos/
|   +-- plantilla-laboratorio/
+-- recursos/
|   +-- diapositivas/
|   +-- documentos/
|   +-- ejemplos/
+-- trabajos/
|   +-- tarea-01/
|   +-- tarea-02/
|   +-- proyecto-final/
+-- capturas/
+-- README.md
```

## Convenciones de organizacion

### Notas

- Guardar apuntes fuente en `notas/` con el formato `clase-XX.md`.
- Exportar PDFs finales de clases a `pdf/` con el formato `clase-XX.pdf`.
- Evitar guardar HTML temporales en `notas/`. Si se generan, moverlos a `recursos/documentos/` solo si sirven como evidencia; si son temporales, dejarlos fuera de Git.

### Laboratorios

Cada laboratorio debe tener su propia carpeta:

```text
laboratorios/lab-XX-nombre-corto/
+-- README.md
+-- informe.md
+-- informe.pdf
+-- evidencias/
+-- recursos/
```

- `README.md`: resumen del laboratorio, objetivos, herramientas usadas y enlaces internos.
- `informe.md`: documento principal que se entrega o exporta.
- `informe.pdf`: version PDF final del informe.
- `evidencias/`: capturas, resultados, pantallazos, logs relevantes y archivos de validacion.
- `recursos/`: archivos auxiliares usados para completar el laboratorio.

### Recursos

- `recursos/diapositivas/`: presentaciones del curso.
- `recursos/documentos/`: lecturas, guias, rubricas, metadatos y documentos de apoyo.
- `recursos/ejemplos/`: codigo o configuraciones pequenas usadas como referencia.

### Trabajos

- Usar `trabajos/tarea-XX/` para tareas individuales.
- Usar `trabajos/proyecto-final/` para el proyecto integrador.
- Cada entrega deberia incluir al menos `README.md` o `informe.md`, y su PDF si corresponde.

## Archivos que conviene mover

No se elimina ningun archivo existente. Antes de mover, revisar contenido y confirmar que no se pierde trazabilidad.

| Archivo actual | Destino sugerido | Motivo |
| --- | --- | --- |
| `notas/clase-04.pdf` | `pdf/clase-04-version-local.pdf` o revisar contra `pdf/clase-04.pdf` | Hay dos PDFs con nombre parecido y hashes distintos; no conviene sobrescribir. |
| `notas/clase-06.pdf` | `pdf/clase-06.pdf` | Es un PDF de clase y pertenece a la carpeta global de PDFs. |
| `notas/clase-04-evidencia-metadatos.pdf` | `recursos/documentos/clase-04-evidencia-metadatos.pdf` | Es una evidencia documental, no una nota fuente. |
| `notas/clase-04-evidencia-metadatos.html` | `recursos/documentos/clase-04-evidencia-metadatos.html` | Es un documento auxiliar generado. |
| `notas/clase-07_tmp.html` | `recursos/documentos/clase-07_tmp.html` o excluir de Git si es temporal | El sufijo `_tmp` indica archivo temporal; revisar antes de versionar. |
| `laboratorios/lab-01-cloud-vm/pdf/Lab1_FCN_2026_Oscar_Marin_Zamora.pdf` | mantener o copiar como `laboratorios/lab-01-cloud-vm/informe.pdf` | El nombre actual sirve para entrega; `informe.pdf` mejora consistencia interna. |

## Pasos concretos para implementar

1. Mantener `notas/` solo para archivos Markdown fuente de clase.
2. Centralizar PDFs de clases en `pdf/`.
3. Usar `laboratorios/plantilla-laboratorio/` como base para cada nuevo laboratorio.
4. Crear cada laboratorio con nombre estable: `lab-XX-tema-corto`.
5. Guardar evidencias dentro del laboratorio correspondiente, no en la raiz del repositorio.
6. Usar `recursos/` para materiales de apoyo generales del curso.
7. Usar `trabajos/` para tareas, entregas y proyecto final.
8. Revisar PDFs duplicados antes de renombrar o reemplazar.

## Compatibilidad con VS Code y PDF

El repositorio incluye configuracion en `.vscode/settings.json` para generar PDFs desde Markdown con `yzane.markdown-pdf`.

Recomendaciones:

- Mantener rutas relativas en imagenes, por ejemplo `evidencias/01-captura.png`.
- Exportar el PDF desde el archivo Markdown fuente usando VS Code.
- Revisar el PDF despues de generarlo para confirmar que imagenes, tablas y acentos se renderizan correctamente.
- Evitar nombres con espacios en archivos de evidencias; usar guiones: `01-creacion-vm.png`.
- Si se genera HTML temporal, no dejarlo mezclado con notas salvo que sea una evidencia necesaria.

## Estrategia Git recomendada

### Commits

Hacer commits pequenos y descriptivos:

```text
notas: agregar clase 07 sobre contenedores
pdf: exportar clase 07
lab-01: agregar evidencias de vm
lab-02: crear base terraform docker
repo: organizar plantilla de laboratorios
```

### Ramas

Para un curso, se puede trabajar con una estrategia simple:

- `main`: material estable y entregado.
- `lab-XX`: trabajo temporal de un laboratorio antes de finalizarlo.
- `tarea-XX`: trabajo temporal de una tarea.
- `proyecto-final`: desarrollo del proyecto integrador.

Al terminar una entrega, fusionar a `main` y etiquetar si hace falta:

```powershell
git tag entrega-lab-01
```

### Respaldos

- Subir cambios a GitHub despues de cada clase, laboratorio o entrega.
- Antes de una entrega importante, ejecutar `git status` y confirmar que los archivos esperados estan versionados.
- Conservar PDFs finales junto al Markdown fuente para trazabilidad.
- No versionar logs, temporales o archivos de entorno.

## Riesgos y conflictos potenciales

- Mover PDFs ya entregados puede cambiar rutas usadas en enlaces o evidencias. Si un archivo ya fue entregado, conviene conservar una copia con el nombre original.
- Hay archivos con nombres similares y contenido distinto; comparar antes de reemplazar.
- Los HTML temporales pueden acumular ruido en Git si no se excluyen o se mueven a una carpeta de documentos.
- La extension `markdown-pdf` puede regenerar PDFs automaticamente al guardar; revisar que el destino generado sea el esperado.
- El README anterior mostraba caracteres corruptos por codificacion. Mantener archivos Markdown en UTF-8 ayuda a evitar ese problema.
