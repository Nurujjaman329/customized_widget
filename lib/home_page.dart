import 'dart:developer';

import 'package:flutter/material.dart';

import 'custom_widget/check_box_test.dart';
import 'custom_widget/custom_button.dart';
import 'custom_widget/custom_form.dart';
import 'custom_widget/radio_button_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();

  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0,
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  bottom: 10.0,
                  left: 40.0,
                  right: 40.0,
                ),
                child: CustomFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  prefixicon: Icon(Icons.man),
                  suffixicon: Icon(Icons.visibility),
                  keyBoardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter text';
                    }
                    return null;
                  },
                ),
              ),
              CustomButton(buttonName: 'Submit'),
              SizedBox(
                height: 10.0,
              ),

              RadioButtonTest(
                radioButtonName: 'Radio',
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomButton(buttonName: 'RadioButton'),
              SizedBox(
                height: 10.0,
              ),

              RadioButtonTest(
                radioButtonName: 'Test_2',
              ),

              CustomButton(
                buttonName: 'CheckBox ',
              ),
              SizedBox(
                height: 10.0,
              ),

              CheckBoxTest(),

              CustomButton(
                buttonName: 'CheckBox',
              ),

              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomFormField(
                        focusNode: f1,
                        onChanged: (newValue) {
                          if (newValue.length == 8) {
                            f1.unfocus();
                            FocusScope.of(context).requestFocus(f2);
                          }
                        },
                        controller: _nameController,
                        labelText: 'Name',
                        hintText: 'Enter Your Name',
                        keyBoardType: TextInputType.text,
                        prefixicon: Icon(Icons.man),
                        //autovalidate: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter text';
                          }
                          log(value.toString());
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      CustomFormField(
                        focusNode: f2,
                        onChanged: (newValue) {
                          if (newValue.length == 8) {
                            f2.unfocus();
                            FocusScope.of(context).requestFocus(f3);
                          }
                        },
                        controller: _numberController,
                        labelText: 'Mobile Number',
                        hintText: 'Enter Your Mobile Number',
                        prefixicon: Icon(Icons.man),
                        keyBoardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      //CustomDropdownButton<String>(
                      //  labelText: _selectedItem ?? 'Select Item',
                      //  items: ['Item 1', 'Item 2', 'Item 3'],
                      //  value: _selectedItem,
                      //  onChanged: (value) {
                      //    setState(() {
                      //      _selectedItem = value;
                      //    });

                      //    print('Selected: $value');
                      //  },
                      //),
                      SizedBox(
                        height: 10.0,
                      ),
                      CustomFormField(
                        focusNode: f3,
                        onChanged: (newValue) {
                          if (newValue.length == 8) {
                            f3.unfocus();
                            FocusScope.of(context).requestFocus();
                          }
                        },
                        controller: _passwordController,
                        labelText: 'Password',
                        hintText: 'Enter Your Password',
                        prefixicon: Icon(Icons.man),
                        suffixicon: Icon(Icons.visibility),
                        keyBoardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Form is valid, you can proceed.'),
                              ),
                            );
                          }
                        },
                        child: CustomButton(
                          buttonName: 'Form Submit',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              //ElevatedButton(
              //  child: Text("Button"),
              //),
              //SliderTestWidget(),
              //CheckBoxTest(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  //Widget _button() {
  //  return Container(
  //    height: MediaQuery.of(context).size.height * .07,
  //    width: MediaQuery.of(context).size.width * .80,
  //    decoration: BoxDecoration(
  //      borderRadius: BorderRadius.circular(
  //        10.0,
  //      ),
  //      color: Colors.orange,
  //    ),
  //    child: Center(
  //      child: Text(
  //        "Container",
  //        style: TextStyle(
  //          color: Colors.white,
  //        ),
  //      ),
  //    ),
  //  );
  //}
}
