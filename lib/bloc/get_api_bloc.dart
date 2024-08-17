import 'package:api_get/model/postmodel.dart';
import 'package:api_get/repository/postmodelrepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';



part 'get_api_event.dart';
part 'get_api_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  Postmodelrepository postmodelrepository = Postmodelrepository();
  List<postmodel> searchlist;
  GetApiBloc({this.searchlist = const []}) : super(GetApiState()) {
    
    
    on<fetchdata>((event, emit) async {
       await postmodelrepository.getdata().then((value) {
          emit(state.copyWith(postmodellist: value));
        },
        ).onError((error, stackTrace) {
          emit(state.copyWith(postmodellist: []));
        },);
    });


    on<searchdata>((event, emit) {
      if(event.searchtext.isEmpty){
        emit(state.copyWith(searchlist: [],Searchmessage: ''));
      }
      else{
        // For id search :  searchlist = state.postmodellist.where((element) => element.id.toString() == event.searchtext.toString()).toList();
        // for title search 
        searchlist = state.postmodellist.where((element) => element.title.toString().toLowerCase().contains(event.searchtext.toString().toLowerCase())).toList();
         if(searchlist.isEmpty){
          emit(state.copyWith(searchlist: [],Searchmessage: 'No Data Found!'));
         }else{
          emit(state.copyWith(searchlist: searchlist,Searchmessage: ''));
         }
     
      }
     
    });
  }
}
