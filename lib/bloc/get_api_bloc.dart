import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  GetApiBloc() : super(GetApiInitial()) {
    on<GetApiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
