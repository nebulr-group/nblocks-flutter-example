# nblocks-flutter
This plugin supercharges your Flutter app with Nblocks powers in a true plug-n-play manner.

Developement instructions further down.

# Built in Functionality
* UI components for
  * Auth (Login, Social login, Submit reset password, Set new password, MFA, Choose workspace)
  * Tenant (Show, Edit, Onboard)
  * User profile (Show, Edit, Onboard)
  * User management (List, Edit, Add)
  * Brand expo (Showcase of Nblocks component default styling)
* Basic navigation support for above components which can be extendable by app developers
* Nblocks default style which can be extendable by app developers
* I18n support which can be extendable by app developers
* Support for both HTTP and GraphQL clients & Auth context aware intercepting these API calls.
* Exposed state management and Helper services useful for app developers (currentUser, authenticated events, logout functionality)
* Deep linking to consume links outside app

# Getting started
## Installing
```
flutter pub add nblocks-flutter
```


Wrap your app with the `NblocksProvider` in your top most App component.
```jsx

```
That's all. See Configuration section how to change default configuration.   
**By default the plugin requires a Nblocks enabled API to be present at `localhost:3000`**

# Usage
## Get current user
```dart

```
## Making calls to your backend
```dart

```
# Configuration
The plugin comes with a default style and config for its views and functionality. These defaults can easily be overriden by you by providing other config properties for the `NblocksProvider`. E.g.

```dart

```
## General config
The plugin accepts a config object to be provided. This object must implement `LibConfig` as shown below.
```dart
```
## Styling and Brand
All Nblocks components inherit the default style which is composed by both a style object and color object.
### Changing default style
The plugin accepts a style override object to be provided using the property `styleOverrides`. This object must implement `BrandingConfig` as shown below.
```dart

```
### Changing default colors
The plugin accepts a color override object to be provided using the property `colorOverrides`. This object must implement `ColorConfig` as shown below. These strings must be either hex code or strings conforming to color/backgroundColor of react stylesheet TextStyle/ViewStyle.
```dart
```
## I18n & Translations
You can add your own custom language overrides using the `i18nOverrides` property.
The data must be in `LangOverrideParam[]` format where:
```dart
```
# Conceps and tools used
## Global state management and Event handling
- `provider` 

## Networking and HTTP

## I18n
## Branding


# Development environment
This project cannot be put inside a docker container. It needs access to IOS / Android simulator and should therefore be run on your host machine.

Below steps was done on MacOS but should work similar on any other platform.

## Install Flutter
See https://docs.flutter.dev/get-started/install/macos

Make sure you have Xcode installed and the license accepted.

### Running it
* On iOS `open -a Simulator && flutter run`
* On Web `flutter run`
