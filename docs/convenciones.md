# 🧾 Convenciones de desarrollo

Este documento recopila las convenciones de estilo adoptadas para mantener un flujo de trabajo limpio, claro y coherente en los proyectos dentro del `personal-dev-kit`.

---

## ✍️ Mensajes de commit

Se adopta una estructura enriquecida con emojis para facilitar la lectura del historial y expresar claramente la intención de cada cambio.

### 📌 Formato recomendado

```
<tipo><emoji>(área): descripción breve y significativa
```

### 🎯 Ejemplos

```
feat✨(api): agrega nuevo endpoint de autenticación
fix🐛(login): corrige validación de credenciales
docs📝(readme): mejora redacción del índice de contenidos
chore🧱(estructura): reorganiza carpetas base del kit
```

### 🧩 Tipos comunes y emojis sugeridos

| Tipo     | Emoji | Descripción                        |
| -------- | ----- | ---------------------------------- |
| feat     | ✨    | Nueva funcionalidad                |
| fix      | 🐛    | Corrección de errores              |
| refactor | 🔁    | Reorganización sin cambiar lógica  |
| chore    | 🧱    | Cambios estructurales o de soporte |
| docs     | 📝    | Cambios en documentación           |
| style    | 🎨    | Formato, estilo o linting          |
| test     | ✅    | Pruebas o casos de prueba          |
| perf     | ⚡    | Mejora de rendimiento              |

> Puedes adaptarlo según tus necesidades: agregar tipos, ajustar emojis o definir nuevas áreas.

---

## 🛠️ Alias recomendados

Define atajos útiles en tu entorno:

```bash
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
```

---

## 🗂️ Organización sugerida de ramas

- `main`: rama estable, siempre desplegable.
- `dev`: integración de nuevas funciones.
- `feature/<nombre>`: ramas para funcionalidades específicas.
- `fix/<nombre>`: correcciones de errores.

---

## 🔗 Archivos relacionados

- [`commit-style-guide.md`](../commit-style-guide.md): plantilla de commits original generada por el script
- [`setup.md`](./setup.md): configuración del entorno
- [`init-personal-dev-kit.md`](./init-personal-dev-kit.md): estructura base del kit
