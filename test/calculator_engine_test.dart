import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/calculator_engine.dart';

void main() {
  group('Calculator engine', () {
    final sut = CalculatorEngine();

    test('should have correct initial value', () {
      expect(sut.output, '0');
    });

    test('should keep only one leading zero', () {
      sut.nextValue('0');
      sut.nextValue('0');
      expect(sut.output, '0');
    });

    test('should generate correct output after providing 4', () {
      sut.nextValue('4');
      expect(sut.output, '4');
    });

    test('should generate correct output after providing 2', () {
      sut.nextValue('2');
      expect(sut.output, '42');
    });

    test('should not change output after providing + operator', () {
      sut.nextValue('+');
      expect(sut.output, '42');
    });

    test('should generate correct output after providing 6', () {
      sut.nextValue('6');
      expect(sut.output, '6');
    });

    test('should generate correct output after providing 3', () {
      sut.nextValue('3');
      expect(sut.output, '63');
    });

    test('should generate correct output after providing = operator', () {
      sut.nextValue('=');
      expect(sut.output, '105');
    });

    test('should not change output after providing - operator', () {
      sut.nextValue('-');
      expect(sut.output, '105');
    });

    test('should generate correct output after providing 8', () {
      sut.nextValue('8');
      expect(sut.output, '8');
    });

    test('should generate correct output after providing = operator', () {
      sut.nextValue('=');
      expect(sut.output, '97');
    });

    test('should throw ValueNotSupported exception when providing unsupported value', () {
      expect(() => sut.nextValue('t'), throwsException);
    });

  });
}
