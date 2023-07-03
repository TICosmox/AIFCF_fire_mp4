import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../providers/local_storage_provider.dart';
part 'validation_event.dart';
part 'validation_state.dart';

class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  final LocalStorage? localStorage;
  ValidationBloc(
    this.localStorage,
  ) : super(ValidationInitial()) {
    on<ValidationInit>((event, emit) async {
      emit(ValidationLogin());
    });
  }
}
