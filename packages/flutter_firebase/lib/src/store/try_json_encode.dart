import 'dart:convert' show jsonEncode;

String tryJsonEncode(obj) {
  try {
    return jsonEncode(obj);
  } catch (err) {
    return obj.toString();
  }
}