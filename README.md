# Reminder App 📝⏰

A modern, feature-rich reminder application built with Flutter that helps users manage their tasks and stay organized with scheduled notifications.

## 📖 Description

Reminder App is a cross-platform mobile application that allows users to create, manage, and track reminders with scheduled notifications. The app provides a clean and intuitive interface for managing daily tasks, important events, and personal commitments. Built with clean architecture principles, the app ensures maintainability, scalability, and testability.

## ✨ Features

- ✅ **Create Reminders**: Add new reminders with title, description, and scheduled date/time
- ✏️ **Update Reminders**: Edit existing reminder details
- 🗑️ **Delete Reminders**: Remove completed or unwanted reminders
- ✔️ **Toggle Completion**: Mark reminders as completed or incomplete
- 🔔 **Local Notifications**: Receive notifications at the scheduled time
- 💾 **Offline Storage**: All reminders are stored locally using Hive database
- 🌙 **Dark Theme**: Beautiful dark theme interface
- 🚀 **Splash Screen**: Animated splash screen on app launch
- 📱 **Responsive UI**: Adapts to different screen sizes
- 🔄 **State Management**: Efficient state management using BLoC pattern

## 🛠️ Tech Stack

### Languages & Framework
- **Flutter** (SDK ^3.9.2)
- **Dart**

### Key Packages & Libraries

#### State Management & Architecture
- `flutter_bloc: ^9.1.1` - BLoC state management
- `bloc_builder: ^2.2.2` - Helper for building BLoC UI
- `equatable: ^2.0.8` - Value equality for state classes

#### Local Storage
- `hive: ^2.2.3` - Lightweight and fast NoSQL database
- `hive_flutter: ^1.1.0` - Flutter extensions for Hive
- `hive_generator: ^2.0.1` - Code generation for Hive models

#### Navigation
- `go_router: ^17.0.1` - Declarative routing package

#### Notifications
- `flutter_local_notifications: ^17.0.0` - Local notification support
- `timezone: ^0.9.2` - Timezone support for scheduled notifications

#### Dependency Injection
- `get_it: ^9.2.0` - Service locator for dependency injection

#### Other
- `intl: ^0.20.2` - Internationalization and date formatting
- `cupertino_icons: ^1.0.8` - iOS style icons

#### Development Tools
- `build_runner: ^2.4.13` - Code generation runner
- `flutter_lints: ^5.0.0` - Recommended lints for Flutter

## 📁 Folder Structure

```
lib/
├── core/                          # Core functionality and utilities
│   └── utils/                    
│       ├── app_routes.dart       # Application routing configuration
│       ├── dependecy_injection.dart # Service locator setup
│       └── notification_service.dart # Local notification handling
│
├── features/                      # Feature modules
│   ├── reminder/                 # Reminder feature
│   │   ├── data/                # Data layer
│   │   │   ├── models/          # Data models
│   │   │   │   ├── reminder_model.dart
│   │   │   │   └── reminder_model.g.dart # Generated Hive adapter
│   │   │   └── repo/            # Repository pattern
│   │   │       ├── reminder_repo.dart
│   │   │       └── reminder_repo_impl.dart
│   │   └── presentation/        # Presentation layer
│   │       ├── cubit/          # State management
│   │       │   └── reminder_cubit/
│   │       │       ├── reminder_cubit.dart
│   │       │       └── reminder_state.dart
│   │       └── views/          # UI screens and widgets
│   │           ├── add_reminder_view.dart
│   │           ├── reminder_view.dart
│   │           ├── update_view.dart
│   │           └── widgets/    # Reusable widgets
│   │               ├── add_reminder_body.dart
│   │               ├── custom_button.dart
│   │               ├── custom_reminder_list_view.dart
│   │               ├── custom_text_form_field.dart
│   │               ├── reminder_item.dart
│   │               ├── reminder_view_body.dart
│   │               ├── reminder_view_failure_body.dart
│   │               ├── reminder_view_initial_body.dart
│   │               ├── reminder_view_loaded_body.dart
│   │               ├── reminder_view_loading_body.dart
│   │               └── update_view_body.dart
│   │
│   └── splash/                   # Splash screen feature
│       └── presentation/
│           └── views/
│               ├── splash_view.dart
│               └── widgets/
│                   ├── slider_text.dart
│                   └── splash_view_body.dart
│
└── main.dart                     # Application entry point
```

### Architecture Pattern

The app follows **Clean Architecture** with feature-based organization:
- **Data Layer**: Models, repositories for data access
- **Presentation Layer**: UI screens, widgets, and state management (BLoC/Cubit)
- **Core**: Shared utilities, services, and configurations

## 🚀 Installation

### Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.9.2 or higher)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- An Android emulator or iOS simulator (or a physical device)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/mohamadnafe14-arch/Reminder-App.git
   cd Reminder-App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Hive adapters**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Verify Flutter installation**
   ```bash
   flutter doctor
   ```

## ▶️ How to Run

### Running on Android/iOS

1. **Connect a device or start an emulator**

2. **Check connected devices**
   ```bash
   flutter devices
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Running on Web

```bash
flutter run -d chrome
```

### Running on specific platform

```bash
# Android
flutter run -d android

# iOS (macOS only)
flutter run -d ios

# Windows
flutter run -d windows

# macOS
flutter run -d macos

# Linux
flutter run -d linux
```

## ⚙️ Configuration

### Environment Variables

*Currently, this project does not require any environment variables.*

### Android Permissions

The app requires the following Android permissions (already configured in `AndroidManifest.xml`):

```xml
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM"/>
```

These permissions are necessary for:
- **RECEIVE_BOOT_COMPLETED**: To reschedule notifications after device reboot
- **SCHEDULE_EXACT_ALARM**: To schedule exact-time notifications

### iOS Permissions

For iOS, notification permissions are requested at runtime by the `flutter_local_notifications` package.

## 💡 Usage Examples

### Creating a Reminder

1. Launch the app
2. On the main screen, tap the "Add" button
3. Fill in the reminder details:
   - **Title**: Enter a concise title
   - **Description**: Add detailed information
   - **Date & Time**: Select when you want to be reminded
4. Tap "Save" to create the reminder

### Updating a Reminder

1. From the reminders list, tap on any reminder
2. Modify the desired fields
3. Tap "Update" to save changes

### Marking as Complete

- Tap the checkbox next to any reminder to toggle its completion status

### Deleting a Reminder

- Swipe left on a reminder and tap the delete button (or use the delete option in the update screen)

## 🧪 Build / Test Instructions

### Building for Production

#### Android APK
```bash
flutter build apk --release
```

#### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

#### iOS (macOS only)
```bash
flutter build ios --release
```

#### Web
```bash
flutter build web --release
```

#### Windows
```bash
flutter build windows --release
```

### Running Tests

*Note: Test files are not yet implemented in this project.*

To add and run tests:

1. Create test files in the `test/` directory
2. Run tests with:
   ```bash
   flutter test
   ```

3. For test coverage:
   ```bash
   flutter test --coverage
   ```

## 📸 Screenshots

*Screenshots will be added here*

<!-- 
Add your app screenshots here:

| Home Screen | Add Reminder | Notifications |
|-------------|--------------|---------------|
| ![Home](screenshots/home.png) | ![Add](screenshots/add.png) | ![Notifications](screenshots/notification.png) |
-->

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. **Fork the repository**
   ```bash
   git clone https://github.com/your-username/Reminder-App.git
   ```

2. **Create a feature branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```

3. **Make your changes** and commit them
   ```bash
   git commit -m 'Add some amazing feature'
   ```

4. **Push to the branch**
   ```bash
   git push origin feature/amazing-feature
   ```

5. **Open a Pull Request**

### Code Style Guidelines

- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` to check for issues
- Format code using `dart format .`
- Write meaningful commit messages
- Add comments for complex logic

## 📄 License

*License information not specified in the project.*

**Assumption**: This project is likely licensed under the MIT License or is proprietary. Please add a `LICENSE` file to specify the license terms.

Example MIT License:
```
MIT License

Copyright (c) 2024 Reminder App Contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files...
```

## 👨‍💻 Author / Credits

### Author
- **GitHub**: [@mohamadnafe14-arch](https://github.com/mohamadnafe14-arch)
- **Repository**: [Reminder-App](https://github.com/mohamadnafe14-arch/Reminder-App)

### Built With
- [Flutter](https://flutter.dev/) - UI framework
- [Hive](https://docs.hivedb.dev/) - Local database
- [BLoC](https://bloclibrary.dev/) - State management pattern
- [GoRouter](https://pub.dev/packages/go_router) - Navigation
- [Flutter Local Notifications](https://pub.dev/packages/flutter_local_notifications) - Notification system

---

## 🐛 Known Issues / Future Improvements

*Based on code analysis, here are potential improvements:*

- [ ] Add unit tests and widget tests
- [ ] Add integration tests
- [ ] Implement search functionality for reminders
- [ ] Add categories/tags for reminders
- [ ] Implement recurring reminders
- [ ] Add data export/import functionality
- [ ] Add cloud backup support
- [ ] Implement user authentication
- [ ] Add multi-language support
- [ ] Improve error handling with custom error messages

---

**Made with ❤️ using Flutter**
