
# Water Tracker 💧

Daily Water & Hydration Tracker App

A Flutter application that helps users estimate their daily water intake based on weight and physical activity.

## Features
- Select gender (Male or Female).
- Set activity hours from 0 to 8.
- Adjust weight from 30 to 200 kg.
- Adjust age from 10 to 100 years.
- Calculate daily water intake.
- Display the result in liters per day.
- View user input summary.
- Recalculate water intake.

## Water Intake Formula

- Base Water Intake = Weight × 35 ml
- Activity Water Intake = Activity Hours × 250 ml
- Total Water Intake = Base Water Intake + Activity Water Intake
- Daily Water Intake = Total Water Intake ÷ 1000

Example:

70 kg and 2 activity hours = 2.95 L/day.

## Technologies Used
- Flutter
- Dart
- Android Studio

## How to Run

1. Clone the repository.
2. Open the project in Android Studio.
3. Run `flutter pub get`.
4. Run `flutter run`.

## Screenshots

### Input Screen
![Input Screen](screenshots/input_screen.png)

### Result Screen
![Result Screen](screenshots/result_screen.png)

## Disclaimer

This application provides an educational estimate of daily water intake and is not medical advice.
