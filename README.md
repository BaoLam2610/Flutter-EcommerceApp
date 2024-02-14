# ecommerce_app
An E-Commerce application Flutter project.

## Getting Started
Run in terminal before view on IDE
1. flutter pub get

Run in terminal before build on device
1. flutter pub run build_runner build --delete-conflicting-outputs
2. flutter pub run easy_localization:generate -S assets/strings -f keys -O lib/gen -o locale_keys.g.dart
3. flutter pub run easy_localization:generate -S assets/strings -O lib/gen -o codegen_loader.g.dart
Explain: Generate image, icon, language string assets resources