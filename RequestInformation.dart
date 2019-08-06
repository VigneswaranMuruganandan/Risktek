import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import '../utils/style.dart';
import 'package:fabhr/utils/customIcon.dart';

class RequestInformation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RequestInformationState();
  }
}

class _RequestInformationState extends State<RequestInformation> {
  final _formKey = new GlobalKey<FormState>();
  List<String> _nameList = [
    'Mitchell Chambers',
    'Mitchell Chambers',
    'Mitchell Chambers',
    'Mitchell Chambers'
  ];
  String _name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildBody(),
    ));
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(
        'Request Information',
        style: TextStyle(
          color: Color.fromRGBO(12, 35, 64, 1.0),
          fontSize: 16,
          letterSpacing: 0,
          fontFamily: 'FSMatthew',
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1.0)),
      ),
      leading: IconButton(
        icon: Icon(CustomIcon.back,
            size: 15.5, color: Color.fromRGBO(185, 192, 202, 1.0)),
        color: Color.fromRGBO(185, 192, 202, 1.0),
        onPressed: () => Navigator.pop(context, false),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Color.fromRGBO(246, 249, 252, 1.0),
      padding: EdgeInsets.only(top: 49, left: 34, right: 34),
      child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _labelText(context, 'Select name'),
                _customDropDown(context),
                SizedBox(height: 40),
                _labelText(context, 'Comment*'),
                _customTextfield(context),
                _actionWidget(context)
              ],
            ),
          )),
    );
  }

  Container _labelText(BuildContext context, String label) {
    return Container(
      padding: EdgeInsets.only(left: 8, bottom: 10),
      child: Text(label, style: InputFormLabelStyle),
    );
  }

  Container _customDropDown(BuildContext context) {
    return Container(
      decoration: InputFormDecoration,
      padding: EdgeInsets.only(left: 18, top: 10, bottom: 10, right: 8),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        value: _name,
        onChanged: (String newValue) {
          _onChangedDropDown(newValue);
        },
        hint: Text('Select'),
        items: _nameList.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  _onChangedDropDown(String value) {
    setState(() {
      _name = value;
    });
  }

  Container _customTextfield(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18, top: 17, right: 18),
      decoration: InputFormDecoration,
      child: TextField(
        maxLines: 8,
        decoration: InputDecoration(
            hintText: "Max 200 carechters", border: InputBorder.none),
      ),
    );
  }

  Container _actionWidget() {
    return Container(
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
