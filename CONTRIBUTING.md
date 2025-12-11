# 🤝 Guía de Contribución

¡Gracias por tu interés en contribuir a Workout Now! Este documento te guiará a través del proceso de contribución.

## 📋 Índice

- [Código de Conducta](#código-de-conducta)
- [Cómo Contribuir](#cómo-contribuir)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Guía de Estilo](#guía-de-estilo)
- [Proceso de Pull Request](#proceso-de-pull-request)
- [Reporte de Bugs](#reporte-de-bugs)

## 🤝 Código de Conducta

Este proyecto y todos los que participan en él se rigen por el siguiente principio:

- Sé respetuoso y considerado con los demás
- Acepta las críticas constructivas
- Enfócate en lo que es mejor para la comunidad
- Muestra empatía hacia otros miembros de la comunidad

## 🚀 Cómo Contribuir

### Prerequisitos

- macOS 14.0 (Sonoma) o superior
- Xcode 16.0 o superior
- Conocimientos de Swift y SwiftUI
- Familiaridad con Git

### Configuración del Entorno

1. **Fork el repositorio**

2. **Clona tu fork**

   ```bash
   git clone https://github.com/tu-usuario/WorkoutNow.git
   cd WorkoutNow
   ```

3. **Añade el repositorio original como upstream**

   ```bash
   git remote add upstream https://github.com/JuanCarlosAcostaPeraba/WorkoutNow.git
   ```

4. **Crea una rama para tu feature**

   ```bash
   git checkout -b feature/nombre-descriptivo
   ```

## 🏗️ Estructura del Proyecto

```
WorkoutNow/
├── App/           # Configuración de la app
├── Models/        # Modelos de datos
├── ViewModels/    # Lógica de negocio
├── Views/         # Vistas SwiftUI
├── Services/      # Servicios (persistencia, etc.)
└── Shared/        # Utilidades compartidas
```

## 📝 Guía de Estilo

### Swift

- Sigue las [Swift API Design Guidelines](https://swift.org/documentation/api-design-guidelines/)
- Usa nombres descriptivos para variables y funciones
- Máximo 120 caracteres por línea
- Usa `// MARK: -` para organizar el código

### Ejemplo de código bien formateado

```swift
// MARK: - Properties

private let viewModel: RoutineListViewModel

// MARK: - Initialization

init(viewModel: RoutineListViewModel) {
    self.viewModel = viewModel
}

// MARK: - Body

var body: some View {
    List {
        // Vista
    }
}
```

### SwiftUI

- Usa `@State` para estado local
- Usa `@StateObject` para ViewModels
- Extrae componentes reutilizables
- Preferir `private` en propiedades cuando sea posible

### Comentarios

```swift
// ✅ Bueno: Explica el "por qué"
// Usamos delay para evitar race condition con SwiftData
Task { @MainActor in
    try await Task.sleep(nanoseconds: 100_000_000)
}

// ❌ Malo: Explica el "qué" (obvio por el código)
// Incrementa el contador
counter += 1
```

## 🔄 Proceso de Pull Request

### Antes de crear el PR

1. **Actualiza tu rama con upstream**

   ```bash
   git fetch upstream
   git rebase upstream/develop
   ```

2. **Asegúrate que el código compila**

   ```bash
   # En Xcode: ⌘ + B
   ```

3. **Ejecuta los tests**

   ```bash
   # En Xcode: ⌘ + U
   ```

### Creando el PR

1. **Push a tu fork**

   ```bash
   git push origin feature/nombre-descriptivo
   ```

2. **Crea el Pull Request en GitHub**
   - Usa el [template de PR](.github/PULL_REQUEST_TEMPLATE.md)
   - Título descriptivo: `Add: nueva funcionalidad de temporizador`
   - Descripción clara de los cambios
   - Referencia el issue relacionado: `Closes #123`

3. **Completa el checklist del PR**
   - [ ] Código sigue las guías de estilo
   - [ ] Tests añadidos/actualizados
   - [ ] Documentación actualizada
   - [ ] Probado en dispositivo (si aplica)

### Convenciones de Commits

Usa [Conventional Commits](https://www.conventionalcommits.org/):

```bash
# Formato
<tipo>: <descripción>

# Ejemplos
Add: implementar temporizador con vibración
Fix: corregir crash al eliminar rutina
Improve: optimizar rendimiento de lista
Docs: actualizar README con instrucciones
Refactor: reorganizar estructura de ViewModels
Test: añadir tests para Exercise model
```

**Tipos de commits:**

- `Add`: Nueva funcionalidad
- `Fix`: Corrección de bug
- `Improve`: Mejora de funcionalidad existente
- `Refactor`: Refactorización sin cambiar funcionalidad
- `Docs`: Cambios en documentación
- `Test`: Añadir o modificar tests
- `Style`: Cambios de formato (no afectan el código)
- `Chore`: Tareas de mantenimiento

## 🐛 Reporte de Bugs

Usa el [template de bug report](.github/ISSUE_TEMPLATE/bug_report.md) e incluye:

- Descripción clara del problema
- Pasos para reproducir
- Comportamiento esperado vs actual
- Screenshots/videos
- Versión de iOS/watchOS
- Modelo de dispositivo

## ✨ Solicitud de Features

Usa el [template de feature request](.github/ISSUE_TEMPLATE/feature_request.md) e incluye:

- Descripción de la funcionalidad
- Problema que resuelve
- Solución propuesta
- Mockups/wireframes (si aplica)

## 🎯 Áreas donde Contribuir

### Fácil (Good First Issue)

- Corregir typos en documentación
- Añadir comentarios al código
- Mejorar mensajes de error
- Añadir tests unitarios

### Intermedio

- Implementar nuevas vistas
- Añadir animaciones
- Mejorar accesibilidad
- Optimización de rendimiento

### Avanzado

- Arquitectura y refactoring
- Integración con backend
- Features complejas del roadmap
- CI/CD y automatización

## ❓ Preguntas

Si tienes preguntas, puedes:

- Abrir una [Discussion](https://github.com/JuanCarlosAcostaPeraba/WorkoutNow/discussions)
- Contactar: [juancarlos.ap.dev@gmail.com](mailto:juancarlos.ap.dev@gmail.com)

---

¡Gracias por contribuir a Workout Now! 💪
