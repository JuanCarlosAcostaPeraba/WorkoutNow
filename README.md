<div align="center">

# 💪 WORKOUT NOW

### Tu compañero de entrenamiento

[![Plataformas](https://img.shields.io/badge/plataformas-iOS%20%7C%20watchOS-black)](https://developer.apple.com)
[![Swift](https://img.shields.io/badge/Swift-5-orange.svg)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-blue.svg)](https://developer.apple.com/xcode/swiftui/)
[![Xcode](https://img.shields.io/badge/Xcode-16%2B-blue)](https://developer.apple.com/xcode/)
[![PRs Welcome](https://img.shields.io/badge/PRs-bienvenidas-brightgreen.svg)](CONTRIBUTING.md)

</div>

## 📋 Índice

- [📖 Sobre el proyecto](#-sobre-el-proyecto)
- [✨ Filosofía](#-filosofía)
- [🚀 Características](#-características)
- [🗺️ Hoja de ruta](#-hoja-de-ruta)
- [🏗️ Arquitectura](#-arquitectura)
- [🛠️ Tecnologías](#-tecnologías)
- [🚦 Comenzando](#-comenzando)
- [🤝 Contribuir](#-contribuir)
- [📄 Licencia](#-licencia)

## 📖 Sobre el proyecto

Workout Now es una aplicación minimalista de seguimiento de entrenamientos con enfoque offline-first para iOS y watchOS. Construida con SwiftUI y SwiftData, permite crear, personalizar y ejecutar rutinas sin conexión.

### ✨ Filosofía

- Simplicidad primero: interfaz limpia y sin fricciones
- Offline-first: funciona sin internet
- Rendimiento: rápida y eficiente
- Privacidad: tus datos en tu dispositivo (con sincronización opcional)

## 🚀 Características

### ✅ Actuales

- 🏋️ **Gestión de rutinas**: Crea y organiza rutinas personalizadas
- ⏱️ **Temporizador inteligente**: Retroalimentación visual y háptica
- 📱 **Interfaz SwiftUI**: Diseño moderno y nativo
- 🌓 **Modo oscuro**: Soporte completo para temas claro y oscuro
- ⌚ **Apple Watch**: App sincronizada para el reloj

### 🔜 Próximamente

- ☁️ Sincronización en la nube
- 👥 Cuentas de usuario
- 🔄 Sincronización entre dispositivos
- 📤 Compartir rutinas con amigos
- 📊 Historial y estadísticas de entrenamientos

## 🗺️ Hoja de ruta

### ⭐ Versión 1 — MVP Local (sin backend)

> **Objetivo**: App 100% funcional sin depender de Internet. Perfecta para TestFlight inicial.

#### Funcionalidades

1. **Interfaz minimalista**
   - Lista de rutinas
   - Reproductor de ejercicios tipo "flow"

2. **Modelo de datos local**
   - Almacenamiento con SwiftData
   - Persistencia local

3. **Temporizador avanzado**
   - Vibración
   - Sonidos personalizables
   - Indicadores visuales

4. **Editor de rutinas**
   - Creación rápida
   - Personalización completa
   - Organización intuitiva

5. **Experiencia multiplataforma**
   - App Apple Watch sincronizada
   - Diseño adaptativo iOS/watchOS
   - Modo oscuro/claro

### ⭐ Versión 2 — Backend + Cuentas de Usuario

> **Objetivo**: Sincronización segura en la nube.

#### Stack técnico recomendado: Supabase

**¿Por qué Supabase?**

- ✔️ Autenticación integrada
- ✔️ PostgreSQL con Row Level Security (RLS)
- ✔️ API REST generada automáticamente
- ✔️ Webhooks y Edge Functions
- ✔️ Fácil integración con Swift
- ✔️ Plan gratuito para desarrollo

**Alternativa**: Firebase (menos flexible pero más rápido de configurar)

#### Funcionalidades

1. **Autenticación**
   - Crear cuenta / Login / Logout
   - Gestión de sesiones
   - Recuperación de contraseña

2. **Sincronización en la nube**
   - Backup automático de rutinas
   - Sincronización bidireccional
   - Soporte offline-first

3. **Gestión de datos**
   - Rutinas favoritas
   - Historial de entrenamientos
   - Exportar/importar rutinas

### ⭐ Versión 3 — Monetización + Comunidad

> **Objetivo**: Profesionalización y publicación en App Store.

#### Funcionalidades

1. **In-App Purchases (IAP)**
   - Rutinas premium curadas
   - Packs de sonidos personalizados
   - Planes de entrenamiento guiados
   - Modo sin anuncios (si aplica)

2. **Funciones sociales**
   - Compartir rutinas con amigos
   - Importar rutinas de la comunidad
   - Sistema de valoraciones

3. **Mejoras de experiencia**
   - Modo "Entrenar ahora" (rutina aleatoria)
   - Widgets para iOS
   - Complicaciones para Apple Watch
   - Sincronización multiusuario

4. **Analítica y seguimiento**
   - Estadísticas avanzadas
   - Gráficos de progreso
   - Objetivos y logros

🎯 **Milestone**: Publicación en App Store

## 🏗️ Arquitectura

El proyecto sigue una arquitectura limpia por capas, inspirada en Clean Architecture, para facilitar la escalabilidad y el mantenimiento.

```
WorkoutNow/
├── 🗂️ Models/
│   ├── Routine.swift
│   ├── Exercise.swift
│   └── UserData.swift
│
├── 🧠 ViewModels/
│   ├── RoutineListViewModel.swift
│   └── WorkoutPlayerViewModel.swift
│
├── 📱 Views/
│   ├── RoutineListView.swift
│   ├── WorkoutPlayerView.swift
│   └── Components/
│
├── 🔧 Services/
│   ├── LocalStore/      (SwiftData persistence)
│   ├── CloudSync/       (Supabase sync)
│   └── Auth/            (Authentication)
│
├── ⌚ WatchApp/
│   ├── Views/
│   └── ViewModels/
│
└── 🧩 Shared/
    ├── Extensions/
    ├── Utilities/
    └── Constants/
```

### Principios de diseño

- **Separación de responsabilidades**: Cada capa tiene un propósito claro
- **Testeable**: Lógica desacoplada de la UI
- **Escalable**: Fácil añadir nuevas features sin romper el código existente
- **Modular**: Componentes reutilizables y bien organizados

## 🛠️ Tecnologías

### Frontend

- **SwiftUI**: Framework declarativo para interfaces de usuario
- **SwiftData**: Persistencia de datos local (iOS 17+)
- **Combine**: Programación reactiva y manejo de eventos
- **WidgetKit**: Widgets para pantalla de inicio
- **WatchKit**: App para Apple Watch

### Backend (Planeado - V2)

- **Supabase**: Backend-as-a-Service
  - PostgreSQL con Row Level Security
  - Autenticación y autorización
  - API REST automática
  - Real-time subscriptions
  - Edge Functions

### Herramientas de desarrollo

- **Xcode 16+**: IDE principal
- **Swift 5.9+**: Lenguaje de programación
- **Git**: Control de versiones
- **TestFlight**: Beta testing

## 🚦 Comenzando

### Requisitos previos

- macOS 14.0 (Sonoma) o superior
- Xcode 16.0 o superior
- iOS 17.0+ / watchOS 10.0+ (para testing en dispositivos)
- Cuenta de desarrollador de Apple (para testing en dispositivo)

### Instalación

1. **Clonar el repositorio**

   ```bash
   git clone https://github.com/tuusuario/WorkoutNow.git
   cd WorkoutNow
   ```

2. **Abrir el proyecto**

   ```bash
   open WorkoutNow.xcodeproj
   ```

3. **Configurar el equipo de desarrollo**
   - En Xcode, selecciona el proyecto en el navegador
   - Ve a "Signing & Capabilities"
   - Selecciona tu equipo de desarrollo

4. **Ejecutar**
   - Selecciona un simulador o dispositivo
   - Presiona `⌘ + R` o haz clic en el botón Play

### Estructura de branches

- `main`: Producción (App Store releases)
- `develop`: Desarrollo activo
- `feature/*`: Nuevas características
- `bugfix/*`: Corrección de bugs

## 🤝 Contribuir

Las contribuciones son bienvenidas y apreciadas. Si quieres contribuir:

1. **Fork** el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add: nueva funcionalidad increíble'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un **Pull Request** usando el [template de PR](.github/PULL_REQUEST_TEMPLATE.md)

### Guía de estilo

- Sigue las convenciones de Swift API Design Guidelines
- Usa nombres descriptivos para variables y funciones
- Comenta el código complejo
- Escribe tests para nuevas funcionalidades

### Reporte de bugs

Si encuentras un bug, por favor abre un **issue** usando el [template de reporte de bugs](.github/ISSUE_TEMPLATE/bug_report.md) que incluye:

- Descripción clara del problema
- Pasos para reproducirlo
- Comportamiento esperado vs actual
- Screenshots (si aplica)
- Versión de iOS/watchOS

### Solicitud de features

¿Tienes una idea para mejorar la app? Usa el [template de feature request](.github/ISSUE_TEMPLATE/feature_request.md) para proponer nuevas características.

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.

## 💬 Contacto

**Desarrollador**: Juan Carlos Acosta Peraba

- GitHub: [@JuanCarlosAcostaPeraba](https://github.com/JuanCarlosAcostaPeraba)
- Email: [juancarlos.ap.dev@gmail.com](mailto:juancarlos.ap.dev@gmail.com)

**Link del proyecto**: [https://github.com/JuanCarlosAcostaPeraba/WorkoutNow](https://github.com/JuanCarlosAcostaPeraba/WorkoutNow)

---

<div align="center">

### ⭐ Si te gusta este proyecto, dale una estrella

Hecho con ❤️ y SwiftUI

</div>
