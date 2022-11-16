import 'package:flutter/material.dart';

import '../widgets/request_form.dart';

class ButtonForm extends StatefulWidget {
  const ButtonForm({Key? key}) : super(key: key);

  @override
  State<ButtonForm> createState() => _ButtonFormState();
}

class _ButtonFormState extends State<ButtonForm> {
  final _formkey = GlobalKey<FormState>();
  late String Operations = "GET";
  TextEditingController _buttonURL = TextEditingController();
  TextEditingController _buttonSuccessCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: SingleChildScrollView(
            child: Form(
                key: _formkey,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RequestForm(
                            operations: Operations,
                            successCode: _buttonSuccessCode,
                            URL: _buttonURL,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.maxFinite,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow,
                                  elevation: 0,
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.black),
                                )),
                          )
                        ])))));
  }
}
