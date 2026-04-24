// ignore_for_file: file_names

class OptionConstants {
  static final yesNoOptions = ["Yes", "No"];

  static final startPositions = ["Trench", "Bump", "Hub"];

  static final autoPath = [
    "None",
    "1 Sweep",
    "2 Sweep",
    "Depot",
    "Outpost",
    "Preload Only",
    "Feeding",
    "Blocker",
    "Other"
  ];

  static final depthIntoPile = ["None", "Greedy", "Midline", "Shallow"];

  static final autoClimbOptions = ["No", "Yes", "Failed"];

  static final endgameOptions = [
    "Did not attempt",
    "Failed",
    "Level 1",
    "Level 2",
    "Level 3"
  ];

  static final climbPosition = ["None", "Far", "Middle", "Near"];

  static List<String> availableDriverstations = [
    "Red 1",
    "Red 2",
    "Red 3",
    "Blue 1",
    "Blue 2",
    "Blue 3",
  ];
}
