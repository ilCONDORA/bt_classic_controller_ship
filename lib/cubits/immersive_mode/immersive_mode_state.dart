part of 'immersive_mode_cubit.dart';

@immutable
class ImmersiveModeState {
  final bool isImmersive;

  const ImmersiveModeState({this.isImmersive = false});

  ImmersiveModeState copyWith({bool? isImmersive}) {
    return ImmersiveModeState(
      isImmersive: isImmersive ?? this.isImmersive,
    );
  }
}
