# 🔗 Script: link-scripts.sh

Este script crea enlaces simbólicos en `~/bin` para los scripts del entorno `personal-dev-kit`, asegurando acceso global desde la terminal. Está diseñado para funcionar tanto en sistemas Linux como en entornos Windows (MSYS, Git Bash o WSL).

---

## 🎯 Objetivo

Garantizar que los scripts del entorno estén accesibles como comandos del sistema, sin importar la plataforma.

---

## 🧰 Scripts gestionados

Actualmente enlaza:

- `aliases.sh`
- `crear_proyecto.sh`
- `init-personal-dev-kit.sh`

> Puedes editar el arreglo `SCRIPTS` dentro del script para añadir o quitar archivos.

---

## ⚙️ Opciones

```bash
bash link-scripts.sh [--force]
```

- `--force`: reemplaza archivos en conflicto (no simbólicos) automáticamente.

---

## 🖥️ Compatibilidad multiplataforma

- En **Linux/macOS**, se utilizan enlaces simbólicos estándar (`ln -s`).
- En **Windows**, se usan comandos PowerShell (`New-Item -ItemType SymbolicLink`).

---

## 🧩 Lógica del script

1. Verifica que el script fuente existe.
2. Comprueba si hay un enlace simbólico válido.
3. Reemplaza enlaces rotos u obsoletos.
4. Si hay un archivo en conflicto, lo omite o lo reemplaza si se usa `--force`.
5. Crea el enlace según el sistema operativo.
6. Configura los archivos `~/.bashrc` y `~/.bash_profile` para cargar alias automáticamente.

---

## ✅ Resultado esperado

```text
✅ Enlace correcto ya existe: crear_proyecto → /ruta/al/script
♻️  Enlace desactualizado. Actualizando...
⚠️  Archivo en conflicto: /home/usuario/bin/aliases (omite sin --force)
🪟 Enlace simbólico creado en Windows: crear_proyecto → C:\ruta\al\script
📄 Creando ~/.bashrc con carga de alias
➕ Agregando carga de alias a ~/.bashrc
```

---

## 📎 Notas

- Es útil ejecutarlo tras clonar el repositorio o modificar los scripts.
- Crea `~/.bash_profile` si no existe, y asegura que `~/.bashrc` sea cargado en shells de login.
- Solo agrega `source ~/bin/aliases` si aún no existe en el archivo.
