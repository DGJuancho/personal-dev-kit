#!/bin/bash

# 🧠 Detectar sistema operativo
SO="$(uname -s)"
case "$SO" in
    Darwin*)   SISTEMA="macOS" ;;
    Linux*)    SISTEMA="Linux" ;;
    MINGW*|MSYS*) SISTEMA="Windows" ;;
    *)         SISTEMA="Desconocido" ;;
esac

echo "🔍 Sistema detectado: $SISTEMA"

# 🗂️ Ruta base del repositorio
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/bin"

# 🗃️ Scripts a enlazar
declare -A LINKS=(
    ["crear_proyecto"]="$REPO_DIR/scripts/init/crear_proyecto.sh"
    ["init_personal_dev"]="$REPO_DIR/scripts/init/init-personal-dev-kit.sh"
)

# 📂 Crear ~/bin si no existe
if [ ! -d "$BIN_DIR" ]; then
    echo "📁 Creando carpeta bin: $BIN_DIR"
    mkdir -p "$BIN_DIR"
else
    echo "📁 Carpeta bin ya existe: $BIN_DIR"
fi

# 🔗 Crear enlaces simbólicos con validaciones
for alias in "${!LINKS[@]}"; do
    destino="$BIN_DIR/$alias"
    fuente="${LINKS[$alias]}"

    if [ -L "$destino" ]; then
        echo "🔁 Enlace existente: $alias → $(readlink "$destino")"
        read -p "¿Deseas sobrescribir el enlace de '$alias'? [s/N]: " respuesta
        if [[ "$respuesta" =~ ^[Ss]$ ]]; then
            ln -sf "$fuente" "$destino"
            echo "✅ Enlace actualizado: $alias"
        else
            echo "⏩ Se mantuvo el enlace actual: $alias"
        fi
    elif [ -e "$destino" ]; then
        echo "⚠️ Ya existe un archivo llamado '$alias' en $BIN_DIR. No se creó el enlace."
    else
        ln -s "$fuente" "$destino"
        echo "✅ Enlace creado: $alias → $fuente"
    fi
done

# 🧭 Verificar si ~/bin está en $PATH
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo ""
    echo "⚠️ $BIN_DIR no está en tu \$PATH"
    if [[ "$SISTEMA" == "Windows" ]]; then
        echo "🔧 Agrega '$BIN_DIR' a tu PATH desde Configuración > Variables de entorno."
    else
        echo "🔧 Agrega esta línea a tu archivo ~/.bashrc o ~/.zshrc:"
        echo '    export PATH="$HOME/bin:$PATH"'
    fi
else
    echo ""
    echo "🎯 Todo listo: $BIN_DIR está en tu \$PATH y los comandos ya están disponibles globalmente."
fi