# 📸 PhotoBooth

**PhotoBooth** is a SwiftUI application built using the **MVVM architecture**.  
It fetches and displays high-quality photos from the **Unsplash API** while maintaining a clean, scalable, and modular code structure.

---

## 🧭 Table of Contents

1. [Overview](#-overview)  
2. [Features](#-features)  
3. [Project Structure](#-project-structure)  
4. [Architecture Overview](#-architecture-overview)  
5. [Unsplash API Setup](#-unsplash-api-setup)  
6. [Installation & Run](#-installation--run)  
7. [Tech Stack](#-tech-stack)  
8. [Screenshots](#-screenshots)  
9. [License](#-license)

---

## 🧩 Overview

PhotoBooth allows users to explore and view curated photos from the Unsplash API.  
It demonstrates the best practices of **SwiftUI**, **MVVM**, and **async/await**-based networking in modern iOS development.

---

## 🚀 Features

✅ Built with **SwiftUI** using **MVVM architecture**  
✅ Fetches high-quality photos from **Unsplash API**  
✅ Implements **asynchronous image loading** with `async/await`  
✅ **Reusable components** for cleaner UI code  
✅ Organized **modular folder structure**  
✅ **Supports iOS 17+**  
✅ Ready for **scaling and customization**

---

## 🧱 Project Structure

```
PhotoBooth/
├── PhotoBoothApp.swift         # App entry point
│
├── Assets/                     # App assets (images, colors, etc.)
│
├── Components/                 # Common reusable UI components
│
├── Extension/                  # Swift extensions for helpers/utilities
│
├── Feathers/
│   └── HomePage/
│       ├── Model/
│       │   └── ImageData.swift        # Defines photo model from Unsplash API
│       ├── View/
│       │   ├── HomeView.swift         # Displays grid of photos
│       │   └── DetailView.swift       # Displays selected photo details
│       └── ViewModel/
│           ├── HomeViewModel.swift    # Handles fetching & managing image data
│           └── ImageLoader.swift      # Asynchronously loads & caches images
│
├── Helper/
│   └── KeychainHelper.swift           # Secure keychain storage helper
│
├── Manager/                           # Reserved for app/session data management
│
└── WebService/
    └── WebService.swift               # Handles Unsplash API requests
```

---

## 🧠 Architecture Overview

PhotoBooth follows the **MVVM (Model-View-ViewModel)** design pattern.

| Layer | Description |
|:------|:-------------|
| **Model** | Defines the structure of data objects (e.g. `ImageData`) |
| **ViewModel** | Handles logic, API calls, and provides data/state to the View |
| **View** | Displays data and manages user interaction using SwiftUI |

---

## 🔑 Unsplash API Setup

To fetch photos, you need an **Unsplash Access Key**.

### Steps:
1. Go to [Unsplash Developers](https://unsplash.com/developers)
2. Log in or sign up for a free account
3. Create a new application
4. Copy your **Access Key**

Then update your key in `WebService.swift`:

```swift
let accessKey = "YOUR_UNSPLASH_ACCESS_KEY"
```

---

## ⚙️ Installation & Run

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/PhotoBooth.git
```

### 2. Navigate to the project directory
```bash
cd PhotoBooth
```

### 3. Open the project in Xcode
```bash
open PhotoBooth.xcodeproj
```

### 4. Run the project on your simulator or device

---

## 🛠 Tech Stack

- **Language:** Swift  
- **Framework:** SwiftUI  
- **Architecture:** MVVM  
- **API:** Unsplash API  
- **Async Handling:** async/await  
- **Caching:** URLCache & AsyncImage  

---

## 🖼 Screenshots *(Optional)*

| Home View | Detail View |
|:----------:|:------------:|
| ![Home](screenshots/home.png) | ![Detail](screenshots/detail.png) |

---

## 📜 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for details.
