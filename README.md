# FRC Scouting Platform

[![Flutter version](https://img.shields.io/badge/Flutter-v3.24.3-blue)](https://docs.flutter.dev/release/archive)
[![Dart version](https://img.shields.io/badge/Dart-v3.5.3-blue)](https://dart.dev/)
[![Java version](https://img.shields.io/badge/Java-v17.0.11-blue)](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
[![Build and Test Scouting Platform](https://github.com/Simbotics/Scouting-Platform-Mobile/actions/workflows/main.yml/badge.svg)](https://github.com/Simbotics/Scouting-Platform-Mobile/actions/workflows/main.yml)

A simple and easy-to-use scouting platform for FRC competitions, built with Flutter. This app allows FRC teams to collect and analyze scouting data during competitions.

## Features
- Record data for individual matches, including scores, balancing metrics, and various other stats for each team
- View and analyze match data in real-time to make informed decisions about alliance selection and game strategy
- Store data securely on a scanning device and export it for future use

## Prerequisites
- An IDE that is compatible with the Dart programming language. The recommended IDE to use is [VSCode](https://code.visualstudio.com/download) as it has a Flutter compatible extension that can automatically install Flutter and can easily run the project.
- [Android Studio 2024.2.1 or Above](https://developer.android.com/studio) - Used for emulating mobile devices on the machine running the project. For information on the bundles JDK, please see below.
- [Java JDK 17.0.11](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html) - Used for building the scouting platform with Gradle. <br/>
*Note: Currently there are issues with Java JDK 21 that is bundled with Android Studio. Please be sure that you are currently running Java JDK 17.0.11.*
- [Flutter 3.24.3 or Above](https://docs.flutter.dev/release/archive) - This can either be installed with the Flutter extension if you're using VSCode, or it can be installed by following the hyperlink to this prerequisite.
- [Dart 3.5.3 or Above](https://dart.dev/get-dart) - Dart by default is installed alongside Flutter so you will not need to install it manually. In the event of issues with installing Dart with Flutter, you can following this sections hyperlink for more information.

## Getting Started
The following guide will cover the basics of setting up the project and running the basics of it. For more information on the maintaining the scouting platform, please see [advanced concepts](#advanced-concepts).

1. Install the latest [Flutter](https://flutter.dev/docs/development/tools/sdk/releases) and [Dart](https://dart.dev/) SDKs on your machine. Additionally, install [Java JDK 17.0.11](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
2. Clone this repository using:
```sh
git clone https://github.com/Simbotics/Scouting-Platform-Mobile
```
3. In the root of the project directory, run the following command to download and install all project dependencies:
```sh
flutter pub get
```
4. To run the app, use the following command to run the app on either web or desktop. Otherwise, please install and use the Flutter VSCode extension to run on compatible devices with Android Studio. For more infdo
```sh
flutter run
```

## Advanced Concepts
A guide that documents the process of configuring advances parts of the scouting platform, it also acts as a guide to maintain this project in the future. The following guides expect that the project has already been set up by following the [getting started](#getting-started) guide.

### Lib Subfolder Breakdown
- `builders` - This folder contains a `bases` subfolder and a route page base. The route page base simplifies the creation of routes by allowing customization through this widget.
    - `bases` - Includes foundational widgets like number input fields, stopwatch fields, and text fields that can be tailored to various needs.
- `components` - Contains subfolders with reusable components used throughout the project.
    - `navigation` - Holds a `components` subfolder containing widgets used for building the navigation sidebar, including the finalized sidebar and its routing.
        - `components` - Widgets used in constructing the navigation sidebar.
- `routes` - Holds subfolders for each route, along with the widgets used in them.
    - `comments` - Displays the page at the end of the user flow where users can leave comments on the match they just played.  
    *All inputs on this page feed into the `lib/utils/data/values/CommentValues.dart` values.*
    - `data` - The main data entry page where users input details for autonomous, teleoperated, and endgame phases. Its fields and labels are organized into separate subdirectories.
    - `prematch` - Contains fields for initials, match number, and team number, and automatically selects the team based on the match number and driver station configured in the settings.
    - `qrcode` - Contains routes for scanning QR codes and managing related data for creating or saving them.
    - `settings` - Provides the settings route where users configure event ID, QR code centerfold, team number editability, and other important settings for app functionality.
- `styles` - Contains widgets for easily generating headers and titles, as well as a set of colors used throughout the app to maintain uniformity in the scouting platform.
- `utils` - Includes utilities like constants, value files, and helpers to support app functionality.
    - `data` - Stores constants and values that update as the app is used.
        - `constants` - Holds fixed values such as dropdown options, app details (name, URIs, event codes), and other immutable app settings.
        - `values` - Stores dynamic values that change based on user input, with controllers ensuring app-wide synchronization during a session.
    - `helpers` - Includes methods to assist with file creation, UI adjustments like brightness, and functions like QR code scanning and generation.

### Automatic Team Number Assigning
The scouting platform uses a system which combs through a generated match schedule with a custom-made schedule generator.

#### Schedule Format
The schedule that is generated by the custom schedule generator is in the following format:
```
match_number,red1,red2,red3,blue1,blue2,blue3
1,1114,1113,1112,1111,1110,1109
2,2056,2055,2054,2053,2052,2051
...,...,...,...,...,...,...
```

#### Using a Generated Schedule
Using a generated schedule, automatically assigning team numbers based on the selected driver station and match number is simple. Follow these steps to use a schedule:

1. Generate a match schedule with a file name that follows the app's naming convention: `match_schedule_[event_id].csv`, where `[event_id]` is replaced by the ID of the event you're scouting. Place this file in the device's documents directory.
2. Ensure the schedule has the correct team IDs in the proper order. You can verify this by checking the first three matches and comparing them to The Blue Alliance data.
3. In the `lib/utils/data/constants/AppConstants.dart` file, locate the default event ID configurations. It's good practice to update the `defaultEventID` to the current event ID, ensuring the app grabs the correct schedule. Although this value can be modified and saved between sessions, updating the `defaultEventID` helps avoid errors. Additionally, update the `defaultFileName` value to match the CSV file name generated after scanning.
4. Test the automatic team number assignment by navigating to the settings, verifying the event ID (or updating it if necessary), selecting your desired driver station, and then heading to the prematch data route. Enter a match number, and the app should automatically resolve the team number based on your driver station and match number.

### Modifying Generated Spreadsheet
To modify the generated spreadsheets values and columns is made simple.

#### Spreadsheet Column Configuration
All columns for the spreadsheet are configured in the `lib/utils/helpers/ScanningHelper.dart` file under the `csvColumnNames` value. The column names will appear from left to right following the array from top to bottom. <br/>
*Note: When modifying the values in this array, please keep in mind that it will shift the indexes of either up or down depending on your operation. This is important to note when adding the values to the spreadsheet.*

#### QR Code Value Configuration
When removing or adding values to the QR code or the spreadshet, you can modify the values in the `lib/utils/helpers/QRCodeHelper.dart` file. Beside each value you can find an index number comment, this is the order that each value appears in the spreadsheet when it scans and the order it appears in for the QR code. Please keep in mind that these values will shift indexes in the QR code and the spreadsheet when a value is removed or added.

### QR Code Encoding
The QR code is not currently readable meaning that the values are not stored in plain text. To reduce issues with unicode characters the data is encoded with base64 on the way in to the QR code and is decoded by the scanner on the way out to the spreadsheet. You can decode the values going into the QR code by using a free online too such as https://www.base64decode.org/ to decode the base64 data.

### Input Field Examples
Examples of how to use the base input field widgets with basic functionality. For more information on more complex configurations, please see the base file you wish to configure.

#### Counter Number Field
A field that has an increment and decrement button on either side of the value you're changing displayed. This is used heavily for tracking scoring of game pieces.
```
CounterNumberField(
    controller: ValuesFile.valueToChange,
    onTapDecrement: () =>
        decrementNumber(ValuesFile.valueToChange),
    onTapIncrement: () =>
        incrementNumber(ValuesFile.valueToChange))
```
`ValuesFile`: The name of the file that contains the value you wish to control via the counter number field.
`valueToChange`: The value name in the `ValuesFile` you wish to control via the counter number field.
`decrementNumber` and `incrementNumber`: Custom methods that check the value of the `valueToChange` and either adds or removes 1 with the `setState` function.

#### Number Input Field
A field that allows the user to type any number in a field. This is similar to a text input field, but only allows the user to type numbers in the field.
```
NumberInputField(
    onChanged: (value) {},
    controller: ValuesFile.valueToChange,
    hintText: "Example Field",
)
```
`ValuesFile`: The name of the file that contains the value you wish to control via the number input field.
`valueToChange`: The value name in the `ValuesFile` you wish to control via the number input field.

#### Platform Dropdown Menu
A dropdown menu that is custom made to be flexible and to come pre-packaged with basic configurations. Used mainly for endgame related states or yes or no dropdowns.
```
PlatformDropdownMenu(
    dropdownMenuSelectedItem: ValuesFile.valueToChange.text,
    onChanged: (value) {
        setState(() {
            ValuesFile.valueToChange.text = value;
        });
    },
    dropdownItems: OptionConstants.yesNoOptions
)
```
`ValuesFile`: The name of the file that contains the value you wish to control via the dropdown menu.
`valueToChange`: The value name in the `ValuesFile` you wish to control via the dropdown menu.
`OptionConstants.yesNoOptions`: An array of strings that can be selected in the dropdown. This example shows an example of the yes or no options to create a simple yes or no dropdown.

#### Stopwatch Button (DEPRECATED)
Allows the user to record time for something like a hang or endgame phase. A single tap can start or start the stopwatch and a double tap will reset the time.
```
StopwatchButton(
    value: ValuesFile.stopwatchTime,
    state: ValuesFile.stopwatchState,
    timer: ValuesFile.stopwatchInstance,
)
```
`ValuesFile`: The name of the file that contains the value you wish to control via the stopwatch.
`stopwatchTime`: The text editing controller used to hold the time recorded by the stopwatch.
`stopwatchState`: The text editing controller used to hold the number state of the stopwatch (e.g. 0, 1, 2, 3)
`stopwatchInstance`: The stopwatch instance that holds and manages the values of the stopwatch.

#### Text Input Field
A commonly used field in the comments phase of the user experience. This allows the user to type any text characters, with the exception that all unicode characters are stripped when encoded into the QR code.
```
TextInputField(
    controller: ValuesFile.valueToChange
    onChanged: (value) {},
    hintText: "Example Field"
)
```
`ValuesFile`: The name of the file that contains the value you wish to control via the text input field.
`valueToChange`: The value name in the `ValuesFile` you wish to control via the text input field.

## Schedule Generator
We use a custom-built [Schedule Generator](https://github.com/Simbotics/Scouting-Platform-Schedule-Generator) to generate schedule for [automatic team number assigning](#automatic-team-number-assigning). You can find all documentation and help in the repository.

## Contributing
Contributions are always welcome! If you have an idea for a feature or want to report a bug, please open an issue on this repository.

If you want to contribute code, please fork this repository and create a pull request with your changes.

## License
This project is licensed under the [BSD 3-Clause "New" or "Revised" License](https://github.com/Simbotics/Scouting-Platform-Mobile/blob/main/LICENSE).

