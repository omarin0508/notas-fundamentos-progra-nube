# Laboratorio 1 - Comparación de tipos de nube y proveedores cloud (VM)

**Curso:** Fundamentos de Programación en la Nube  
**Estudiante:** Oscar Marín Zamora  
**Tema:** Tipos de nube, proveedores cloud y máquinas virtuales  
**Estado:** En desarrollo  
**Fecha:** Pendiente

---

## Objetivos

### Objetivo general

Analizar los principales tipos de nube, comparar proveedores de nube pública y relacionar sus servicios con el uso de máquinas virtuales en escenarios reales.

### Objetivos específicos

- Identificar las diferencias entre nube pública, privada, híbrida y comunitaria.
- Comparar proveedores cloud como AWS, Microsoft Azure y Google Cloud.
- Describir un escenario hipotético donde se requiera implementar una máquina virtual.
- Comparar opciones de máquinas virtuales según recursos, costos y facilidad de uso.
- Documentar el proceso de virtualización local como práctica base para comprender entornos cloud.
- Registrar evidencias del proceso mediante capturas y observaciones.

---

## Parte 1: Tipos de nube

### Nube pública

La nube pública es un modelo donde los recursos tecnológicos son ofrecidos por un proveedor externo a través de internet. Los usuarios pueden acceder a servicios como almacenamiento, bases de datos, redes, aplicaciones y máquinas virtuales sin administrar directamente la infraestructura física.

**Ejemplos:** AWS, Microsoft Azure, Google Cloud.

**Ventajas:**

- No requiere comprar servidores propios.
- Permite pagar según el consumo.
- Facilita el crecimiento rápido de recursos.
- El proveedor se encarga de gran parte del mantenimiento.

**Desventajas:**

- Depende de la conexión a internet.
- Puede generar costos variables si no se controla el consumo.
- Requiere configurar correctamente la seguridad.

### Nube privada

La nube privada es utilizada por una sola organización. Puede estar ubicada dentro de la empresa o ser administrada por un tercero, pero sus recursos no se comparten con otros clientes.

**Ventajas:**

- Mayor control sobre la infraestructura.
- Mejor adaptación a políticas internas.
- Puede ofrecer mayor privacidad para datos sensibles.

**Desventajas:**

- Mayor costo de implementación.
- Requiere personal técnico especializado.
- Menor flexibilidad inicial en comparación con la nube pública.

### Nube híbrida

La nube híbrida combina servicios de nube pública y nube privada. Permite mantener ciertos datos o sistemas en infraestructura privada y utilizar servicios públicos para otras necesidades.

**Ventajas:**

- Balance entre control y escalabilidad.
- Permite mover cargas de trabajo según la necesidad.
- Es útil para empresas con sistemas existentes que migran gradualmente a la nube.

**Desventajas:**

- Puede ser más compleja de administrar.
- Requiere buena integración entre ambientes.
- La seguridad debe manejarse de forma coordinada.

### Nube comunitaria

La nube comunitaria es compartida por varias organizaciones con necesidades similares, por ejemplo instituciones educativas, entidades gubernamentales o empresas de un mismo sector.

**Ventajas:**

- Permite compartir costos.
- Atiende necesidades comunes de seguridad o cumplimiento.
- Facilita la colaboración entre organizaciones relacionadas.

**Desventajas:**

- Menos flexible que una nube pública.
- Requiere acuerdos claros entre participantes.
- Puede tener disponibilidad limitada según la comunidad.

---

## Parte 2: Proveedores de nube pública

### Amazon Web Services (AWS)

AWS es uno de los proveedores de nube pública más utilizados. Ofrece servicios de cómputo, almacenamiento, redes, bases de datos, inteligencia artificial, seguridad y monitoreo.

**Servicio de máquinas virtuales:** Amazon EC2.

**Características principales:**

- Amplia variedad de tipos de instancia.
- Opciones de pago por uso, instancias reservadas y planes de ahorro.
- Integración con servicios como S3, VPC, IAM y CloudWatch.

### Microsoft Azure

Microsoft Azure es la plataforma cloud de Microsoft. Es muy utilizada en empresas que trabajan con Windows Server, Active Directory, Microsoft 365, SQL Server y herramientas empresariales de Microsoft.

**Servicio de máquinas virtuales:** Azure Virtual Machines.

**Características principales:**

- Buena integración con tecnologías Microsoft.
- Soporte para Linux y Windows.
- Opciones de redes, seguridad, monitoreo y escalabilidad.

### Google Cloud Platform (GCP)

Google Cloud Platform es la plataforma de nube de Google. Destaca en análisis de datos, inteligencia artificial, contenedores, redes globales y servicios administrados.

**Servicio de máquinas virtuales:** Compute Engine.

**Características principales:**

- Buen rendimiento de red.
- Integración con Kubernetes y servicios de datos.
- Opciones flexibles de configuración de máquinas virtuales.

---

## Parte 3: Escenario hipotético de VM

Una pequeña empresa necesita publicar una aplicación web interna para que su equipo pueda registrar información de clientes y consultar reportes básicos. La empresa no desea comprar servidores físicos porque el uso inicial será pequeño, pero espera que el sistema pueda crecer con el tiempo.

Para este caso, una máquina virtual en la nube sería una opción adecuada porque permite:

- Instalar un sistema operativo según las necesidades del proyecto.
- Configurar CPU, memoria RAM y disco de acuerdo con la carga esperada.
- Aumentar recursos si la aplicación crece.
- Acceder al servidor de forma remota.
- Pagar únicamente por los recursos utilizados.

Una configuración inicial podría incluir:

| Recurso | Configuración hipotética |
| --- | --- |
| Sistema operativo | Ubuntu Server LTS |
| CPU | 1 o 2 vCPU |
| RAM | 2 GB a 4 GB |
| Disco | 30 GB SSD |
| Uso principal | Aplicación web interna |
| Acceso | SSH |

---

## Parte 4: Comparación de VM

| Criterio | AWS EC2 | Azure Virtual Machines | Google Compute Engine |
| --- | --- | --- | --- |
| Servicio principal | EC2 | Virtual Machines | Compute Engine |
| Sistemas operativos | Linux y Windows | Linux y Windows | Linux y Windows |
| Escalabilidad | Alta | Alta | Alta |
| Modelo de pago | Pago por uso, reservas y ahorros | Pago por uso y reservas | Pago por uso y descuentos automáticos |
| Facilidad inicial | Media | Media | Media |
| Integración destacada | Servicios AWS | Ecosistema Microsoft | Datos, red y Kubernetes |
| Uso recomendado | Ambientes flexibles y variados | Empresas con tecnologías Microsoft | Datos, contenedores y servicios modernos |

### Análisis breve

Los tres proveedores permiten crear máquinas virtuales con características similares: selección de sistema operativo, recursos configurables, acceso remoto, redes y reglas de seguridad. La elección depende del contexto del proyecto, el presupuesto, la experiencia del equipo y los servicios adicionales que se necesiten.

Para una empresa que ya utiliza Microsoft 365 o Windows Server, Azure puede ser una opción natural. Para proyectos con mucha variedad de servicios cloud, AWS ofrece un ecosistema muy amplio. Para proyectos relacionados con análisis de datos, contenedores o herramientas de Google, GCP puede ser conveniente.

---

## Parte 5: Virtualización local

La virtualización local permite crear una máquina virtual en una computadora personal. Esta práctica ayuda a comprender conceptos que también se usan en la nube, como asignación de CPU, memoria RAM, almacenamiento, instalación de sistemas operativos y administración de recursos.

### Software de virtualización utilizado

**Software:** Pendiente  
**Versión:** Pendiente  
**Sistema operativo anfitrión:** Pendiente  
**Sistema operativo invitado:** Pendiente

### Evidencia 1: instalación del software de virtualización

Pendiente insertar captura de la instalación del software de virtualización.

```markdown
![Instalación del software de virtualización](./evidencias/instalacion-software-virtualizacion.png)
```

### Evidencia 2: creación de la máquina virtual

Pendiente insertar captura de la creación de la VM.

```markdown
![Creación de la máquina virtual](./evidencias/creacion-vm.png)
```

### Evidencia 3: configuración de CPU, RAM y disco

Pendiente insertar captura de la configuración de recursos de la VM.

```markdown
![Configuración de CPU, RAM y disco](./evidencias/configuracion-cpu-ram-disco.png)
```

### Evidencia 4: instalación de Linux

Pendiente insertar captura de la instalación del sistema operativo Linux.

```markdown
![Instalación de Linux](./evidencias/instalacion-linux.png)
```

### Evidencia 5: VM encendida y funcionando

Pendiente insertar captura de la máquina virtual encendida y funcionando.

```markdown
![VM encendida y funcionando](./evidencias/vm-funcionando.png)
```

---

## Parte 6: Comparación y conclusión

La virtualización local y las máquinas virtuales en la nube tienen conceptos en común. En ambos casos se asignan recursos como CPU, memoria RAM, disco y sistema operativo. También se requiere administrar acceso, seguridad y uso de recursos.

La principal diferencia es que una VM local depende de la capacidad de la computadora personal, mientras que una VM en la nube utiliza infraestructura de un proveedor externo. En la nube es más sencillo aumentar recursos, crear nuevas instancias, respaldar información y acceder desde diferentes ubicaciones.

En conclusión, las máquinas virtuales son una base importante para comprender la computación en la nube. Permiten practicar conceptos de infraestructura, sistemas operativos, redes y administración de servicios. Además, comparar proveedores cloud ayuda a tomar mejores decisiones según el tipo de proyecto, presupuesto y necesidades técnicas.

---

## Evidencias pendientes

- [ ] Captura de instalación del software de virtualización.
- [ ] Captura de creación de la VM.
- [ ] Captura de configuración de CPU, RAM y disco.
- [ ] Captura de instalación de Linux.
- [ ] Captura de VM encendida y funcionando.
- [ ] Agregar datos finales del software usado.
- [ ] Revisar ortografía y formato antes de exportar a PDF.

---

## Problemas encontrados y solución aplicada

| Problema | Causa probable | Solución aplicada |
| --- | --- | --- |
| Pendiente | Pendiente | Pendiente |

### Observaciones

Completar esta sección durante el desarrollo del laboratorio. Registrar errores de instalación, problemas de rendimiento, fallos con la imagen ISO, configuración de red o cualquier ajuste realizado para que la VM funcione correctamente.
