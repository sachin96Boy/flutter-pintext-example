import 'package:flutter/material.dart';
// import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formkey = GlobalKey<FormState>();

  final otpController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpController.dispose();
  }

  final pinLength = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('custom pincodetextfield example')),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Please Enter the OTP Text Below'),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: PinCodeExample1(
                    pinLength: pinLength, otpController: otpController),
              ),
              //   child: Pincodeexample2(
              //       otpController: otpController, pinLength: pinLength),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Pincodeexample2 extends StatelessWidget {
//   const Pincodeexample2({
//     super.key,
//     required this.otpController,
//     required this.pinLength,
//   });

//   final TextEditingController otpController;
//   final int pinLength;

//   @override
//   Widget build(BuildContext context) {
//     return PinCodeTextField(
//       autofocus: true,
//       controller: otpController,
//       hideCharacter: true,
//       highlight: true,
//       highlightColor: Colors.blue,
//       defaultBorderColor: Colors.black,
//       hasTextBorderColor: Colors.green,
//       highlightPinBoxColor: Colors.orange,
//       maxLength: pinLength,
//       onTextChanged: (text) {
//         print(text);
//       },
//       onDone: (text) {
//         print("DONE $text");
//       },
//       pinBoxWidth: 50,
//       pinBoxHeight: 64,
//       wrapAlignment: WrapAlignment.spaceBetween,
//       pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
//       pinTextStyle: const TextStyle(fontSize: 22.0),
//       pinTextAnimatedSwitcherTransition:
//           ProvidedPinBoxTextAnimation.scalingTransition,
//       pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
//       highlightAnimationBeginColor: Colors.black,
//       highlightAnimationEndColor: Colors.white12,
//       keyboardType: TextInputType.number,
//     );
//   }
// }

class PinCodeExample1 extends StatelessWidget {
  const PinCodeExample1({
    super.key,
    required this.pinLength,
    required this.otpController,
  });

  final int pinLength;
  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: pinLength,
      keyboardType: TextInputType.number,
      autoFocus: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
      ),
      controller: otpController,
      onCompleted: (value) => print(value),
      onChanged: (value) {
        print(value);
      },
    );
  }
}
