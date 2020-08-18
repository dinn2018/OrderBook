import 'package:flutter_bloc/flutter_bloc.dart';

ErrorCubit errorCubit = ErrorCubit();

class ErrorCubit extends Cubit<Error> {
  ErrorCubit() : super(null);

  Error get error => state;

  void errored(Error err) {
    if (error != err) {
      emit(error);
    }
  }
}
