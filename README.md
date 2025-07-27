# 📢 Voxy

**Voxy** is a Flutter accessibility app that converts text to speech using Murf.ai.
It allows users to input text, listen to it read aloud, and optionally save the audio as an `.mp3` file.

---

## 🚀 Features

* 🗣️ Read aloud any text using Murf API
* 💾 Download audio to your device
* 🧭 Custom AppBar & Navigation Drawer
* 🎧 Built-in audio playback
* 🔐 API key managed securely via `.env` file

---

## 📦 Packages Used

| Package         | Purpose                                   |
| --------------- | ----------------------------------------- |
| dio             | HTTP client for API requests              |
| audioplayers    | Audio playback                            |
| path\_provider  | Platform-specific paths                   |
| flutter\_dotenv | Manage environment variables like API key |

---

## 🛠️ Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/KrishnapriyaSureshkumar/Voxy.git
cd Voxy
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Set Up Environment Variables

Create a `.env` file in the root of your project:

```ini
MURF_API_KEY=your_actual_api_key_here
```

⚠️ **Important:** Never commit your `.env` file. Add it to `.gitignore` like this:

```gitignore
.env
```

### 4. Run the App

```bash
flutter run
```

---

## 📁 Project Structure

```bash
lib/
├── main.dart
├── screens/
│   ├── reader.dart
│   └── notes.dart
├── widgets/
│   ├── custom_appbar.dart
│   └── nav_drawer.dart
├── services/
│   └── murf_service.dart
.env
```

---

## 🔒 API Key Safety

* Your API key is stored securely in `.env` using `flutter_dotenv`
* Make sure `.env` is **not** pushed to GitHub
* Always include `.env` in your `.gitignore`

---

## 🧠 Credits

* [Murf AI](https://murf.ai) — Speech generation API
* [Flutter Dev Team](https://flutter.dev) — Cross-platform UI framework
* Open-source community — for inspiration and libraries

---

## 📄 License

This project is licensed under the MIT License.

---



