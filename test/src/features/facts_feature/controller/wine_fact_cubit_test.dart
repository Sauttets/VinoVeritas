import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:vinoveritas/src/features/lexicon_feature/controller/wine_fact_cubit.dart';
import 'package:vinoveritas/src/features/lexicon_feature/model/wine_fact_model.dart';
import 'package:vinoveritas/src/features/lexicon_feature/wine_fact_repository.dart';
import 'package:mockito/annotations.dart';
import 'wine_fact_cubit_test.mocks.dart';

@GenerateMocks([WineFactRepository])
void main() {
  group('WineFactCubit', () {
    late WineFactCubit wineFactCubit;
    late MockWineFactRepository mockWineFactRepository;

    setUp(() {
      mockWineFactRepository = MockWineFactRepository();
      wineFactCubit = WineFactCubit(wineFactRepository: mockWineFactRepository);
    });

    tearDown(() {
      wineFactCubit.close();
    });

    blocTest<WineFactCubit, WineFactState>(
      'emits [WineFactLoading, WineFactLoaded] when fetchWineFact is successful',
      build: () {
        when(mockWineFactRepository.fetchWineFact()).thenAnswer((_) async => WineFact(fact: 'Test Fact'));
        return wineFactCubit;
      },
      act: (cubit) => cubit.fetchWineFact(),
      expect: () => [
        isA<WineFactLoading>(),
        isA<WineFactLoaded>().having((state) => state.wineFact.fact, 'fact', 'Test Fact'),
      ],
    );

    blocTest<WineFactCubit, WineFactState>(
      'emits [WineFactLoading, WineFactLoaded] with default fact when fetchWineFact fails',
      build: () {
        when(mockWineFactRepository.fetchWineFact()).thenThrow(Exception('Failed to load wine fact'));
        return wineFactCubit;
      },
      act: (cubit) => cubit.fetchWineFact(),
      expect: () => [
        isA<WineFactLoading>(),
        isA<WineFactLoaded>().having((state) => state.wineFact.fact, 'fact', 'The color of a wine is determined by the grape variety and the winemaking process.'),
      ],
    );
  });
}
