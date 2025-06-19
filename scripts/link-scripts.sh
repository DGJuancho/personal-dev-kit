#!/bin/bash

# ============================
# 🔗 Script: link-scripts.sh
# 📌 Crea enlaces simbólicos multiplataforma (Windows/Linux) en ~/bin
# ============================

FORCE=false
if [ "$1" == "--force" ]; then
  FORCE=true
fi

SCRIPTS_DIR="$HOME/Desktop/GitHub/personal-dev-kit/scripts"
BIN_DIR="$HOME/bin"
mkdir -p "$BIN_DIR"

declare -a SCRIPTS=(
  "aliases.sh"
  "crear_proyecto.sh"
  "init-personal-dev-kit.sh"
)

create_windows_symlink() {
  local src="$1"
  local tgt="$2"
  local name="$3"

  local win_src
  win_src=$(cygpath -w "$src" | sed 's|/|\\|g')
  local win_tgt
  win_tgt=$(cygpath -w "$tgt" | sed 's|/|\\|g')

  echo "🛠️  Ejecutando: mklink \"$win_tgt\" \"$win_src\""
  powershell.exe -NoProfile -Command "New-Item -ItemType SymbolicLink -Path '$win_tgt' -Target '$win_src'" > /dev/null

  if [ $? -eq 0 ]; then
    echo "🪟 Enlace simbólico creado en Windows: $name → $win_src"
  else
    echo "❌ Error: mklink falló para $name"
  fi
}

IS_WINDOWS=false
unameOut="$(uname -s)"
if [[ "$unameOut" == MINGW* || "$unameOut" == MSYS* || "$unameOut" == CYGWIN* ]]; then
  IS_WINDOWS=true
fi

echo -e "\n🚀 Comenzando vinculación de scripts..."
echo "📁 Scripts origen: $SCRIPTS_DIR"
echo "📍 Enlaces destino: $BIN_DIR"
echo

for script in "${SCRIPTS[@]}"; do
  name="${script%.sh}"
  source_path="$SCRIPTS_DIR/$script"
  target_path="$BIN_DIR/$name"

  if [ -L "$target_path" ]; then
    current_target=$(readlink "$target_path")
    if [ "$current_target" = "$source_path" ]; then
      echo "✅ Enlace correcto ya existe: $name → $current_target"
      continue
    fi
    echo "♻️  Enlace desactualizado. Actualizando..."
    rm "$target_path"
  elif [ -e "$target_path" ]; then
    if [ "$FORCE" = true ]; then
      echo "⚠️  Conflicto con archivo regular → $target_path"
      echo "↪️  Reemplazando automáticamente porque estamos en modo --force"
      rm -f "$target_path"
    else
      echo "⚠️  Archivo en conflicto: $target_path (omite sin --force)"
      continue
    fi
  fi

  if [ "$IS_WINDOWS" = true ]; then
    create_windows_symlink "$source_path" "$target_path" "$name"
  else
    ln -s "$source_path" "$target_path"
    echo "🔗 Enlace creado: $name → $source_path"
  fi

done

echo -e "\n🏁 Vinculación completada."

# 🔽 Pega aquí el bloque para ~/.bash_profile y ~/.bashrc
if [ ! -f ~/.bash_profile ]; then
  echo "📄 Creando ~/.bash_profile con soporte para ~/.bashrc"
  echo '[ -f ~/.bashrc ] && source ~/.bashrc' >> ~/.bash_profile
fi

if [ ! -f ~/.bashrc ]; then
  echo "📄 Creando ~/.bashrc con carga de alias"
  echo '[ -f ~/bin/aliases ] && source ~/bin/aliases' >> ~/.bashrc
else
  if ! grep -q 'source ~/bin/aliases' ~/.bashrc; then
    echo "➕ Agregando carga de alias a ~/.bashrc"
    echo '[ -f ~/bin/aliases ] && source ~/bin/aliases' >> ~/.bashrc
  fi
fi