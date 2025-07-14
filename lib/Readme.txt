lib/
├── app.dart                  # Main app widget, theme setup, router config
├── main.dart                 # App entry point
│
├── **core** # Core app logic and utilities
│   ├── api/                  # Abstract API definitions (if any)
│   ├── config/               # App configuration (e.g., environment)
│   ├── error/                # Custom exception & failure classes
│   ├── navigation/           # GoRouter setup and route definitions
│   ├── services/             # Cross-cutting services (e.g., sync, notifications)
│   └── utils/                # Helper functions, constants
│
├── **features** # Individual feature modules
│   ├── **auth** # Authentication feature
│   │   ├── data/
│   │   │   ├── datasources/  # Firebase auth data source
│   │   │   └── repositories/ # Auth repository implementation
│   │   ├── domain/
│   │   │   ├── entities/     # User entity
│   │   │   ├── repositories/ # Abstract auth repository
│   │   │   └── usecases/     # Login, Logout, GetUser use cases
│   │   └── presentation/
│   │       ├── providers/    # Riverpod providers for auth state
│   │       ├── screens/      # Login, register screens
│   │       └── widgets/      # Auth-specific widgets (e.g., login button)
│   │
│   ├── **expenses** # Expense management feature (similar structure)
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── **reports** # Reports & analytics feature (similar structure)
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── **shared** # Shared components and data models
    ├── data/                 # Shared data models (if any)
    ├── domain/               # Shared entities (if any)
    └── presentation/         # Shared widgets, themes, extensions
        ├── theme/            # App theme data (light/dark)
        └── widgets/          # Reusable widgets (e.g., custom buttons, loaders)
