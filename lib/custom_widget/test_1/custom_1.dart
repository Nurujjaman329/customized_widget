import 'package:flutter/material.dart';

class CustomFormField extends FormField<String> {
  CustomFormField({
    Key? key,
    final String? labelText,
    final String? hintText,
    final Icon? prefixicon,
    final Icon? suffixicon,
    final FocusNode? focusNode,
    final ValueChanged<String>? onFieldSubmitted,
    TextEditingController? controller,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    String? initialValue,
    bool autovalidate = false,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,

          //autovalidate: autovalidate,
          builder: (FormFieldState<String> state) {
            return TextFormField(
              controller: controller,
              onChanged: state.didChange,
              focusNode: focusNode,
              onFieldSubmitted: onFieldSubmitted,
              decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText,
                prefixIcon: prefixicon,
                suffixIcon: suffixicon,
                errorText: state.errorText,
                border: OutlineInputBorder(),
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

class CustomFormTest extends StatefulWidget {
  const CustomFormTest({Key? key}) : super(key: key);

  @override
  State<CustomFormTest> createState() => _CustomFormTestState();
}

class _CustomFormTestState extends State<CustomFormTest> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  final _nameFocus = FocusNode();
  final _numberFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    _nameFocus.dispose();
    _numberFocus.dispose();
    _passwordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomFormField(
                  labelText: 'Password',
                  hintText: 'Enter Your Password',
                  controller: _nameController,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_numberFocus);
                  },
                  focusNode: _nameFocus,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                CustomFormField(
                  labelText: 'Mobile Number',
                  hintText: 'Enter Your Mobile Number',
                  controller: _numberController,
                  focusNode: _numberFocus,
                  prefixicon: Icon(Icons.numbers),
                  suffixicon: const Icon(Icons.visibility),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Form is valid, you can proceed.'),
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
