import 'package:flutter/material.dart';

class RangeSlider extends StatelessWidget {
  double value;
  Function _parentFn;
  RangeSlider(this.value, this._parentFn);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        onChanged: (double val) {
          value = val;
          _parentFn(value);
        },
        value: value,
        min: 1,
        max: 100,
      ),
    );
  }
}
