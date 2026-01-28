// ignore_for_file: file_names
enum FieldType {
  numberPad,
  textField,
  checkbox,
  dropdown,
  stopwatch,
  counter,
  numberInput,
  label
}

class FieldDescriptor {
  final FieldType type;
  final Map<String, dynamic> config;

  FieldDescriptor({required this.type, Map<String, dynamic>? config})
      : config = config ?? {};
}
