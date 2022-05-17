import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  String _label;
  IconData _iconData;
  TextEditingController value;
  TextBox(this._label, this._iconData,this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          controller: value,
          decoration: InputDecoration(label: Text(_label),
            hintText: "Type $_label",
            suffixIcon: Icon(_iconData),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
          ),

        ),
    );
  }
}