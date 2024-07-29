// Mocks generated by Mockito 5.4.4 from annotations
// in vinoveritas/test/src/features/home_favorite_feature/heartbutton_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:bloc/bloc.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_cubit.dart'
    as _i4;
import 'package:vinoveritas/src/features/home_favorite_feature/controller/wine_state.dart'
    as _i3;
import 'package:vinoveritas/src/features/home_favorite_feature/model/wine_model.dart'
    as _i7;
import 'package:vinoveritas/src/features/home_favorite_feature/repository/wine_repository.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWineRepository_0 extends _i1.SmartFake
    implements _i2.WineRepository {
  _FakeWineRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWineState_1 extends _i1.SmartFake implements _i3.WineState {
  _FakeWineState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WineCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockWineCubit extends _i1.Mock implements _i4.WineCubit {
  MockWineCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WineRepository get wineRepository => (super.noSuchMethod(
        Invocation.getter(#wineRepository),
        returnValue: _FakeWineRepository_0(
          this,
          Invocation.getter(#wineRepository),
        ),
      ) as _i2.WineRepository);

  @override
  int get offset => (super.noSuchMethod(
        Invocation.getter(#offset),
        returnValue: 0,
      ) as int);

  @override
  set offset(int? _offset) => super.noSuchMethod(
        Invocation.setter(
          #offset,
          _offset,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get limit => (super.noSuchMethod(
        Invocation.getter(#limit),
        returnValue: 0,
      ) as int);

  @override
  String get color => (super.noSuchMethod(
        Invocation.getter(#color),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#color),
        ),
      ) as String);

  @override
  set color(String? _color) => super.noSuchMethod(
        Invocation.setter(
          #color,
          _color,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get sort => (super.noSuchMethod(
        Invocation.getter(#sort),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#sort),
        ),
      ) as String);

  @override
  set sort(String? _sort) => super.noSuchMethod(
        Invocation.setter(
          #sort,
          _sort,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set fitOrFlavour(String? _fitOrFlavour) => super.noSuchMethod(
        Invocation.setter(
          #fitOrFlavour,
          _fitOrFlavour,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get favlist => (super.noSuchMethod(
        Invocation.getter(#favlist),
        returnValue: false,
      ) as bool);

  @override
  set favlist(bool? _favlist) => super.noSuchMethod(
        Invocation.setter(
          #favlist,
          _favlist,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get shareCode => (super.noSuchMethod(
        Invocation.getter(#shareCode),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#shareCode),
        ),
      ) as String);

  @override
  set shareCode(String? _shareCode) => super.noSuchMethod(
        Invocation.setter(
          #shareCode,
          _shareCode,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.WineState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeWineState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.WineState);

  @override
  _i6.Stream<_i3.WineState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i6.Stream<_i3.WineState>.empty(),
      ) as _i6.Stream<_i3.WineState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  _i6.Future<void> fetchWines({bool? resetList = false}) => (super.noSuchMethod(
        Invocation.method(
          #fetchWines,
          [],
          {#resetList: resetList},
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> applyFilters({
    String? color,
    String? sort,
    String? fitOrFlavour,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #applyFilters,
          [],
          {
            #color: color,
            #sort: sort,
            #fitOrFlavour: fitOrFlavour,
          },
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> fetchFavlistWines(String? favlistShareCode) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchFavlistWines,
          [favlistShareCode],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  _i6.Future<void> toggleFavorite(_i7.Wine? wine) => (super.noSuchMethod(
        Invocation.method(
          #toggleFavorite,
          [wine],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);

  @override
  void emit(_i3.WineState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i8.Change<_i3.WineState>? change) => super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i6.Future<void>.value(),
        returnValueForMissingStub: _i6.Future<void>.value(),
      ) as _i6.Future<void>);
}
