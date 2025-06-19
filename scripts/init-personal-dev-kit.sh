#!/bin/bash

# 🧰 Nombre del repositorio
REPO_NAME="personal-dev-kit"

# 📦 Crear estructura de carpetas
mkdir -p "$REPO_NAME"/{snippets/{php,bash,markdown},templates}

cd "$REPO_NAME" || exit

# 📄 .gitignore_global
cat <<EOF > .gitignore_global
# Archivos generados por el sistema operativo
.DS_Store
Thumbs.db

# Configuración de entorno y credenciales
.env

# Logs y archivos temporales
*.log
*.tmp
*.bak
.cache/
tmp/

# Dependencias comunes
node_modules/
vendor/
__pycache__/

# Archivos de compilación
*.class
*.jar
*.exe
*.dll

# IDE y editores
.vscode/
.idea/
.settings/
*.iml
EOF

# 📄 commit-style-guide.md
cat <<EOF > commit-style-guide.md
# 🧱 Guía de estilo para mensajes de commit con emojis

## 📌 Estructura general
<tipo><emoji>(área): descripción breve y significativa

## 🧩 Tipos comunes y emojis sugeridos
feat✨, fix🐛, refactor🔁, chore🧱, docs📝, style🎨, test✅, perf⚡

## 🧠 Ejemplos
feat✨(api): agrega nuevo endpoint  
fix🐛(login): corrige validación  
chore🧱(estructura): reorganiza carpetas

## 🧰 Atajo útil
alias gc='git commit -m'
EOF

# 📄 aliases.sh
cat <<EOF > aliases.sh
# Alias útiles
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
EOF

# 📄 git-setup.md
cat <<EOF > git-setup.md
# Configuración recomendada para Git

- Ignorar archivos globales:
  git config --global core.excludesFile ~/.gitignore_global

- Usar alias del archivo aliases.sh:
  source aliases.sh
EOF

# 📄 README.md
cat <<EOF > README.md
# 🧰 personal-dev-kit

Repositorio privado con configuraciones y herramientas base para mi entorno de desarrollo.

## Contenido
- .gitignore_global
- commit-style-guide.md
- aliases.sh
- git-setup.md
- Plantillas y fragmentos reutilizables

## Recomendación
Clonar este repo y usarlo como referencia para nuevas configuraciones o migraciones.
EOF

# Inicializar Git y hacer primer commit
git init
git add .
git commit -m "chore🧱(starter-kit): estructura inicial del kit personal de desarrollo"

echo "✅ Repositorio '$REPO_NAME' inicializado correctamente con commit inicial."