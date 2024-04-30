import 'package:flutter/material.dart';

class CustomDropdownButton<T> extends StatefulWidget {
  final String labelText;
  final List<T> items;
  final T? value;
  final ValueChanged<T?> onChanged;

  CustomDropdownButton({
    required this.labelText,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  _CustomDropdownButtonState<T> createState() =>
      _CustomDropdownButtonState<T>();
}

class _CustomDropdownButtonState<T> extends State<CustomDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter text';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: PopupMenuButton<T>(
            icon: Icon(Icons.arrow_drop_down),
            initialValue: widget.value,
            onSelected: widget.onChanged,
            itemBuilder: (BuildContext context) {
              return widget.items.map((T item) {
                return PopupMenuItem<T>(
                  value: item,
                  child: Text(item.toString()),
                );
              }).toList();
            },
          ),
          border: OutlineInputBorder(),
        ),
        readOnly: true,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        controller: TextEditingController(text: widget.value?.toString() ?? ''),
      ),
    );
  }
}
