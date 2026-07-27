# 🏠 Home Service Customer App

A production-ready Flutter application built as part of a technical assessment. The application allows users to browse home services, view service details, add services to cart, and complete bookings while following Clean Architecture and BLoC state management principles.

---

# Flutter Version

```bash
Flutter 3.35.x
Dart 3.9.x
```

> Replace the above with the output of:

```bash
flutter --version
```

---

# Project Architecture

The application follows **Clean Architecture** with **Feature-first organization**.

```
Presentation
      │
      ▼
Domain (Business Logic)
      │
      ▼
Data (Repository + Data Source)
      │
      ▼
Remote API / Local Storage
```

Each feature is completely isolated and contains its own:

- Data Layer
- Domain Layer
- Presentation Layer
- Dependency Injection

This makes the application scalable, testable, and easy to maintain.

---

# Project Structure

```
lib/
│
├── config/
│   ├── injector/
│   └── boxes/
│
├── core/
│   ├── components/
│   ├── dio/
│   ├── error/
│   ├── extensions/
│   ├── helpers/
│   ├── network/
│   ├── routes/
│   ├── themes/
│   ├── usecases/
│   └── utils/
│
├── features/
│   ├── booking/
│   ├── cart/
│   ├── category/
│   ├── home/
│   └── service/
│
├── l10n/
│
├── providers.dart
├── my_app.dart
└── main.dart
```

---

# Folder Explanation

## config/

Application configuration.

- Dependency Injection
- Hive Boxes
- Global configuration

---

## core/

Shared code used across the entire application.

Contains:

- Common Widgets
- Network Layer (Dio)
- Theme
- Routing
- Helpers
- Extensions
- Error Handling
- Utilities
- Base UseCases

This folder has **no feature-specific logic**.

---

## features/

Every application module is placed inside its own feature.

Example:

```
features/
    service/
```

Each feature follows Clean Architecture.

```
service/

├── data/
│   ├── datasource/
│   ├── model/
│   └── repository/
│
├── domain/
│   ├── entities/
│   ├── repository/
│   ├── params/
│   └── usecases/
│
├── di/
│
└── presentation/
    ├── bloc/
    ├── components/
    └── pages/
```

### Data Layer

Responsible for:

- API Calls
- Local Database
- DTO Models
- Repository Implementation

---

### Domain Layer

Contains pure business logic.

Includes:

- Entities
- Repository Contracts
- Use Cases
- Parameters

No Flutter imports exist inside this layer.

---

### Presentation Layer

Responsible for UI.

Contains:

- Pages
- Widgets
- BLoC/Cubit
- Events
- States

---

### Dependency Injection

Every feature registers its own dependencies separately, keeping modules independent.

---

# Features Implemented

- Current Location
- Banner Carousel
- Categories
- Popular Services
- Service Details
- Add to Cart
- Cart Management
- Bill Calculation
- Booking Flow
- Booking Confirmation
- Pull to Refresh
- Cached Images
- Responsive UI
- Localization
- Offline Cart Storage using Hive
- Error Handling
- Retry Support
- Clean Architecture
- Feature-based Structure

---

# State Management

The application uses

- **flutter_bloc**
- **Cubit** (for simple state handling)

Business logic is completely separated from UI.

---

# Local Storage

Hive is used for:

- Cart Persistence
- Offline Access

---

# Networking

The application uses **Dio**.

Includes:

- Logging Interceptor
- Exception Handling
- Authentication Interceptor
- Centralized Network Requester

---

# Architecture Flow

```
UI
 │
 ▼
Bloc / Cubit
 │
 ▼
UseCase
 │
 ▼
Repository
 │
 ▼
Datasource
 │
 ▼
REST API
```

---

# Packages Used

### State Management

- flutter_bloc
- equatable

### Dependency Injection

- get_it

### Networking

- dio

### Functional Programming

- fpdart

### Local Database

- hive
- hive_flutter

### Image

- cached_network_image

### Localization

- flutter_localizations

### Utilities

- intl
- shimmer
- carousel_slider

---

# How to Run

## 1. Clone Repository

```bash
git clone <repository-url>
```

---

## 2. Open Project

```bash
cd homeservice
```

---

## 3. Install Packages

```bash
flutter pub get
```

---

## 4. Generate Hive Files

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 5. Run Application

```bash
flutter run
```

---

# Build APK

```bash
flutter build apk --release
```

---

# Assumptions

- Public REST APIs are used for service data.
- Hive is used only for offline cart persistence.
- Booking API is mocked if unavailable.
- Images are loaded using Cached Network Image.
- Network errors are handled gracefully with retry support.

---

# Screenshots

_Add screenshots here (Optional)._

```
assets/screenshots/
```

---

# Future Improvements

- Unit Tests
- Widget Tests
- Firebase Crashlytics
- Push Notifications
- Payment Gateway
- Deep Linking
- Authentication
- Real Booking Backend

---

# Author

**Flutter Developer**

Built using Flutter with Clean Architecture and BLoC.
