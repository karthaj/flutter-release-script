# 📦 Flutter Android Bundle Builder

A lightweight and interactive Bash script to automate the process of generating Android App Bundles (`.aab`) with new `build version` for your Flutter projects. This tool streamlines version management, handles cleaning, and opens the build output directory on completion.

---

## ✨ Features

- 🔄 Prompts confirmation before proceeding with a build
- 🔢 Automatically handles versioning via a `.buildVersion` file
- 📈 Supports both version override and auto-increment
- 🧹 Cleans previous build outputs before compiling
- 🛠 Uses `./buildBundle.sh` >> follow the instruction
- 📂 Opens output directory (`build/app/outputs/bundle/release`) after success

---

## 📁 Folder Structure

> project-root/
> 
>   ├── android/
> 
>   ├── lib/
> 
>   ├── buildBundle.sh # ← Your bundle script
> 
>   └── .buildVersion # ← Optional file to store build version
 
---

## 🛠 Requirements

- Flutter SDK installed and configured
- macOS (uses `open` command to open the folder)
- Bash-compatible shell (`bash`, `zsh`, etc.)
- `.buildVersion` file (optional, script will create one if missing)

---

## 🚀 Usage

Make the script executable (only once):
    
    chmod +x build.sh
 
Then run it:
    
    ./build.sh
    
Process flows as:
1. Prompt you to confirm the build.
2. Ask for replace the current version or new version (auto-increment by 1).
3. Clean previous build outputs.
4. Build the app bundle using Flutter.
5. Open the output folder for quick access.

## 📌 Notes
* If .buildVersion does not exist, the script will create it with 1 as default.
* You can manually edit .buildVersion to set a custom version number.
* To use this on platforms other than macOS, replace the open command at the end with your OS-specific folder-opening command (e.g., xdg-open on Linux or explorer on Windows with Git Bash).

## ✅ Example Output
* Terminal Logs

<img width="571" height="178" alt="image" src="https://github.com/user-attachments/assets/cc16c7e7-880b-4947-aa01-9e3537721453" />

* Version file `.buildVersion`

<img width="407" height="137" alt="image" src="https://github.com/user-attachments/assets/1c1f8447-106d-44a8-bcc5-f442e53b6cb3" />


# 🔮 Future Enhancements
* Create for `APK` building
  
* Cross-platform Support ~
Add support for Linux (xdg-open) and Windows (explorer) to make the script usable on all major OSes.

* Automatic Git Tagging ~
Tag builds in Git using the version number for better release tracking and CI integration.

* CI/CD Integration Support ~
Add support to run the script non-interactively for use in GitHub Actions, GitLab CI, or Bitrise pipelines.

* Logging and Reporting ~
Output a summary log or store build history in a build.log file for auditing or rollback references.

* Environment Detection ~
Automatically detect whether the current project is a Flutter project and exit early with a helpful message if not.

* Slack/Email Notifications ~
Send notifications (via webhooks or SMTP) upon successful build or if the build fails.

* Interactive UI (Optional) ~
Add a simple text-based UI (using dialog or gum) for a more intuitive developer experience.

* Support for Multiple Build Flavors ~
Allow selecting a flavor (dev, staging, prod, etc.) and build variant (release, debug) through flags or prompts.

* Version Name Handling ~
Optionally update versionName in pubspec.yaml or build.gradle alongside versionCode.

  
## 📄 License
MIT License – feel free to use and modify for your own projects.

