// ignore_for_file: unnecessary_new

import '/screens/widgets/textbox.dart';
import 'package:flutter/material.dart';
import '/screens/widgets/range_slider.dart' as rs;

class Emi extends StatefulWidget {
  const Emi({Key? key}) : super(key: key);

  @override
  _EmiState createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  double? _value;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _value = 1.0;
  }

  _sliderValueUpdate(double value) {
    _value = value;
    tenure.text = _value!.toInt().toString();
    setState(() {});
  }

  _prValueUpdate(double value) {
    _value = value;
    pr.text = _value!.toInt().toString();
    setState(() {});
  }

  TextEditingController pr = TextEditingController();
  TextEditingController roi = TextEditingController();
  TextEditingController tenure = TextEditingController();
  _compute() {
    int prValue = int.parse(pr.text);
    int tenureValue = int.parse(tenure.text); // Assume Month
    double monthlyPrEMI = prValue / tenureValue;
    double roiValue = double.parse(roi.text);
    double monthlyROI = (prValue * (roiValue / 100)) / tenureValue;
    print("Pr $prValue ROI $roiValue Tenure $tenureValue");
    print(
        "Monthly Pr $monthlyPrEMI Monthly ROI $monthlyROI EMI ${(monthlyPrEMI + monthlyROI)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EMI Calc'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    // leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text(
                      'Enter Loan Amount',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'The ammount is before fee.',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextBox('Loan Amount', Icons.currency_rupee, pr),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    // leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text(
                      'Enter ROI',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'The rate of interest that lenders demand',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextBox('Rate of Interest', Icons.percent, roi),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    // leading: Icon(Icons.arrow_drop_down_circle),
                    title: const Text(
                      'Select Loan Tenure',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      'Move the slider to select the collateral term \n in months',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: TextBox('Tenure', Icons.calendar_month, tenure),
                    // child: rs.RangeSlider(_value ?? 1.0, _sliderValueUpdate),
                  ),
                ],
              ),
            ),
            rs.RangeSlider(_value ?? 1.0, _sliderValueUpdate),
            ElevatedButton(
                onPressed: () {
                  _compute();
                  Navigator.of(context).pop();
                },
                child: Text('EMI Compute')),
          ],
        ),
      ),
    );
  }
}
