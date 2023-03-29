part of 'register_company_bloc.dart';

@immutable
abstract class RegisterCompanyEvent extends Equatable {}

class ClickedRegisterEvent extends RegisterCompanyEvent{

ClickedRegisterEvent();
List<Object> get props => [];
}


class ClickedSearchedEvent extends RegisterCompanyEvent{

ClickedSearchedEvent();
List<Object> get props => [];
}

class AddCompanyDataEvent extends RegisterCompanyEvent{
final String name;
AddCompanyDataEvent({required this.name});
List<Object> get props => [name];
}