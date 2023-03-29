import 'package:companyname/bloc/register_company_bloc.dart';
import 'package:companyname/pages/registercompany.dart';
import 'package:companyname/widgets/companyTab.dart';
import 'package:companyname/widgets/infoTab.dart';
import 'package:companyname/widgets/passwordTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCompany extends StatefulWidget {
  const SearchCompany({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchCompanyState createState() => _SearchCompanyState();
}

class _SearchCompanyState extends State<SearchCompany>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Flutter App'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Info'),
            Tab(text: 'Password'),
            Tab(text: 'Company'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const InfoTab(),
          const PasswordTab(),
          // true ? CompanyTab() : Registercompany(),
          BlocConsumer<RegisterCompanyBloc, RegisterCompanyState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if( state is ClickedRegisterState){
                return Registercompany();
              }
              else if(state is ClickedSearchedState){
                return const CompanyTab();
              }
              else {
                return const CompanyTab();
              }
                  
            },
          )
        ],
      ),
    );
  }
}
