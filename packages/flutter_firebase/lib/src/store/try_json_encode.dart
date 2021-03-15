import 'dart:convert' show jsonEncode;

String tryJsonEncode(action) {
  try {
    return jsonEncode(action);
  } catch (err) {
    return '';
  }
}