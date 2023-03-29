import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:companyname/bloc/register_company_bloc.dart';
import 'package:companyname/components/custombutton.dart';
import 'package:companyname/components/customtextfiels.dart';

class CompanyTab extends StatefulWidget {

  const CompanyTab({super.key});

  @override
  State<CompanyTab> createState() => _CompanyTabState();
}

class _CompanyTabState extends State<CompanyTab> {
  final TextEditingController _controller = TextEditingController();

  bool _isTaxable = false;
    bool _isChecked = false;
    bool isRegister = false;
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textEditingControllerSecond = TextEditingController();
  TextEditingController _searchValue = TextEditingController();
final List<String> suggestions = [
  // 'abc',
  // 'xyz',
  'kundan pvt ltd',
  'LNT',
  'Google',
  'Microsoft',
  'Apple',
  // 'Honeydew',
  // 'Kiwi',
  // 'Lemon',
];
  @override
  Widget build(BuildContext context) {
final myBloc = BlocProvider.of<RegisterCompanyBloc>(context).valueChek;

  suggestions.add(myBloc);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         
           const SizedBox(height: 16),
  
TypeAheadFormField(
  keepSuggestionsOnSuggestionSelected :true,
  textFieldConfiguration:  TextFieldConfiguration(
    controller: _searchValue, 
    decoration: const InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    hintText: 'Search Company...',
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  ),
  ),
  suggestionsCallback: (pattern) {
    return suggestions.where((fruit) =>
        fruit.toLowerCase().contains(pattern.toLowerCase()));
  },
  itemBuilder: (context, suggestion) {
    return ListTile(
      title: Text(suggestion),
    );
  },
  onSuggestionSelected: (suggestion) {
    print('Selected: $suggestion');
  

  },
),
const SizedBox(height: 16),
Row(
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (newValue) {
            setState(() {
              _isChecked = newValue!;
            });
          },
        ),
        Expanded(
          child: CustomTextfield(controller:  _textEditingControllerSecond,
           hintValue: '', 
           isChecking: _isChecked, maxLine: 5,),
        ),
      ],
    ),
          const SizedBox(height: 16),
         Row(
      children: [
        Checkbox(
          value: _isTaxable,
          onChanged: (newValue) {
            setState(() {
              _isTaxable = newValue!;
            });
          },
        ),
        Expanded(
          child:  CustomTextfield(controller:  _textEditingControllerSecond,
           hintValue: '', 
           isChecking: _isTaxable, maxLine: 5,)
         
        ),
      ],
    ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child:  CustomButton(name: 'Request to Join', onPressed: () {  },)
          ),
          
          const SizedBox(height: 5),
          const Divider(thickness: 2,color: Colors.black,),
           const SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child:  CustomButton(name: 'Register a New Company', onPressed: () {
              setState(() {
                isRegister = true;
              }); 
              BlocProvider.of<RegisterCompanyBloc>(context).
              add(ClickedRegisterEvent());
             },)
          ),
        ],
      ),
    );
  }
}
