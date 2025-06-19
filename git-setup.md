# ⚙️ Configuración recomendada para Git

Este archivo resume los pasos esenciales para personalizar tu entorno Git usando este repositorio.

---

## 🔒 Ignorar archivos globales

Establece un archivo `.gitignore_global` para evitar repetir reglas comunes en cada proyecto:

```bash
git config --global core.excludesFile ~/.gitignore_global
```

Puedes copiar la plantilla desde: `config/gitignore_global`

---

## ⚡ Activar alias útiles

Desde la raíz del repositorio:

```bash
source aliases.sh
```

Para hacerlo permanente:

```bash
echo "source ~/ruta/al/repositorio/aliases.sh" >> ~/.bashrc
```

O reemplaza `.bashrc` por `.zshrc` según tu shell.

---

## 🧩 Aplicar configuración desde `gitconfig.example`

Este repositorio incluye una plantilla de configuración global de Git:

```bash
cp config/gitconfig.example ~/.gitconfig
```

Ajusta las rutas dentro del archivo (por ejemplo, `editor` o `excludesFile`) si cambias de sistema.

Verifica la configuración aplicada:

```bash
git config --global --list
```

---

Git, pero con tu toque personal. Tu estilo, tu máquina, tu control.
