import 'package:flutter_firebase/src/store/try_json_encode.dart';
import 'package:test/test.dart';

class Counter {
  final int count;
  Counter(this.count);
  
  Map<String, dynamic> toJson() => <String, dynamic> {
    'count': this.count,
  };
}

class Test {
  final int count;
  Test(this.count);
}

void main() {
  group('try_json_encode', () {
    test('should return encoded', () {
      final counter = Counter(1);
      final json = tryJsonEncode(counter);
      expect(json, equals('{"count":1}'));
    });
    test('should return toString if no toJson', () {
      final counter = Test(1);
      final json = tryJsonEncode(counter);
      expect(json, equals("Instance of 'Test'"));
    });
    test('should return for null', () {
      final counter = null;
      final json = tryJsonEncode(counter);
      expect(json, equals("null"));
    });
  });
}