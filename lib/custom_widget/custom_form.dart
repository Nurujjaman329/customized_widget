import 'package:flutter/material.dart';

class CustomFormField extends FormField<String> {
  final String labelText;
  final String hintText;
  final Icon? prefixicon;
  final Icon? suffixicon;
  final FocusNode? focusNode;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;

  final TextEditingController controller;
  final TextInputType? keyBoardType;

  CustomFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.prefixicon,
    this.suffixicon,
    this.focusNode,
    required this.controller,
    this.keyBoardType,
    this.onChanged,
    FormFieldSetter<String>? onSaved,
    this.validator,
    String? initialValue,
    bool autovalidate = false,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          //autovalidate: autovalidate,
          builder: (FormFieldState<String> state) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                keyboardType: keyBoardType,
                controller: controller,
                focusNode: focusNode,
                onChanged: onChanged,
                decoration: InputDecoration(
                  labelText: labelText,
                  hintText: hintText,
                  prefixIcon: prefixicon,
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
                  prefixIconColor: Colors.blue,
                  suffixIcon: suffixicon,
                  errorText: state.errorText,
                  border: OutlineInputBorder(),
                ),
              ),
            );
          },
        );

  @override
  FormFieldState<String> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends FormFieldState<String> {
  @override
  CustomFormField get widget => super.widget as CustomFormField;
}

InputDecoration formInputDecoration(String label, Icon? icon) {
  return InputDecoration(
    // Customize the appearance of the input field
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: const BorderSide(
        color: Colors.blueAccent,
        width: 1.0,
      ),
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

    // Customize the appearance of the label text
    labelText: label,
    labelStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16.0,
    ),

    // Customize the appearance of the helper text
    /*helperText: 'Custom Helper Text',
    helperStyle: TextStyle(
      color: Colors.grey,
      fontSize: 14.0,
    ),*/

    // Customize the appearance of the error text
    /*errorText: 'Custom Error Text',
    errorStyle: TextStyle(
      color: Colors.red,
      fontSize: 14.0,
    ),*/

    // Customize the appearance of the prefix icon
    prefixIcon: icon,
    prefixIconConstraints:
        const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
    prefixIconColor: Colors.blue,

    // Customize the appearance of the suffix icon
    /*suffixIcon: const Icon(Icons.clear),
    suffixIconConstraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
    suffixIconColor: Colors.red,*/
  );
}

//class CustomFormTest extends StatefulWidget {
//  const CustomFormTest({Key? key}) : super(key: key);

//  @override
//  State<CustomFormTest> createState() => _CustomFormTestState();
//}

//class _CustomFormTestState extends State<CustomFormTest> {
//  final _formKey = GlobalKey<FormState>();

//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(16.0),
//      child: Form(
//        key: _formKey,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            CustomFormField(
//              labelText: ,
//              icon: Icons.person,
//              validator: (value) {
//                if (value == null || value.isEmpty) {
//                  return 'Please enter some text';
//                }
//                return null;
//              },
//            ),
//            SizedBox(height: 20),
//            InkWell(
//              onTap: () {
//                if (_formKey.currentState!.validate()) {
//                  ScaffoldMessenger.of(context).showSnackBar(
//                    SnackBar(
//                      content: Text('Form is valid, you can proceed.'),
//                    ),
//                  );
//                }
//              },
//              child: CustomButton(),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
