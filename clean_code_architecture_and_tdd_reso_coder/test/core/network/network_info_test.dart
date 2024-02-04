import 'package:clean_code_architecture_and_tdd_reso_coder/core/network/network_info.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection',
        () async {
      //arrange

      // final tHasConnectionFuture = Future.value(true);
      final tHasConnectionFuture = true;
      when(() => mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) async => tHasConnectionFuture);

      //act
      final result = await networkInfo.isConnected;

      //assert
      verify(() => mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
