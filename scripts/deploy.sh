#!/usr/bin/env bash
# Despliega el portal de Punto de Juego en la raíz documental de Apache.
# Uso: ./scripts/deploy.sh   (desde cualquier carpeta)

set -euo pipefail

# Carpeta raíz del repo, calculada a partir de dónde está este script
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ORIGEN="$REPO_DIR/portal/"
DESTINO="/var/www/html/"

if [ ! -f "$ORIGEN/index.html" ]; then
    echo "Error: no encuentro $ORIGEN/index.html" >&2
    exit 1
fi

echo "Copiando $ORIGEN -> $DESTINO"
sudo rsync -av --delete --chmod=D755,F644 "$ORIGEN" "$DESTINO"

# Fedora (SELinux): asegura la etiqueta correcta. En Ubuntu no existe y se omite.
if command -v restorecon >/dev/null 2>&1; then
    sudo restorecon -R "$DESTINO"
fi

echo "Comprobando respuesta HTTP..."
codigo=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/)
echo "http://localhost/ -> $codigo"
