part of 'register_company_bloc.dart';

@immutable
abstract class RegisterCompanyState {}

class RegisterCompanyInitial extends RegisterCompanyState {}


class ClickedRegisterState extends RegisterCompanyState{
ClickedRegisterState();
List<Object> get props => [];
}

class ClickedSearchedState extends RegisterCompanyState{
ClickedSearchedState();
List<Object> get props => [];
}

class AddCompanyDataState extends RegisterCompanyState{
  final String name;
AddCompanyDataState({ required this.name});
List<Object> get props => [];
}
