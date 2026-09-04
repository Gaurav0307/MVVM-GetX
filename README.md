# 🚀 MVVM-GetX

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge\&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge\&logo=dart)
![GetX](https://img.shields.io/badge/GetX-State%20Management-purple?style=for-the-badge)
![MVVM](https://img.shields.io/badge/Architecture-MVVM-success?style=for-the-badge)
![Dio](https://img.shields.io/badge/Network-Dio-orange?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

### 📱 Production Ready Flutter MVVM Architecture using GetX

A scalable, maintainable, and developer-friendly Flutter project structure built with **MVVM Architecture**, **GetX**, **Dio**, **Repository Pattern**, **Dependency Injection**, and **Centralized Exception Handling**.

</div>

---
# 🚀 MVVM-GetX

### 🎯 A scalable Flutter MVVM architecture powered by GetX, Dio & Repository Pattern

A clean, scalable and developer-friendly **Flutter application architecture** demonstrating how to combine **MVVM (Model–View–ViewModel)** with **GetX**, **Dependency Injection**, **Dio**, **Repository Pattern**, **centralized API response handling**, and **network exception management**.

This project uses a practical Todo application to demonstrate how a real Flutter application can be organized so that **UI, business logic, data access, networking and infrastructure responsibilities remain separated**.

---

## ✨ Why This Project?

As Flutter applications grow, putting API calls, business logic, state management and UI code inside the same files quickly becomes difficult to maintain.

This project demonstrates a better approach:

```text
┌───────────────────────┐
│         VIEW          │
│   UI / User Actions   │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│      VIEW MODEL       │
│ State + Business Logic│
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│      REPOSITORY       │
│     Data Access       │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│      DIO CLIENT       │
│     HTTP / Network    │
└───────────┬───────────┘
            │
            ▼
┌───────────────────────┐
│       REST API        │
└───────────────────────┘
```

The result is a codebase that is easier to:

* 🧩 Extend
* 🧪 Test
* 🛠️ Debug
* 🔄 Refactor
* 👥 Maintain
* 📈 Scale

---

# 🌈 Features

| Feature                           | Description                                          |
| --------------------------------- | ---------------------------------------------------- |
| 🏗️ **MVVM Architecture**         | Separates UI from application/business logic         |
| ⚡ **GetX State Management**       | Reactive and simple state management                 |
| 💉 **Dependency Injection**       | GetX-based dependency registration                   |
| 🧭 **GetX Integration**           | Uses GetX throughout the application                 |
| 🌐 **Dio HTTP Client**            | Centralized HTTP communication                       |
| 📦 **Repository Pattern**         | Separates data access from ViewModels                |
| 🔄 **CRUD Operations**            | Create, Read, Update and Delete Todo data            |
| 📡 **API Abstraction**            | API calls are centralized inside `DioClient`         |
| 🚨 **Exception Handling**         | Centralized Dio/network exception conversion         |
| 📊 **API Response State**         | Loading, completed and error states                  |
| 💾 **SharedPreferences**          | Local persistent storage dependency                  |
| 📱 **Device Preview**             | Test the UI on different device configurations       |
| 🧱 **Reusable Architecture**      | Easily adaptable to larger applications              |
| 🧹 **Separation of Concerns**     | Each layer has a focused responsibility              |
| 📁 **Organized Folder Structure** | Clear separation between core, data and presentation |

---

# 🛠️ Tech Stack

### Core

* 💙 Flutter
* 🎯 Dart
* ⚡ GetX
* 🌐 Dio
* 💾 SharedPreferences
* 📱 Device Preview

### Architecture & Design Patterns

* 🏗️ MVVM
* 📦 Repository Pattern
* 💉 Dependency Injection
* 🔄 Reactive State Management
* 🚨 Centralized Exception Handling
* 📊 Centralized API Response Handling

---

# 📦 Dependencies

The project currently uses the following important packages:

| Package              | Purpose                                                   |
| -------------------- | --------------------------------------------------------- |
| `get`                | State management, dependency injection and GetX utilities |
| `dio`                | HTTP networking and REST API communication                |
| `http`               | HTTP package dependency                                   |
| `shared_preferences` | Local key-value persistence                               |
| `device_preview`     | Preview application layouts on different devices          |
| `cupertino_icons`    | Cupertino-style icons                                     |
| `flutter_lints`      | Dart/Flutter linting rules                                |

---

# 🏛️ Architecture

The project follows **MVVM — Model View ViewModel**.

## 🟦 Model

The Model represents the application's data.

In this project:

```text
lib/
└── data/
    └── models/
        └── ToDoModel.dart
```

`ToDoModel` represents Todo information received from or sent to the API.

The model is responsible for:

* Representing API data
* Converting JSON into Dart objects
* Converting Dart objects back into JSON

---

## 🟩 View

The View is responsible for the UI.

```text
lib/
└── presentation/
    └── views/
        ├── home_screen.dart
        └── create_todo.dart
```

The View should primarily:

* Display data
* Receive user input
* Trigger ViewModel methods
* React to state changes
* Display loading/error/success states

The View should **not** contain networking logic.

---

## 🟨 ViewModel

The ViewModel is the bridge between the UI and the data layer.

```text
lib/
└── presentation/
    └── view_models/
        └── todo_view_model.dart
```

`TodoViewModel` extends:

```dart
GetxController
```

It manages:

* Todo state
* Loading state
* Error state
* API operations
* Communication with `TodoRepository`
* Updating the UI

The ViewModel therefore becomes the main place for presentation-related business logic.

---

## 🟥 Repository

The Repository sits between the ViewModel and the network layer.

```text
lib/
└── data/
    └── repositories/
        └── todo_repository.dart
```

Instead of doing this:

```text
View
 ↓
Dio
 ↓
API
```

the application follows:

```text
View
 ↓
ViewModel
 ↓
Repository
 ↓
DioClient
 ↓
API
```

This keeps the ViewModel independent from the actual HTTP implementation.

---

# 🔄 Complete Data Flow

A typical request flows through the application like this:

```text
👤 User
   │
   ▼
🖥️ View
   │
   │ calls method
   ▼
🧠 TodoViewModel
   │
   │ requests data
   ▼
📦 TodoRepository
   │
   │ calls endpoint
   ▼
🌐 DioClient
   │
   │ HTTP Request
   ▼
☁️ REST API
   │
   │ HTTP Response
   ▼
🌐 DioClient
   │
   ▼
📦 TodoRepository
   │
   │ converts JSON
   ▼
🧠 TodoViewModel
   │
   │ updates ApiResponse
   ▼
🖥️ View
   │
   ▼
👤 User sees updated UI
```

---

# 📂 Project Structure

The current project is organized around three major layers:

```text
lib/
│
├── core/
│   ├── constants/
│   │   └── api_constants.dart
│   │
│   ├── global/
│   │   └── global.dart
│   │
│   ├── network/
│   │   ├── app_exceptions.dart
│   │   ├── dio_client.dart
│   │   └── dio_exception_handler.dart
│   │
│   └── response/
│       ├── api_response.dart
│       └── status.dart
│
├── data/
│   ├── models/
│   │   └── ToDoModel.dart
│   │
│   └── repositories/
│       └── todo_repository.dart
│
├── presentation/
│   ├── bindings/
│   │   └── initial_binding.dart
│   │
│   ├── view_models/
│   │   └── todo_view_model.dart
│   │
│   └── views/
│       ├── create_todo.dart
│       └── home_screen.dart
│
└── main.dart
```

---

# 🔍 Detailed `lib/` Folder Explanation

This is the most important part of the project.

The `lib` folder is intentionally divided into:

```text
core
data
presentation
```

Think of them as:

```text
CORE
 ↓
Application infrastructure

DATA
 ↓
Application data & data access

PRESENTATION
 ↓
UI + presentation logic
```

---

# 🧰 `lib/core`

The `core` directory contains functionality that is **not specific to one particular screen or feature**.

It provides infrastructure used by different parts of the application.

```text
core/
├── constants/
├── global/
├── network/
└── response/
```

---

## 📌 `core/constants`

```text
core/
└── constants/
    └── api_constants.dart
```

This folder contains application constants.

`api_constants.dart` contains API-related configuration such as:

* Base URL
* API endpoints
* Timeout configuration

For example, instead of scattering URLs throughout the application:

```dart
dio.get("https://example.com/todos");
```

the application can centralize them:

```dart
ApiConstants.todos
```

### Why?

Centralizing constants makes API configuration:

* Easier to modify
* Easier to maintain
* Less error-prone
* Easier to reuse

---

# 🌍 `core/global`

```text
core/
└── global/
    └── global.dart
```

This directory contains globally accessible application-level functionality.

It can be used for values or helpers that need to be shared across different layers.

Keeping global functionality in one place avoids scattering global configuration throughout the application.

---

# 🌐 `core/network`

```text
core/
└── network/
    ├── app_exceptions.dart
    ├── dio_client.dart
    └── dio_exception_handler.dart
```

This is the **networking layer**.

It is responsible for communication with external APIs.

---

## 🚀 `dio_client.dart`

`DioClient` is the centralized HTTP client.

Instead of creating Dio instances throughout the application, the project provides a single abstraction:

```dart
DioClient
```

It configures:

* Base URL
* Connection timeout
* Receive timeout
* Send timeout
* Headers
* Authorization
* Interceptors

It also provides HTTP methods such as:

```text
GET
POST
PUT
PATCH
DELETE
```

This gives the application a consistent API communication layer.

---

## 🔐 Authorization

The network client also supports retrieving an authentication token from local storage and adding it to requests as:

```text
Authorization: Bearer <token>
```

This means authentication handling can remain centralized rather than being repeated in every repository.

---

## 🪝 Interceptors

Dio interceptors allow the application to intercept requests and responses.

This project uses them for functionality such as:

```text
Request
  ↓
Interceptor
  ↓
API
  ↓
Response
  ↓
Interceptor
  ↓
Application
```

This is useful for:

* Authentication
* Logging
* Headers
* Request modification
* Response inspection
* Error handling

---

## 📤 File Upload Support

The `DioClient` also contains multipart file upload helpers.

Supported patterns include:

```text
POST multipart upload
PUT multipart upload
```

The upload helpers support:

* File selection
* Multipart form data
* Custom field names
* Additional body fields

This makes the network layer reusable for future applications that require:

* Profile image uploads
* Document uploads
* Multiple file operations
* Media uploads

---

## ⚠️ `dio_exception_handler.dart`

This file centralizes conversion of Dio exceptions into application-level exceptions.

Instead of handling every possible Dio exception inside every repository, the network layer can translate errors into meaningful application exceptions.

Conceptually:

```text
DioException
     ↓
Exception Handler
     ↓
Application Exception
```

This keeps the rest of the application cleaner.

---

## 🚨 `app_exceptions.dart`

This contains application-specific exception definitions.

Examples of useful exception categories include:

```text
Bad Request
Unauthorized
Forbidden
Not Found
Server Error
No Internet
Timeout
Unknown Error
```

This gives the application a consistent error model.

---

# 📊 `core/response`

```text
core/
└── response/
    ├── api_response.dart
    └── status.dart
```

This directory provides a common representation for API operation states.

---

## 🔹 `status.dart`

The project defines:

```dart
enum Status {
  loading,
  completed,
  error,
}
```

This gives the application three primary states:

```text
⏳ Loading
   ↓
✅ Completed

or

⏳ Loading
   ↓
❌ Error
```

---

## 🔹 `api_response.dart`

`ApiResponse<T>` is a generic response wrapper.

It contains:

```dart
Status? status;
T? data;
String? message;
```

It provides convenient constructors:

```dart
ApiResponse.loading()
```

```dart
ApiResponse.completed(data)
```

```dart
ApiResponse.error(message)
```

This allows the ViewModel to expose a single state object to the UI.

For example:

```text
ApiResponse<List<ToDoModel>>
```

can represent:

```text
Loading
Completed + Todo List
Error + Message
```

This is particularly useful for API-driven screens.

---

# 📦 `lib/data`

The `data` layer contains application data-related functionality.

```text
data/
├── models/
└── repositories/
```

Its main responsibility is:

> Getting data from external sources and converting that data into application-friendly objects.

---

# 🧱 `data/models`

```text
data/
└── models/
    └── ToDoModel.dart
```

Models represent application data.

`ToDoModel` represents the Todo object used by the application.

A model generally handles:

```text
JSON
 ↓
Dart Object
```

and:

```text
Dart Object
 ↓
JSON
```

For example:

```dart
ToDoModel.fromJson(...)
```

converts API JSON into a Dart object.

And:

```dart
todo.toJson()
```

converts the object back into JSON.

---

# 📚 `data/repositories`

```text
data/
└── repositories/
    └── todo_repository.dart
```

The Repository provides a clean API for the ViewModel.

The `TodoRepository` communicates with `DioClient` and converts API responses into `ToDoModel` objects.

It currently demonstrates operations such as:

```text
GET single Todo
GET all Todos
CREATE Todo
UPDATE Todo
DELETE Todo
```

The important separation is:

```text
ViewModel
    ↓
TodoRepository
    ↓
DioClient
```

The ViewModel doesn't need to know how HTTP requests are implemented.

---

# 🎨 `lib/presentation`

The presentation layer contains everything related to what the user sees and interacts with.

```text
presentation/
├── bindings/
├── view_models/
└── views/
```

This is where the **MVVM presentation side** lives.

---

# 💉 `presentation/bindings`

```text
presentation/
└── bindings/
    └── initial_binding.dart
```

This directory contains GetX dependency injection configuration.

`InitialBinding` registers the application's dependencies.

The current dependency chain is essentially:

```text
DioClient
   ↓
TodoRepository
   ↓
TodoViewModel
```

The binding registers them using GetX:

```dart
Get.lazyPut<DioClient>(...);

Get.lazyPut<TodoRepository>(
  () => TodoRepository(Get.find<DioClient>()),
);

Get.lazyPut<TodoViewModel>(
  () => TodoViewModel(Get.find<TodoRepository>()),
);
```

It also registers `SharedPreferences` asynchronously.

---

## 🧠 Why Bindings?

Without dependency injection, classes may need to manually construct their dependencies:

```dart
final dio = DioClient();

final repository = TodoRepository(dio);

final viewModel = TodoViewModel(repository);
```

With GetX dependency injection:

```text
GetX Container
     │
     ├── DioClient
     ├── TodoRepository
     └── TodoViewModel
```

Any registered dependency can then be retrieved with:

```dart
Get.find<TodoViewModel>();
```

This improves:

* Dependency management
* Testability
* Separation of concerns
* Reusability

---

# 🧠 `presentation/view_models`

```text
presentation/
└── view_models/
    └── todo_view_model.dart
```

This is the **ViewModel layer**.

`TodoViewModel` extends:

```dart
GetxController
```

It communicates with:

```text
TodoRepository
```

and exposes application state to the UI.

---

## 📊 ViewModel State

The ViewModel uses:

```dart
ApiResponse<List<ToDoModel>>
```

wrapped in an observable.

This allows the UI to respond to:

```text
Loading
Completed
Error
```

states.

---

## 🔄 Todo Operations

The ViewModel demonstrates methods for:

```text
getTodos()
getTodo()
createTodo()
updateTodo()
deleteTodo()
```

The general process is:

```text
User Action
     ↓
ViewModel
     ↓
Loading State
     ↓
Repository
     ↓
API
     ↓
Response
     ↓
Completed / Error
     ↓
UI Update
```

---

# 🖥️ `presentation/views`

```text
presentation/
└── views/
    ├── create_todo.dart
    └── home_screen.dart
```

These files represent the application's screens.

---

## 🏠 `home_screen.dart`

The home screen displays Todo-related information.

It communicates with:

```dart
TodoViewModel
```

and reacts to the API response state.

The screen is responsible for UI rendering rather than implementing networking.

---

## ➕ `create_todo.dart`

This screen provides a form for creating Todo data.

It demonstrates:

* Form handling
* Text controllers
* User input
* Validation
* Todo model creation
* Calling the ViewModel
* Displaying operation state

The View obtains the ViewModel through GetX dependency injection.

---

# 🚀 `main.dart`

```text
lib/
└── main.dart
```

`main.dart` is the application entry point.

It is responsible for bootstrapping the Flutter application.

The project also integrates `DevicePreview` here, making it easier to test the UI under different device configurations.

---

# 💉 Dependency Injection Flow

The application's dependency graph can be visualized as:

```text
                ┌───────────────┐
                │  DioClient    │
                └───────┬───────┘
                        │
                        ▼
              ┌──────────────────┐
              │ TodoRepository   │
              └────────┬─────────┘
                       │
                       ▼
              ┌──────────────────┐
              │  TodoViewModel   │
              └────────┬─────────┘
                       │
                       ▼
              ┌──────────────────┐
              │      Views       │
              └──────────────────┘
```

GetX manages the lifecycle and retrieval of these dependencies.

---

# 🔄 CRUD Architecture

The Todo feature demonstrates a complete CRUD workflow.

## 📥 Read All Todos

```text
HomeScreen
    ↓
TodoViewModel.getTodos()
    ↓
TodoRepository.getTodos()
    ↓
DioClient.get()
    ↓
REST API
    ↓
JSON
    ↓
ToDoModel
    ↓
ApiResponse.completed()
    ↓
UI
```

---

## 🔎 Read One Todo

```text
View
 ↓
getTodo(id)
 ↓
Repository
 ↓
DioClient
 ↓
GET /todos/{id}
 ↓
ToDoModel
 ↓
ViewModel
 ↓
UI
```

---

## ➕ Create Todo

```text
CreateTodoScreen
       ↓
TodoViewModel.createTodo()
       ↓
TodoRepository.createTodo()
       ↓
DioClient.post()
       ↓
REST API
       ↓
ToDoModel
       ↓
UI
```

---

## ✏️ Update Todo

```text
View
 ↓
TodoViewModel.updateTodo()
 ↓
TodoRepository.updateTodo()
 ↓
DioClient.put()
 ↓
REST API
 ↓
Updated Todo
 ↓
UI
```

---

## 🗑️ Delete Todo

```text
View
 ↓
TodoViewModel.deleteTodo()
 ↓
TodoRepository.deleteTodo()
 ↓
DioClient.delete()
 ↓
REST API
 ↓
Response
 ↓
UI
```

---

# 🚨 API State Management

The project uses a simple and reusable state model:

```text
             ┌──────────────┐
             │   LOADING    │
             └──────┬───────┘
                    │
             ┌──────▼───────┐
             │ API Request  │
             └──────┬───────┘
                    │
           ┌────────┴────────┐
           │                 │
      ┌────▼────┐       ┌────▼─────┐
      │ SUCCESS  │       │  ERROR   │
      └─────────┘       └───────────┘
```

This allows screens to easily implement:

```dart
if (status == Status.loading) {
  // Show loader
}

if (status == Status.completed) {
  // Show data
}

if (status == Status.error) {
  // Show error
}
```

---

# 🧩 Separation of Responsibilities

One of the main goals of this architecture is preventing different layers from doing each other's work.

| Layer                | Should Do                  | Should Avoid               |
| -------------------- | -------------------------- | -------------------------- |
| 🖥️ View             | UI, input, display state   | API implementation         |
| 🧠 ViewModel         | State + presentation logic | Direct HTTP implementation |
| 📦 Repository        | Data access + mapping      | UI code                    |
| 🌐 DioClient         | HTTP communication         | UI/business decisions      |
| ⚠️ Exception Handler | Convert network errors     | UI rendering               |
| 📊 ApiResponse       | Represent operation state  | Network requests           |
| 🧱 Model             | Represent data             | UI logic                   |

---

# 🧪 Why This Architecture Scales

Imagine adding:

```text
Authentication
Profile
Products
Orders
Payments
Chat
Notifications
```

Instead of creating one giant folder containing everything, each feature can follow the same pattern:

```text
data/
├── models/
│   ├── user_model.dart
│   ├── product_model.dart
│   └── order_model.dart
│
└── repositories/
    ├── auth_repository.dart
    ├── product_repository.dart
    └── order_repository.dart

presentation/
├── view_models/
│   ├── auth_view_model.dart
│   ├── product_view_model.dart
│   └── order_view_model.dart
│
└── views/
    ├── auth/
    ├── products/
    └── orders/
```

The same architectural principles can therefore be applied as the application grows.

---

# ⚙️ Getting Started

## 1️⃣ Clone the repository

```bash
git clone https://github.com/Gaurav0307/MVVM-GetX.git
```

## 2️⃣ Enter the project

```bash
cd MVVM-GetX
```

## 3️⃣ Install dependencies

```bash
flutter pub get
```

## 4️⃣ Run the application

```bash
flutter run
```

---

# 🔧 Useful Flutter Commands

### Check Flutter installation

```bash
flutter doctor
```

### Install dependencies

```bash
flutter pub get
```

### Upgrade dependencies

```bash
flutter pub upgrade
```

### Analyze the project

```bash
flutter analyze
```

### Run tests

```bash
flutter test
```

### Clean build files

```bash
flutter clean
```

### Run the application

```bash
flutter run
```

---

# 📱 Device Preview

The project uses `device_preview` to make UI testing across different device configurations easier.

This is useful when developing responsive Flutter applications because you can inspect how screens behave under different:

* Screen sizes
* Device configurations
* Orientations
* Display dimensions

---

# 🧠 Key GetX Concepts Demonstrated

This project is also useful for learning several GetX concepts.

### State Management

The ViewModel extends:

```dart
GetxController
```

and exposes observable state.

---

### Dependency Injection

Dependencies are registered using:

```dart
Get.lazyPut()
```

and retrieved using:

```dart
Get.find()
```

---

### Controller Lifecycle

The ViewModel uses:

```dart
onInit()
```

to initiate its initial Todo loading operation.

---

# 🎯 When Should You Use This Architecture?

This structure works especially well for:

* 📱 Medium-sized Flutter applications
* 🏢 Business applications
* 🛒 E-commerce applications
* 💬 Chat applications
* 📚 Education applications
* 🚕 Booking applications
* 🍔 Food delivery applications
* 🏥 Service applications
* 📊 Dashboard applications
* 🌐 REST API based applications

For very small applications, this architecture may feel more structured than necessary. However, for applications expected to grow, the separation can significantly improve maintainability.

---

# 💡 Adding a New Feature

Suppose you want to add a `Product` feature.

### Step 1 — Create the model

```text
data/models/product_model.dart
```

### Step 2 — Create repository

```text
data/repositories/product_repository.dart
```

### Step 3 — Create ViewModel

```text
presentation/view_models/product_view_model.dart
```

### Step 4 — Create binding

Register:

```text
ProductRepository
ProductViewModel
```

### Step 5 — Create UI

```text
presentation/views/product_screen.dart
```

The resulting architecture becomes:

```text
ProductScreen
      ↓
ProductViewModel
      ↓
ProductRepository
      ↓
DioClient
      ↓
REST API
```

This is the same architecture used by the Todo feature.

---

# 🏆 Architecture Principles

This project follows several important software engineering principles:

### 1. 🎯 Single Responsibility

Each class should have one primary responsibility.

### 2. 🧩 Separation of Concerns

UI, business logic, data access and networking remain separated.

### 3. 🔌 Dependency Inversion

Higher layers depend on abstractions/components rather than constructing infrastructure directly.

### 4. ♻️ Reusability

Networking and response handling can be reused by different features.

### 5. 🧪 Testability

Repositories and ViewModels can be tested independently.

### 6. 📈 Scalability

New features can be added without turning the project into a monolithic codebase.

---

# 🔮 Possible Future Improvements

This project provides a strong foundation, but it can be extended further.

Possible improvements include:

* 🧪 Unit tests for ViewModels
* 🧪 Repository tests
* 🧪 Widget tests
* 🔐 Authentication module
* 🔑 Token refresh mechanism
* 🌍 Environment configuration
* 🧱 Feature-based modules
* 📦 More reusable UI components
* 📝 API documentation
* 📊 Pagination
* 🔄 Retry mechanisms
* 💾 Offline caching
* 🗃️ Local database integration
* 🧭 Dedicated GetX route configuration
* 🌎 Localization
* 🎨 Centralized theme system
* 🔍 Better logging
* 🛡️ More granular error types

---

# 🤝 Contributing

Contributions are welcome!

If you have an idea that can improve the architecture:

1. Fork the repository
2. Create a feature branch

```bash
git checkout -b feature/my-feature
```

3. Make your changes
4. Run:

```bash
flutter analyze
flutter test
```

5. Commit your changes

```bash
git commit -m "feat: add my feature"
```

6. Push your branch

```bash
git push origin feature/my-feature
```

7. Open a Pull Request

---

# 📚 Learning Goals

This repository can be used as a practical reference for learning:

```text
Flutter
   ↓
Dart
   ↓
MVVM
   ↓
GetX
   ↓
Dependency Injection
   ↓
Repository Pattern
   ↓
Dio
   ↓
REST APIs
   ↓
Exception Handling
   ↓
API State Management
   ↓
Scalable Application Architecture
```

---

# ⭐ Support

If you find this repository useful, don't forget to:

⭐ Star the repository

🍴 Fork the repository

📢 Share with the Flutter community

---

# 👨‍💻 Author

**Gaurav Prasad**

Flutter Developer • Node.js Backend Developer

GitHub:
https://github.com/Gaurav0307

---

# 📄 License

This project is licensed under the MIT License.

---

<div align="center">

### Built with ❤️ using Flutter + GetX + MVVM

⭐ Star the repository if it helped you!

</div>
