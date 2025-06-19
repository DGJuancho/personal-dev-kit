#!/bin/bash

# 1. Verifica si se ingresó un nombre
if [ -z "$1" ]; then
    echo "⚠️  Usa: ./crear_proyecto.sh NombreDeMiProyecto"
    exit 1
fi

PROYECTO=$1
GITIGNORE_GLOBAL="$HOME/.gitignore_global"

# 2. Crear carpeta del proyecto y entrar en ella
PROYECTOS_DIR="$HOME/Desktop/GitHub"
mkdir -p "$PROYECTOS_DIR/$PROYECTO"
cd "$PROYECTOS_DIR/$PROYECTO" || exit

# 3. Estructura básica
mkdir src
mkdir docs

# 4. Crear plantilla Markdown inicial en /docs
cat > docs/README.md <<EOF
# Documentación

Aquí puedes añadir notas sobre el diseño, decisiones técnicas, diagramas o referencias importantes del proyecto.

## 📄 Índice rápido

- [Estructura del código](../src/)
- [Requisitos](#)
- [Notas](#)

> Sugerencia: puedes usar esta plantilla como punto de partida para documentación más avanzada con herramientas como MkDocs o Docusaurus.
EOF

# 5. Crear README principal
echo "# $PROYECTO" > README.md

# 6. Copiar reglas globales de Git ignore
if [ -f "$GITIGNORE_GLOBAL" ]; then
    cp "$GITIGNORE_GLOBAL" .gitignore
    echo "✅ .gitignore creado desde tu configuración global."
else
    touch .gitignore
    echo "⚠️  No encontré .gitignore_global. Se creó uno vacío."
fi

# 7. Inicializar Git y primer commit
git init
git add .
git commit -m "🔧 Estructura inicial con carpetas src y docs, y plantilla Markdown"

echo "🎉 Proyecto '$PROYECTO' creado correctamente con estructura profesional."