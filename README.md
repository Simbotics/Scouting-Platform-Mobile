# FRC Scouting Platform

[![Analyze Flutter Code](https://github.com/Simbotics/Scouting-Platform-Mobile/actions/workflows/analyze.yml/badge.svg)](https://github.com/Simbotics/Scouting-Platform-Mobile/actions/workflows/analyze.yml)
[![Build APK](https://github.com/Simbotics/Scouting-Platform-Mobile/actions/workflows/build-android.yml/badge.svg)](https://github.com/Simbotics/Scouting-Platform-Mobile/actions/workflows/build-android.yml)

A Flutter app for collecting FRC match observations on Android tablets. Scouts record autonomous, teleop, endgame, and comment data, then display a QR code for a separate scanning device to collect.

The app runs in landscape and reads event schedules and robot capacities from the tablet's Documents directory. Android is the deployment target; the file paths and native battery integration are Android-specific.

## Development setup

You need:

- Flutter with its bundled Dart SDK. The CI workflows use the stable Flutter channel; package constraints are in [pubspec.yaml](pubspec.yaml).
- Java 17 and the Android SDK. The Android build and CI configuration use Java 17.
- An Android tablet with USB debugging enabled, or an Android emulator for development.
- A Dart-capable editor, such as VS Code with the Dart and Flutter extensions.

From the repository root:

```sh
flutter doctor -v
flutter pub get
flutter devices
flutter run -d <android-device-id>
```

Replace `<android-device-id>` with an Android device listed by `flutter devices`.

To build a release APK:

```sh
flutter build apk --release
```

The default APK output is `build/app/outputs/flutter-apk/app-release.apk`. The current Gradle configuration uses the debug signing configuration for release builds; configure release signing before distributing through a store.

## Prepare a tablet for an event

The app currently reads and writes files under:

```text
/storage/emulated/0/Documents/
```

Place the schedule and optional capacity file there, and allow the app's storage permission when prompted. Verify file access on the actual tablets before scouting.

| File | Purpose |
| --- | --- |
| `match_schedule_<event_id>.csv` | Teams assigned to each match and driver station. |
| `robot_capacity.csv` | Hopper capacity for each team. |
| `scouting_app_data.pickle` | App-created settings file containing plain text: `event_id,driver_station`. |
| `<event_id>_output.csv` | App-created local copy of generated scouting records, with one caret-separated record per line. |

The settings file uses a `.pickle` filename but contains plain text. The output file uses a `.csv` filename but separates fields with `^`.

### Match schedule

For event `2026onham`, name the file `match_schedule_2026onham.csv`:

```csv
match_number,red1,red2,red3,blue1,blue2,blue3
1,1114,2056,1241,3683,5406,1325
2,610,771,865,188,2200,4039
```

Keep the header on the first line and one row per match, starting at match 1 in sequential order. The current lookup uses the match number as the row index; it does not search the first column. Do not omit matches or insert blank lines. Use simple comma-separated values without quoted fields or extra spaces.

Schedules must be copied onto the tablet before use. The app reads the local file and has no automatic schedule download.

### Robot capacity

Use two columns in `robot_capacity.csv`:

```csv
team_number,capacity
1114,60
2056,65
1241,55
```

The lookup matches the first column to the team number and returns the second column. Missing files or unmatched teams produce an empty capacity. Capacity is displayed in the app bar and is not included in the current QR payload.

### Settings

Open **Settings** and select:

- **Event ID:** must match the schedule filename.
- **Driver Station:** Red 1–3 or Blue 1–3.
- **Team Number Editable:** choose **No** for schedule-based assignment, or **Yes** for manual team entry.

Return to **Prematch** after changing events. Event ID and driver station are saved between sessions; team-number editability defaults to automatic mode when the app starts.

## Scouting workflow

1. **Prematch:** enter scout initials and match number. Automatic mode fills the team and capacity from the local files. Changing the match clears the previous team and capacity. Manual team entry currently clears capacity without looking it up.
2. **Auto:** record start position, general path, depth into the pile, climb result, and times beached.
3. **Teleop:** record scoring, passing, cleanup, cycles, stealing, defense, robot status, times beached, and endgame climb result.
4. **Comments:** enter brief autonomous, teleop, and endgame observations.
5. **QR Code:** the app reads the tablet battery level, generates the payload once for that screen opening, and displays it for scanning. It also starts saving a local copy.
6. **Reset:** after the record has been collected, confirm Reset to increment the match number, clear team/capacity and scouting observations, and return to Prematch. Scout initials are retained. Automatic mode then loads the next team.

The sidebar also allows direct navigation between screens. Verify the displayed match, team, and driver station before recording or scanning data.

## QR data format

[QRCodeHelper.dart](lib/utils/helpers/QRCodeHelper.dart) defines the field order. Values are joined with `^`, encoded as UTF-8, and then Base64-encoded for the QR. Base64 is encoding, not compression or encryption.

The current payload has 25 fields. These positions include the battery field and are zero-based:

| Positions | Fields, in order |
| --- | --- |
| 0 | Tablet battery percentage (`-1` when unavailable). |
| 1–4 | Team number, match number, scout initials, driver station. |
| 5–9 | Auto start position, general path, depth into pile, climb result, times beached. |
| 10–19 | Teleop scoring, passing, cleanup, cycles, stealing, defense, got defended, broken, dead, back to life. |
| 20 | Teleop times beached. |
| 21 | Endgame climb result. |
| 22–24 | Auto comments, teleop comments, endgame comments. |

Teleop Yes/No selections are stored as the strings `Yes` and `No`. The scanning application must decode Base64 as UTF-8 and interpret the fields in this same order. Coordinate any field additions, removals, reordering, or type changes with the scanner.

The local output file stores the decoded, caret-separated payload. Saving skips a record when its scouting fields match the last nonempty record, ignoring the battery field. Opening a QR does not confirm that a separate scanner has collected it or that the local save succeeded.

## Code structure

| Location | Responsibility |
| --- | --- |
| [lib/main.dart](lib/main.dart) | App entry point, landscape orientation, and initial Prematch route. |
| [lib/routes](lib/routes) | Prematch, auto, teleop, comments, settings, and QR screens. Each form keeps its labels, controls, and callbacks in its route. |
| [lib/builders/PlatformRoute.dart](lib/builders/PlatformRoute.dart) | Shared scaffold, app bar, sidebar, and content container. |
| [lib/builders/bases](lib/builders/bases) | Reusable text inputs, number inputs, dropdowns, and counters. |
| [lib/components/navigation](lib/components/navigation) | Sidebar and navigation items. |
| [lib/utils/data/values](lib/utils/data/values) | Shared controllers and values used across routes, plus reset methods. |
| [lib/utils/data/constants](lib/utils/data/constants) | App defaults and dropdown options. |
| [lib/utils/helpers](lib/utils/helpers) | Schedule lookup, file persistence, QR encoding, battery access, and brightness helpers. |
| [lib/styles](lib/styles) | Shared colors and text/header styles. |
| [MainActivity.kt](android/app/src/main/kotlin/org/simbotics/scouting_platform/MainActivity.kt) | Android method-channel handler for battery readings. |

### Changing the form

- Change layout, labels, and callbacks in the relevant route. Small private helpers handle repeated field layout.
- Add shared controllers and reset behavior in the appropriate values file.
- Edit dropdown choices in [OptionConstants.dart](lib/utils/data/constants/OptionConstants.dart).
- Edit app defaults in [AppConstants.dart](lib/utils/data/constants/AppConstants.dart).
- Update QR serialization and the receiving scanner together when changing exported data.

## Checks before use

Run formatting and static analysis:

```sh
dart format lib
flutter analyze
```

On an Android tablet, check the complete flow with a known schedule: select a driver station, enter a match, confirm team/capacity, fill the form, scan the QR, and reset to the next match. Check that Yes/No selections and comments survive scanning, and that the local output file receives the record. Also try manual team entry and a match that is absent from the schedule.

The repository's CI workflows run static analysis and build an Android APK on pushes. Tablet verification is still needed for file access, battery readings, screen layout, and scanner compatibility.

## License

[BSD 3-Clause](LICENSE), Team 1114 — Simbotics.
