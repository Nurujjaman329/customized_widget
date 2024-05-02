import 'package:flutter/material.dart';

class CustomFormField extends FormField<String> {
  CustomFormField({
    Key? key,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String? labelText,
    String? hintText,
    Icon? prefixicon,
    Icon? suffixicon,
    FocusNode? focusNode,
    //final ValueChanged<String>? onChanged;

    final ValueChanged<String>? onFieldSubmitted,
    final TextEditingController? controller,
    final TextInputType? keyBoardType,
    String? initialValue,
    //bool autovalidate = false,
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
                validator: validator,
                controller: controller,
                focusNode: focusNode,
                onChanged: state.didChange,
                onFieldSubmitted: onFieldSubmitted,
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

//InputDecoration formInputDecoration(String label, Icon? icon) {
//  return InputDecoration(
//    // Customize the appearance of the input field
//    border: OutlineInputBorder(
//      borderRadius: BorderRadius.circular(4.0),
//      borderSide: BorderSide(
//        color: Colors.grey,
//        width: 1.0,
//      ),
//    ),
//    focusedBorder: OutlineInputBorder(
//      borderRadius: BorderRadius.circular(4.0),
//      borderSide: const BorderSide(
//        color: Colors.blueAccent,
//        width: 1.0,
//      ),
//    ),
//    filled: true,
//    fillColor: Colors.white,
//    contentPadding:
//        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),

//    // Customize the appearance of the label text
//    labelText: label,
//    labelStyle: const TextStyle(
//      color: Colors.black,
//      fontWeight: FontWeight.bold,
//      fontSize: 16.0,
//    ),

//    // Customize the appearance of the helper text
//    /*helperText: 'Custom Helper Text',
//    helperStyle: TextStyle(
//      color: Colors.grey,
//      fontSize: 14.0,
//    ),*/

//    // Customize the appearance of the error text
//    /*errorText: 'Custom Error Text',
//    errorStyle: TextStyle(
//      color: Colors.red,
//      fontSize: 14.0,
//    ),*/

//    // Customize the appearance of the prefix icon
//    prefixIcon: icon,
//    prefixIconConstraints:
//        const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
//    prefixIconColor: Colors.blue,

//    // Customize the appearance of the suffix icon
//    /*suffixIcon: const Icon(Icons.clear),
//    suffixIconConstraints: const BoxConstraints(minWidth: 40.0, minHeight: 40.0),
//    suffixIconColor: Colors.red,*/
//  );
//}

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
