import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'register_company_event.dart';
part 'register_company_state.dart';

class RegisterCompanyBloc extends Bloc<RegisterCompanyEvent, RegisterCompanyState> {
     String valueChek= '';
  RegisterCompanyBloc({required this.valueChek}) : super(RegisterCompanyInitial()) {
   
    on<ClickedRegisterEvent>((event, emit) => _isRegistered(emit, event));
    on<ClickedSearchedEvent>((event, emit) => _isSearched(emit, event));
    on<AddCompanyDataEvent>(((event, emit) => _isAddCompanyName(emit, event)));
  }

  _isRegistered(Emitter<RegisterCompanyState> emit, ClickedRegisterEvent event) {
    print("block is runnning");
    emit(ClickedRegisterState( ));
  }
  
  _isSearched(Emitter<RegisterCompanyState> emit, ClickedSearchedEvent event) {
    print("object");
    emit(ClickedSearchedState( ));
  }
  
  _isAddCompanyName(Emitter<RegisterCompanyState> emit, AddCompanyDataEvent event) {
    print("Add Event");
    valueChek = event.name;
     print('$valueChek, jhdcjhsvdjj');
    emit(AddCompanyDataState(name: event.name));
  }
}
