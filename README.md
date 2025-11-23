Groceries to Kart 🛒  

  A Flutter app for turning grocery lists into a smart, organized shopping experience.

Overview
Groceries to Kart is a Flutter/Dart mobile app that helps users:

- Create and manage grocery lists
- Organize items by store, aisle, or category
- Reduce impulse buys and wasted trips
- Eventually connect to a backend for sync, analytics, and multi-device use

This project is also a portfolio-quality codebase to practice real-world mobile dev workflows (clean architecture, API integration, git, and documentation).

Tech Stack

- Frontend
  - Flutter (Dart)
  - Custom `AppTheme` for consistent colors, fonts, and spacing
  - Reusable widgets (e.g. `StyledCard`, custom buttons, form fields)

- Backend (planned / in progress)
  - Node.js + Express
  - MongoDB + Mongoose
  - REST API for lists, items, and user data

Features

Implemented / In Progress
- Create, edit, and delete grocery items
- Group items by list (e.g. “HEB”, “Costco”, “Meal Prep”)
- Basic form validation on item input
- Reusable UI components with custom theming

Planned

- Authentication (user accounts)
- Cloud sync with MongoDB backend
- Smart suggestions (frequently bought items)
- Offline mode + local caching
- Simple analytics (e.g. most common items)


Getting Started

Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- Dart (included with Flutter)
- A code editor (VS Code, Android Studio, or IntelliJ)
- (Optional) Node.js and MongoDB if working on the backend

Verify your setup:

```bash
flutter doctor

Common commands

- flutter clean # Clean build files
- flutter pub get # Install dependencies
- flutter pub outdated # Check for outdated packages

Project Structure 

- app_theme.dart - Centralized colors, typography, spacing
- widgets/ - Reusable UI componenets (cards, buttons, form fields)
- screens/ - Pages/routes the user navigates through
- models/ - Data structures used across app and backend
- services/ - Handles API calls and data fetching

Backend (Planned/ Optional)

The app is designed to talk to a Node.js/Express API with MongoDB.

Example API endpoints:

- GET /lists - Get all grocery lists
- POST /lists - Create a new list
- GET /lists/:id/items - Get items in a list
- POST /lists/:id/items - Add an item to a list

Development Workflow
Recommended git workflow:

1. git checkout main
2. git pull origin main # ensures main is up to date with Github
3. git checkout -b <type/short-branch-name>
# Branching naming pattern:
  # feat/... for new features
  # fix/... for bug fixes
  # refactor/... for cleanup/structure changes
  # chore/... for maintenance
  # docs/... for documentation changes
4. Code, run app, run tests
5. git status/ git diff 
6. git add . 
7. git commit -m "type: clear, short message"
8. git push -u origin <branch name>
9. Open PR -> review -> merge
10. git checkout main && git pull
11. Delete local and remote branch
git branch -d feature/my-new-feature

Commit Message Style
Use conventional commits when possible:

- feat: new feature
- fix: bug fix
- refactor: code cleanup
- docs: documentation only
- style: formatting, no logic changes

Testing
If you add tests later, document them here

- flutter test

Planned tests:
- Unit tests for models (grocery_item, grocery_list)
- Widget tests for major screens
- Integration tests for add/ edit/ delete flows
