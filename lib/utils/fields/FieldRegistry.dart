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
      'margin': const EdgeInsets.only(left: 20.0),
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
            final teamNumber = await Schedulehelper.getTeamNumberFromSchedule(
                int.parse(PrematchValues.matchNumber.text));
            PrematchValues.teamNumber.text = teamNumber.toString();

            PrematchValues.hopperCapacity.text =
                await Schedulehelper.findRobotCapacity(
                    PrematchValues.teamNumber.text);
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

  // Autonomous - Left column fields
  static final autoStartPosition = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': AutonomousValues.autoStartPosition,
      'dropdownItems': OptionConstants.startPositions,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final autoPath = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': AutonomousValues.autoPath,
      'dropdownItems': OptionConstants.autoPath,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );
  static final autoSweep = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': AutonomousValues.autoSweep,
      'dropdownItems': OptionConstants.depthIntoPile,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final autoClimb = FieldDescriptor(
    type: FieldType.dropdown,
    config: {
      'controller': AutonomousValues.autoClimb,
      'dropdownItems': OptionConstants.autoClimbOptions,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  static final autoBeachCounter = FieldDescriptor(
    type: FieldType.counter,
    config: {
      'controller': AutonomousValues.autoBeachCount,
      'margin': const EdgeInsets.only(left: 20.0),
    },
  );

  // Teleop
  static final teleopScoring =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopScoring,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopPassing =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopPassing,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopCleanUp =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopCleanUp,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopCycles =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopCycles,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopStealing =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopStealing,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopDefence =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopDefence,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopGetDefended =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopGetDefended,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopBroken =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopBroken,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopDead = FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopDead,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopBackToLife =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': TeleoperatedValues.teleopBackToLife,
    'dropdownItems': OptionConstants.yesNoOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final teleopBeachCounter =
      FieldDescriptor(type: FieldType.counter, config: {
    'controller': TeleoperatedValues.teleopBeachCount,
    'margin': const EdgeInsets.only(left: 20.0)
  });
  static final endGameClimb =
      FieldDescriptor(type: FieldType.dropdown, config: {
    'controller': EndgameValues.endGameClimb,
    'dropdownItems': OptionConstants.endgameOptions,
    'margin': const EdgeInsets.only(left: 20.0)
  });
}
