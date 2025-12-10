# WORKOUT NOW

# ROADMAP PROFESIONAL

## ⭐ VERSIÓN 1 — MVP Local (sin backend)

> Objetivo: La app debe permitir crear rutinas y ejecutarlas sin depender de Internet.

Funcionalidades
	1.	UI minimalista (lista de rutinas + reproductor de ejercicios)
	2.	Modelo de datos local con SwiftData
	3.	Timer con vibración y sonidos
	4.	Editor de rutinas
	5.	Reproductor visual tipo “flow”
	6.	Modo oscuro/claro
	7.	Versión Apple Watch sincronizada con el iPhone
	8.	Un diseño claro y rápido, sin fricciones (tu filosofía principal)

Resultado esperado

Una app 100% usable por cualquier persona, perfecta para TestFlight inicial.

## ⭐ VERSIÓN 2 — Backend + Cuenta de Usuario

> Objetivo: Sincronización segura en la nube.

¿Qué backend usar?

Para un proyecto pequeño/medio, donde tú eres el único developer:

Mi recomendación técnica: Supabase

✔️ Autenticación
✔️ PostgreSQL con RLS
✔️ API generada automáticamente
✔️ Webhooks y Edge Functions
✔️ Muy fácil de integrar con Swift
✔️ Gratis en desarrollo

Alternativa: Firebase — pero Supabase te da SQL real y mejor estructura a largo plazo.

Funcionalidades de la V2:
	1.	Crear cuenta / iniciar sesión / cerrar sesión
	2.	Sincronizar rutinas con la nube
	3.	Sincronización bidireccional offline-first
	4.	Guardar rutina favorita / últimas rutinas
	5.	Exportar/importar rutinas del dispositivo

## ⭐ VERSIÓN 3 — Monetización + Comunidad

Objetivo: Profesionalización.

Funcionalidades
	1.	In-App Purchases (IAP):
	•	Rutinas premium
	•	Sonidos personalizados
	•	Planes de entrenamiento “guiados”
	2.	Sincronización entre varios dispositivos
	3.	Compartir rutinas con amigos
	4.	Modo “Entrenar ya” ultra rápido
(botón grande que selecciona una rutina aleatoria)

A partir de aquí → subida a App Store.

---

🗂️ Estructura técnica del proyecto

Vamos a dividir tu código en capas, estilo Clean Architecture (suave, sin complicarse en exceso):

```bash
WorkoutNow/
 ├── Models/          (routines, exercises, user data)
 ├── ViewModels/      (lógica de UI)
 ├── Views/           (SwiftUI)
 ├── Services/
 │     ├── LocalStore (SwiftData)
 │     ├── CloudSync  (Supabase)
 │     └── Auth       (Supabase Auth)
 ├── WatchApp/
 └── Shared/
```

Esto te permite escalar el proyecto sin caos.
