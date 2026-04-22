# Hello Android

A minimal Android demo app built with modern best practices.

## Tech Stack

| Layer | Choice |
|---|---|
| Language | Kotlin |
| UI | Jetpack Compose + Material 3 |
| Build | Gradle (Kotlin DSL) + Version Catalog |
| Min SDK | 24 (Android 7.0) |
| Target SDK | 35 (Android 15) |

## Project Structure

```
HelloAndroid/
├── gradle/
│   ├── libs.versions.toml      # Single source of truth for all dependency versions
│   └── wrapper/
│       └── gradle-wrapper.properties
├── app/
│   ├── build.gradle.kts        # App module – compile options, build types, dependencies
│   ├── proguard-rules.pro      # R8/ProGuard rules for release builds
│   └── src/
│       ├── main/
│       │   ├── AndroidManifest.xml
│       │   ├── kotlin/com/demo/hello/
│       │   │   ├── MainActivity.kt          # Single entry-point activity
│       │   │   └── ui/theme/
│       │   │       ├── Color.kt
│       │   │       ├── Theme.kt             # Dynamic color + dark/light support
│       │   │       └── Type.kt
│       │   └── res/
│       │       ├── values/strings.xml
│       │       ├── values/themes.xml
│       │       └── mipmap-anydpi-v26/       # Adaptive launcher icons
│       ├── test/                            # JVM unit tests
│       └── androidTest/                     # On-device instrumented tests
├── build.gradle.kts            # Root build – plugin declarations only
├── settings.gradle.kts         # Module graph + repository config
└── gradle.properties           # JVM args, AndroidX flags, Kotlin code style
```

## Getting Started

### Prerequisites

- Android Studio Ladybug (2024.2) or newer
- JDK 17+

### Open in Android Studio

1. `File > Open` → select the `HelloAndroid` folder
2. Android Studio will sync Gradle automatically and download the wrapper

### Build from the command line

```bash
# Generate the Gradle wrapper (first-time only, requires Gradle installed globally)
gradle wrapper --gradle-version 8.11.1

# Debug build
./gradlew assembleDebug

# Run unit tests
./gradlew test

# Run instrumented tests (requires a connected device/emulator)
./gradlew connectedAndroidTest
```

## Key Decisions

- **Version catalog (`libs.versions.toml`)** — all dependency versions live in one file, eliminating version drift across modules.
- **Kotlin DSL (`*.gradle.kts`)** — type-safe, IDE-autocompleted build scripts.
- **`enableEdgeToEdge()`** — draws behind system bars; `Scaffold` insets handle padding correctly.
- **Dynamic color** — picks up the device wallpaper palette on Android 12+, falls back to a static Material 3 purple scheme on older devices.
- **Separate debug/release build types** — debug variant gets an `.debug` application ID suffix so both variants can be installed side-by-side; release enables R8 minification and resource shrinking.
- **`nonTransitiveRClass = true`** — each module only sees its own R fields, improving build performance at scale.
