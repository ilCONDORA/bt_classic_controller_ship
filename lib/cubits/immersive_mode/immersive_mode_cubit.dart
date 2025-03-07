import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'immersive_mode_state.dart';

class ImmersiveModeCubit extends Cubit<ImmersiveModeState> {
  // Initialize with non-immersive state
  ImmersiveModeCubit() : super(const ImmersiveModeState());
  
  // Method to enable immersive mode
  void enterImmersiveMode() {
    // Hide the status and navigation bars
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    
    // Emit the new state
    emit(state.copyWith(isImmersive: true));
  }
  
  // Method to disable immersive mode
  void exitImmersiveMode() {
    // Restore the system UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    
    // Emit the new state
    emit(state.copyWith(isImmersive: false));
  }
  
  // Utility method to toggle immersive mode
  void toggleImmersiveMode() {
    if (state.isImmersive) {
      exitImmersiveMode();
    } else {
      enterImmersiveMode();
    }
  }
  
  // Ensure to clean up when the Cubit is closed
  @override
  Future<void> close() {
    // Restore the system UI before closing
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return super.close();
  }
}