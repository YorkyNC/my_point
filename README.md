# My Point

## Getting Started

### Prerequisites

- Flutter SDK (version X.X.X)
- Dart SDK (version X.X.X)
- Android Studio / VS Code
- iOS development tools (for Mac users)

### Installation

1. Clone the repository
```bash
git clone ...
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

4. Run build runner
```bash
Shift + Command + B
```

## Branch Naming Conventions

We follow a strict branch naming convention to maintain clarity and organization:

### Main Branches
- `prod` - Production-ready code
- `dev` - Development branch, feature branches merge here first
- `master` - Initial branch

### Feature Branches
Format: `feature/ABC-123/short-description`
- `feature/` - Prefix for new features
- `ABC-123` - Feature name or Task number
- `short-description` - Brief description using kebab-case

Examples:
- `feature/LOGIN-001/implement-google-auth`
- `feature/PROFILE-045/add-avatar-upload`

### Bug Fix Branches
Format: `bugfix/ABC-123/short-description`
- `bugfix/` - Prefix for bug fixes
- `ABC-123` - Feature name or Task number
- `short-description` - Brief description using kebab-case

Example:
- `bugfix/AUTH-089/fix-token-expiration`

### Hotfix Branches
Format: `hotfix/ABC-123/short-description`
For urgent fixes that need to be merged directly into main.

Example:
- `hotfix/PAY-101/fix-payment-crash`

## Code Conventions

### Dart/Flutter Style Guide

1. **Naming Conventions** 
   - Classes: UpperCamelCase
   ```dart
   class UserAuthentication { }
   ```
   - Variables and methods: lowerCamelCase
   ```dart
   final userName = 'John';
   void getUserData() { }
   ```
   - Constants: SCREAMING_SNAKE_CASE
   ```dart
   const API_BASE_URL = 'https://api.example.com';
   ```

2. **File Naming**
   - Use snake_case for file names
   - Add type suffix for clarity
   ```
   user_repository.dart
   auth_service.dart
   home_screen.dart
   custom_button.dart
   ```

3. **Project Structure**
```
lib/
├── app/
│   ├── application.dart
│   ├── default_main_page.dart
│   ├── flavor_builds.dart
│   ├── imports.dart
│   └── responsive.dart
├── core/
│   ├── api/
│   ├── base/
│   ├── env/
│   ├── error/
│   ├── exceptions/
│   ├── localization/
│   ├── router/
│   ├── secure/
│   ├── services/
│   ├── theme/
│   ├── utils/
│   └── widgets/
├── features/
└── main files
    ├── firebase_options.dart
    ├── main_dev.dart
    ├── main_prod.dart
    ├── main_staging.dart
    └── main.dart
```

4. **Widget Structure**
   - Separate widgets into smaller components
   - Use const constructor when possible
   ```dart
   class CustomButton extends StatelessWidget {
     const CustomButton({
       super.key,
       required this.onPressed,
       required this.label,
     });

     final VoidCallback onPressed;
     final String label;
   }
   ```

5. **State Management**
   - Prefer Bloc/Cubit for complex state management
   - Use Provider for simple state management
   - Keep widgets as stateless as possible

6. **Error Handling**
   - Use custom exceptions
   - Implement proper error handling in repositories
   - Show user-friendly error messages


### Git Commit Conventions

Format: `type(scope): description`

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, missing semi-colons, etc)
- `refactor`: Code refactoring
- `test`: Adding missing tests
- `chore`: Maintenance tasks

Examples:
```
feat(auth): implement biometric login
fix(payments): resolve double charge issue
docs(readme): update installation steps
```

## CI/CD Pipeline

- Explain your CI/CD setup
- List automated checks and deployments
- Include badge statuses
