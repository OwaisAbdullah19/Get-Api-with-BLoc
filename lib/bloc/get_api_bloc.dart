import 'package:api_get/model/postmodel.dart';
import 'package:api_get/repository/postmodelrepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';



part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  Postmodelrepository postmodelrepository = Postmodelrepository();
  GetApiBloc() : super(GetApiState()) {
    
    
    on<fetchdata>((event, emit) async {
       await postmodelrepository.getdata().then((value) {
          emit(state.copyWith(postmodellist: value));
        },
        ).onError((error, stackTrace) {
          emit(state.copyWith(postmodellist: []));
        },);
    });
  }
}
