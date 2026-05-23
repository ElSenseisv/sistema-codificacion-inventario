# Sistema de Codificación de Artículos de Inventario

Sistema de codificación de artículos de inventario bajo criterios de gestión de procesos y asistido por inteligencia artificial.

Este repositorio contiene los archivos complementarios del libro **"[Título del libro]"**, publicado en [plataforma]. El libro documenta el diseño, la arquitectura y la construcción del sistema de codificación; este repositorio entrega el instrumento que el libro describe.

---

## Contenido

### Aplicativo

| Archivo | Descripción |
|---|---|
| `generador_codigos_inventario.html` | El aplicativo completo. Un único archivo HTML autocontenido que implementa el generador de códigos de inventario bajo la arquitectura de tres segmentos: Contable, Identificador Técnico y Operativo. |
| `iniciar_generador_codigos.bat` | Archivo de arranque para Windows. Inicia un servidor HTTP local en el puerto 8400 y abre el aplicativo en el navegador. **El aplicativo debe abrirse desde este archivo, no con doble clic directo sobre el HTML.** |

### Índices de clasificación internacional

| Archivo | Estándar | Fuente |
|---|---|---|
| `ATCvet_Index_L1_L4.xlsx` | Sistema ATCvet — medicamentos veterinarios, niveles 1 a 4 | WHOCC (Centro Colaborador de la OMS) |
| `ATC_Index_L1_L4.xlsx` | Sistema ATC — medicamentos humanos, niveles 1 a 4 | WHOCC (Centro Colaborador de la OMS) |
| `UNSPSC.xlsx` | Clasificación UNSPSC — bienes y servicios de propósito general | GS1 / UNDP |
| `Reglamento_1831_2003.xlsx` | Aditivos para alimentación animal — Reglamento europeo 1831/2003 | Desarrollo propio, distribución libre |
| `Reglamento_528_2012.xlsx` | Biocidas — Reglamento europeo 528/2012 | Desarrollo propio, distribución libre |

---

## Instrucciones de uso

### Requisitos

- Windows (el archivo de arranque es un .bat)
- Python instalado y disponible en el PATH — descarga en [python.org](https://www.python.org/downloads/). Durante la instalación, marcar **"Add Python to PATH"**.
- Navegador moderno (Chrome, Edge, Firefox)

### Pasos

1. Descargar todos los archivos del repositorio en una misma carpeta.
2. Ejecutar `iniciar_generador_codigos.bat` con doble clic.
3. El aplicativo se abre automáticamente en el navegador.
4. Completar la Fase de Planificación (una vez por organización).
5. Codificar artículos en la Fase Hacer.

### Carga de índices

Los índices de clasificación se cargan desde el aplicativo, no de forma automática. En el Segmento H-2 (Identificador Técnico), el aplicativo ofrece un botón de carga para cada estándar. El índice se indexa en la sesión del navegador y queda disponible para todas las codificaciones subsiguientes sin conexión a internet.

**Nota sobre el índice ATCvet:** el WHOCC comercializa el índice completo de nivel 5. Los archivos de este repositorio incluyen los niveles 1 a 4 completos y el nivel 5 para las sustancias de uso más frecuente en bienestar animal. Para sustancias no encontradas, el aplicativo remite al buscador oficial del WHOCC: [whocc.no/atcvet](https://www.whocc.no/atcvet/atcvet_index/).

---

## Puerto y persistencia de datos

El aplicativo usa el puerto **8400** de forma fija. Este puerto no debe cambiarse entre versiones: los catálogos, el historial y el perfil de configuración quedan asociados al origen desde el que fue servido. Cambiar el puerto equivale a perder los datos guardados.

---

## Atribución

Los índices ATCvet y ATC se distribuyen con atribución al Centro Colaborador de la OMS para la Metodología de Estadísticas sobre Medicamentos (WHOCC), conforme sus condiciones de uso.

Los archivos de los Reglamentos europeos 1831/2003 y 528/2012 son desarrollo propio y se distribuyen sin restricción.
