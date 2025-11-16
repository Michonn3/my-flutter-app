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
Branching
Recommended git workflow:

- git status 
- git pull # pull the latest changes only if your working tree is clean or commit/ stash first
- git checkout -b feature/my-new-feature
# make changes 
- git status # work and check status often
- git add . # stage your changes
- git commit -m "feat: add filter options for grocery items" # commit your work
- git push -u origin feature/my-new-feature # push your work
- # create a pull request and merge into main
- git checkout main # return to main and clean up
- git pull
- git branch -d feature/my-new-feature # optional: delete old feature branch
- git branch # lists all local branches. * next to current branch

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
