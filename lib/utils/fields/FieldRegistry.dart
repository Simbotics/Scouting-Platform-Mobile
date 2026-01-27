// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../data/constants/OptionConstants.dart';
import '../data/values/AutonomousValues.dart';
import '../data/values/TeleoperatedValues.dart';
import '../data/values/EndgameValues.dart';
import '../data/values/PrematchValues.dart';
import '../data/values/SettingValues.dart';
import '../../routes/auto/AutonomousDataRoute.dart';
import '../helpers/ScheduleHelper.dart';
import 'FieldDescriptor.dart';

class FieldRegistry {
    // Prematch fields
  static final prematchInitials = FieldDescriptor(
    type: FieldType.textField,
    config: {
      'controller': PrematchValues.initials,
      'hintText': 'Scout Initials',
      'textAlign': TextAlign.center,
      'onChanged': (v) {},
    },
  );

  static final prematchMatchNumber = FieldDescriptor(
    type: FieldType.numberInput,
    config: {
      'controller': PrematchValues.matchNumber,
      'hintText': 'Match Number',
      'onChanged': (value) async {
        if (SettingValues.isTeamNumberReadOnly) {
          if (PrematchValues.matchNumber.text != "") {
            Schedulehelper.getTeamNumberFromSchedule(int.parse(PrematchValues.matchNumber.text)).then((teamNumber) {
              PrematchValues.teamNumber.text = teamNumber.toString();
            });
          }
        }
      }
    },
  );

  static final prematchTeamNumber = FieldDescriptor(
    type: FieldType.numberInput,
    config: {
      'controller': PrematchValues.teamNumber,
      'hintText': 'Team Number',
      'readOnly': () => SettingValues.isTeamNumberReadOnly,
      'onChanged': (v) {},
    },
  );

  static final prematchLabels = FieldDescriptor(
    type: FieldType.label,
    config: {
      'labels': ['Initials', 'Match Number', 'Team Number'],
      'buttonLabel': 'Auto >',
      'routeBuilder': () => const AutonomousDataRoute(title: "Auto"),
    },
  );

  // Autonomous
  static final autonomousRightRowNumberPad = FieldDescriptor(
    type: FieldType.numberPad,
    config: {
      'displayedController': AutonomousValues.numberPadDisplayedValue,
      'targetController': AutonomousValues.autoBallScored,
      'showPassButton': false,
    },
  );

  // Autonomous - Left column fields
  static final autonomousLeftRow1StartPosition = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': AutonomousValues.autoStartPosition,
      'dropdownItems': OptionConstants.startPositions,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final autonomousLeftRow1Mobility = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': AutonomousValues.autoMobility,
      'dropdownItems': OptionConstants.yesNoOptions,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final autonomousLeftRow2BallScored = FieldDescriptor(
    type: FieldType.counter,
    config: {
      'controller': AutonomousValues.autoBallScored,
      },
  );

  static final autonomousLeftRow3Stopwatch = FieldDescriptor(
    type: FieldType.stopwatch,
    config: {'value': AutonomousValues.autoClimbTime, 'timer': AutonomousValues.stopwatch},
  );

  static final autonomousLeftRow3ClimbPosition = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': AutonomousValues.autoClimbPosition,
      'dropdownItems': OptionConstants.climbPosition,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  // Teleop
  static final teleopDefenseTimer = FieldDescriptor(
    type: FieldType.stopwatch,
    config: {'value': TeleoperatedValues.defenseTime, 'timer': TeleoperatedValues.stopwatch},
  );

  static final teleopClimbPositionDropdown = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': EndgameValues.climbPosition,
      'dropdownItems': OptionConstants.climbPosition,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final teleopClimbTimer = FieldDescriptor(
    type: FieldType.stopwatch,
    config: {'value': EndgameValues.climbTime, 'timer': EndgameValues.stopwatch},
  );

  static final teleopClimbHeightDropdown = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': EndgameValues.climbHeight,
      'dropdownItems': OptionConstants.endgameOptions,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final teleopBallsScoredCounter = FieldDescriptor(
    type: FieldType.counter,
    config: {
      'controller': TeleoperatedValues.ballsScored,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final teleopBallsPassedCounter = FieldDescriptor(
    type: FieldType.counter,
    config: {
      'controller': TeleoperatedValues.ballsPassed,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final teleopNumberPad = FieldDescriptor(
    type: FieldType.numberPad,
    config: {
      'displayedController': TeleoperatedValues.numberPadDisplayedValue,
      'targetController': TeleoperatedValues.ballsScored,
      'targetControllerPass': TeleoperatedValues.ballsPassed,
      'showPassButton': true,
    },
  );
}
