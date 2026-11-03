# Punto de juego: Grupo 2

## Integrantes:

- Pol · [evidencias](docs/evidencias/Pol/evidencias.md)
- Joel Vega · [evidencias](docs/evidencias/Joel/evidencias.md)
- Zaid (Lider) · [evidencias](docs/evidencias/Zaid/evidencias.md)

## Estructura
- `portal/` — archivos de la web; es lo único que se copia a Apache
- `scripts/deploy.sh` — copia `portal/` a la raíz documental
- `docs/evidencias/<nombre>/` — documento individual de cada integrante

## Requisitos
- Apache HTTP server instalado y en funcionamiento

## Despliegue

1. Clonar repositorio
2. Dar permiso de ejecución al script: chmod +x scripts/deploy.sh
3. Desplegar mediante el script: ./scripts/deploy.sh
4. Abrir localhost en el navegador

**Recomendación:** las primeras veces, desplegad a mano para entender
qué hace cada paso (ver [despliegue manual](#despliegue-manual)).
Después, usad el script: hace la misma copia y evita errores habituales,
como olvidar archivos, dejar en Apache archivos borrados del repo
o perder permisos y etiqueta SELinux.
****
## Despliegue Manual

1. Copiar el contenido de la carpeta portal/ a la raiz documental (/var/www/html)
2. Dar permisos de lectura
3. Poner la etiqueta SELinux
4. Comprobacion de respuesta

Copiar contenido:
+ sudo cp -r portal/. /var/www/html/

Permisos de lectura:
+ Directorios: sudo find /var/www/html -type d -exec chmod 755 {} +
+ Archivos: sudo find /var/www/html -type f -exec chmod 644 {} +

Poner etiqueta SELinux: 
+ sudo restorecon -Rv /var/www/html

Comprobación de respuesta:
+ curl -I http://localhost/

**Deberia devolver 200 OK**

## Forma de trabajo 

+ La rama main contiene la version comun
+ Cada cambio se hace en una rama propia y se une con pull request hacia main
+ Commits **pequeños** con comentario explicativo
+ Despues de cada git pull, ejecutar el script de despliegue para actualizar Apache

### Mensajes de commit

Formato: `tipo: descripción`

| Tipo | Uso |
|---|---|
| `feat` | Algo nuevo visible en la web |
| `fix` | Corrección de un error |
| `docs` | Solo documentación |
| `style` | Formato del código sin cambiar su comportamiento |
| `refactor` | Reorganización de código sin cambiar lo que hace |
| `chore` | Mantenimiento (`.gitignore`, estructura) |
| `build` | Scripts y herramientas de despliegue |

Ejemplo: `docs: documenta instalación de httpd`

## Version Actual

+ Fase 1: tag "fase-1"
