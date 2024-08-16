part of 'get_api_bloc.dart';

sealed class GetApiState extends Equatable {
  const GetApiState();
  
  @override
  List<Object> get props => [];

  get postmodellist => null;
}

final class GetApiInitial extends GetApiState {}
