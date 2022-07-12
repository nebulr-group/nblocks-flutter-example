# Nblocks Flutter

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Developement environment
This project cannot be put inside a docker container. It needs access to IOS / Android simulator and should therefore be run on your host machine.

Below steps was done on MacOS but should work similar on any other platform.

### Install Flutter
See https://docs.flutter.dev/get-started/install/macos

## Running it
* On iOS `open -a Simulator && flutter run`
* On Web `flutter run`

## Functionality
* UI components for
      * Auth (Login, Submit reset password, Set new password, MFA, Choose workspace)
      * Tenant (Show, Edit, Onboard)
      * User profile (Show, Edit, Onboard)
      * User management (List, Edit, Add)
      * Brand expo (Showcase of Nblocks component default styling)
* Basic navigation support for above components which can be extendable by app developers
* Nblocks default style which can be extendable by app developers
* I18n support which can be extendable by app developers
* Support for both HTTP and GraphQL clients & Auth context aware intercepting these API calls.
* Helper services useful for app developers (currentUser, authenticated events, logout functionality)
* Deep linking to consume links outside app

## Publishing
https://pub.dev/