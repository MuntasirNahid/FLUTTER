import 'package:clean_code_architecture_and_tdd_reso_coder/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;
  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
        'should return an integer when the string represents an unsigned integer',
        () async {
      //arrange
      final str = '123';

      //act
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, Right(123));
    });

    test('should return failure when the string is not an integer', () async {
      //arrange
      final str = 'abc';

      //act
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, Left(InvalidInputFailure()));
    });

    test('should return failure when the string is a negative integer',
        () async {
      //arrange
      final str = '-123';

      //act
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
