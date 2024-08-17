part of 'get_api_bloc.dart';

class GetApiState extends Equatable {
  final List<postmodel> postmodellist;
  final String Searchmessage;
  final List<postmodel> searchlist;
  GetApiState({this.postmodellist = const [], this.Searchmessage = '',this.searchlist=const[]});

  GetApiState copyWith({List<postmodel>? postmodellist,String ? Searchmessage ,List<postmodel> ?searchlist}) {
    return GetApiState(
      postmodellist: postmodellist ?? this.postmodellist,
      Searchmessage: Searchmessage ?? this.Searchmessage,
      searchlist: searchlist??this.searchlist,
    );
  }

  @override
  List<Object> get props => [postmodellist, Searchmessage,searchlist];
}
