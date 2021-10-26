# Set up
### [Install flutter](https://flutter.dev/docs/get-started/install)
### Enable web
``` bash
flutter config --enable-web
```
### Check flutter instalation and web support
``` bash
flutter doctor
```
### Run for development
```bash
# Check that chrome device is available
# If not, add and export CHROME_EXECUTABLE environment 
# variable in your .bashrc and check again
flutter check devices  
# If last step is right you will be able to run in web
flutter run -d chrome
```
### Build for deployment
```bash
# This command will generate html and javascript files
# in build/web directory
flutter build web
```
# Dependency management
Project dependencies are first added in pubspec.yaml file.
```yaml
dependencies:
  cupertino_icons: ^1.0.3
```
After that, you can include an import that uses the dependency.
```dart
import 'package:cupertino_icons/cupertino_icons.dart';
```
To update all project dependencies in yout local machine, execute:
```bash
flutter pub get
```

# /lib  Project structure
### Config
App configuration like style, constants or routes
is centralised here.
### Screens
User interfaces. (Home screen, SingleURL screen)
### Widgets
App custom widgets (buttons, tabBar)
### Services
Conexion with external services like RESTful apis
