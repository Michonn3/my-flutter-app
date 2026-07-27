# Groceries to Kart

A full-stack grocery planning application built with Flutter Node.js, and MongoDB.

---

## Overview

Groceries to Kart is a personal software engineering project that explores how mobile applications, backend services, databases, and image processing can work together to improve the grocery shopping experience.

Rather than simply creating a digital grocery list, the long-term goal is to build a system capable of organizing shopping information from multiple sources—including user input and grocery-related images—and presenting it in a way that makes shopping more efficient.

This repository documents both the application and my growth as a software engineer while building it.

---

## Why I Built This

Most grocery applications focus on creating lists.

I wanted to explore a more interesting engineering problem:

> How can software understand grocery information well enough to organize it into a smarter shopping experience?

Answering that question requires much more than building screens.

It involves designing APIs, modeling data, validating user input, storing information, and eventually connecting image-processing workflows to a mobile application.

---

## Current Features

- User profile creation
- Form validation
- Password confirmation
- Home screen navigation
- Early file selection support

- ---

## Planned features

- Grocery list management
- Receipt and grocery image uploads
- OCR (Optical Character Recognition"
- Node.js REST API
- MongoDB persistence
- Store layout modeling
- Intelligent grocery organization
- Item normalization and mapping
- Image-assisted grocery planning.

---

## Technology Stack

### Mobile 

- Flutter
- Dart
- Material Design

### Backend (In Progress)

- Node.js
- Express
- MongoDB

---

## What I'm Learning

This project is helping me develop practical software engineering skills beyond writing code.

Current areas of focus include:

- Mobile application architecture
- REST API design
- Backend development
- Database modeling
- Separation of concerns
- Error handling
- Form validation
- Request/ response flows
- Git workflows
- Testing
- Incremental software design

---

## Project Status

 **Active Development**

 Groceries to Kart is currently and education portfolio project. Features are added incrementally as I continue learning software engineering principles and applying them to a real application.

 ---

 ## Getting Started

 ### Clone the Repository

 ```bash
git clone https://github.com/Michonn3/groceries-to-kart.git

## Install Dependencies

```bash
flutter pub get
```

## Run the Application

```bash
flutter run
```

---

## Future Roadmap

- [] Complete grocery workflow
- [] Integrate backend API
- [] Store grocery data in MongoDB
- [] Add OCR pipeline
- [] Organize grocery lists by store layout
- [] Improve testing
- [] Deploy backend

---

## Author

**Michelle Navarro**

Computer Science graduate, software engineering educator, and aspiring backend software engineer.

This project represents my journey from building applications to understanding how software systems are designed.

## Screenshots

### Profile Create

![Profile Creation](docs/screenshots/profile-creation.png)

___ 

### Home Screen

![Home Screen](docs/screenshots/home-screen.png)

---

## Grocery Upload *(Coming Soon)*

Screenshot coming soon

## System Architecture

```text
                        +---------------------------+
                        |       Flutter App         |
                        +-------------+-------------+
                                      |
                                      | HTTP Requests
                                      |
                        +-------------v-------------+
                        |     Express REST API      |
                        +---------------------------+
                                      |
                  +-------------------+------------------+
                  |                                      |
      +-----------v----------+               +-----------v----------+
      |      MongoDB         |               |      OCR Service     |
      |    Grocery Data      |               |    Image Analysis    |
      +----------------------+               +----------------------+
```
## Request Flow

### Grocery Scan Request Flow

```text
User selects grocery image
            |
            ▼
Flutter uploads image
            |
            ▼
Express API receivese request
            |
            ▼
OCR extracts grocery items
            |
            ▼
Items are normalized
            |
            ▼
MongoDB stores grocery scan
            |
            ▼
Flutter receives organized list
            |
            ▼
User review grocery list
```
## Project Timeline

|   Date   | Milestone |
|----------|-----------|
|June 2026 | Started Flutter application              |
|June 2026 | Added profile creation and validation    |
|June 2026 | Built home screen navigation             |
|July 2026 | Began backend architecture with Node.js and MongoDB|
|July 2026 | Started grocery image upload workflow    |
|Future    | OCR integration                          |
|Future    | Store-aware grocery organization         |
|Future    | Production deployment                    |

## Project Structure

```text
groceries-to-kart/
|
|── lib/
|   |── main.dart
|   |── screens/
|   |── widgets/
|   |── services/
|   |── models/
|
|── backend/
|   |── routes/
|   |── models/
|   |── controllers/
|   |── server.js
|
|── docs/
|   |── screenshots/
|   |── diagrams/
|
|──  test/
|
|── READ.md
```



