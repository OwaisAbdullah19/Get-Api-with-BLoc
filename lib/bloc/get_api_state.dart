part of 'get_api_bloc.dart';

 class GetApiState extends Equatable {
  final List<postmodel> postmodellist;
   GetApiState({this.postmodellist = const[]});




GetApiState copyWith ({List<postmodel> ?postmodellist}){
return GetApiState(
  postmodellist: postmodellist??this.postmodellist,
);

}
   

 
  @override
  List<Object> get props => [];
}


