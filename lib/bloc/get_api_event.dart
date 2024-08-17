part of 'get_api_bloc.dart';

abstract class GetApiEvent extends Equatable {
  const GetApiEvent();

  @override
  List<Object> get props => [];
}

class fetchdata extends GetApiEvent {
  @override
  List<Object> get props => [];
}

class searchdata extends GetApiEvent {
  String searchtext;

  searchdata({required this.searchtext});
  @override
  List<Object> get props => [searchtext];
}
