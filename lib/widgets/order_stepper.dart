import 'package:flutter/material.dart';

class OrderStepper extends StatefulWidget {
  const OrderStepper({
    Key key,
    @required this.stepperType,
    @required int currentStep,
  })  : _currentStep = currentStep,
        super(key: key);

  final StepperType stepperType;
  final int _currentStep;

  @override
  State<OrderStepper> createState() => _OrderStepperState();
}

class _OrderStepperState extends State<OrderStepper> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: widget.stepperType,
      physics: ScrollPhysics(),
      currentStep: widget._currentStep,
      //  onStepTapped: (step) => tapped(step),
      //  onStepContinue: continued,
      //onStepCancel: cancel,
      steps: <Step>[
        Step(
          title: new Text(
            'Order placed on 26 July',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            'We have received your order',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff979797),
              fontWeight: FontWeight.w400,
            ),
          ),
          content: Column(
            children: <Widget>[],
          ),
          isActive: true,
          // isActive: _currentStep >= 0,
          // state: _currentStep >= 0
          //     ? StepState.complete
          //     : StepState.disabled,
        ),
        Step(
          title: new Text(
            'Confirmed',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            'Order accepted on 26 July',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff979797),
              fontWeight: FontWeight.w400,
            ),
          ),
          content: Column(
            children: <Widget>[],
          ),
          isActive: true,
          // isActive: _currentStep >= 0,
          // state: _currentStep >= 1
          //     ? StepState.complete
          //     : StepState.disabled,
        ),
        Step(
          title: new Text(
            'Order Shipped',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff979797),
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            'Estimated for 3rd Aug',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff979797),
              fontWeight: FontWeight.w400,
            ),
          ),
          content: Column(
            children: <Widget>[],
          ),
          isActive: false,
          // isActive: _currentStep >= 0,
          // state: _currentStep >= 1
          //     ? StepState.complete
          //     : StepState.disabled,
        ),
        Step(
          title: new Text(
            'Delivered',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff979797),
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Text(
            'Estimated for 3rd Aug',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff979797),
              fontWeight: FontWeight.w400,
            ),
          ),
          content: Column(
            children: <Widget>[],
          ),
          isActive: false,
          // isActive: _currentStep >= 0,
          // state: _currentStep >= 1
          //     ? StepState.complete
          //     : StepState.disabled,
        ),
      ],
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  // continued() {
  //   _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  // }

  // cancel() {
  //   _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  // }

}
