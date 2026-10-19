# RAT CONTROL — Flutter UI Prototype

This is a Flutter **UI-only prototype**. It does not implement remote access, screen capture, camera access, notification collection, or file transfer.

## Build APK with GitHub Actions
1. Upload the contents of this ZIP to the root of a GitHub repository (not the ZIP file itself).
2. Open the repository's **Actions** tab.
3. Select **Build Android APK**.
4. Press **Run workflow** (or wait for the workflow after pushing to `main`).
5. When complete, open the run and download the `rat-control-release-apk` artifact.

The workflow generates the Android platform folder if it is missing, then builds a release APK.
