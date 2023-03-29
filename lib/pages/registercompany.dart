import 'package:companyname/bloc/register_company_bloc.dart';
import 'package:companyname/components/custombutton.dart';
import 'package:companyname/components/customtextfiels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class Registercompany extends StatelessWidget {
// const Registercompany({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//     return Container();
//   }
// }

class Registercompany extends StatelessWidget {
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _panController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();

  Registercompany({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextfield(controller: _companyNameController,
            hintValue: 'Name of the company',),
            
            const SizedBox(height: 16.0),
             CustomTextfield(controller: _addressController,
            hintValue: 'Address',),
            
            const SizedBox(height: 16.0),
             CustomTextfield(controller: _panController,
            hintValue: 'PAN',),
            
            const SizedBox(height: 16.0),
            CustomTextfield(controller: _gstController,
            hintValue: 'GST',),
        
            const SizedBox(height: 16.0),
            Container(
            decoration: BoxDecoration(border: Border.all()),
            child:  CustomButton(name: 'Submit', onPressed: () {  
              BlocProvider.of<RegisterCompanyBloc>(context).add(AddCompanyDataEvent(name: _companyNameController.text));
            },),
          ),
           const SizedBox(height: 16.0),
            Container(
            decoration: BoxDecoration(border: Border.all()),
            child: CustomButton(name: 'Search Company', onPressed: () {
              BlocProvider.of<RegisterCompanyBloc>(context).add(ClickedSearchedEvent());
              },),
          ),
         
          ],
        ),
      ),
    );
  }
}