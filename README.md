# 🌍 GraphQL Riverpod Countries

![CD](https://github.com/muradhossin/graphql_riverpod_countries/actions/workflows/release_cd.yml/badge.svg)

A Flutter app showcasing **GraphQL** + **Riverpod** in action:  
- Favorite countries  
- Dark mode  
- Pull-to-refresh  
- Clean architecture & state management  
- Automated CI/CD with GitHub Actions

---

## 🚀 Features

✅ Fetch countries data via GraphQL  
✅ Manage state with Riverpod  
✅ Save favorite countries (locally)  
✅ Dark mode toggle with persisted state  
✅ Pull-to-refresh to update data  
✅ Automated build & release using GitHub Actions

---

## 📦 CI/CD

This project uses **GitHub Actions** for:

- ✅ **Continuous Integration (CI)**:  
  - Every push / PR runs checks (build, tests)
- ✅ **Continuous Deployment (CD)**:  
  - Every new tag like `v1.0.0` automatically:
    - Builds the release APK
    - Creates a GitHub Release
    - Uploads the APK as a downloadable asset

The workflow file lives at:
.github/workflows/release_cd.yml


---

## 📱 Download Latest APK

> Every new release tag (e.g. `v1.0.0`) automatically builds & uploads a release APK.

👉 [⬇ **Download latest APK from Releases**](https://github.com/muradhossin/graphql_riverpod_countries/releases/latest)

*(Click “Assets” → download `app-release.apk`)*

---

## 🛠 Getting Started

### Prerequisites

- Flutter `3.32.5`  
- Dart SDK  
- IDE (VS Code / Android Studio)

---

### 🚀 Setup & Run

```bash
git clone https://github.com/muradhossin/graphql_riverpod_countries.git
cd graphql_riverpod_countries

flutter pub get
flutter run

🧪 Running Tests
flutter test
