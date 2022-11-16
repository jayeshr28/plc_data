import 'package:flutter/material.dart';

import '../../MODEL/operations.dart';
import '../../widgets/textFormFieldWidget.dart';

class SwitchFormTurnOff extends StatefulWidget {
  const SwitchFormTurnOff({Key? key}) : super(key: key);

  @override
  State<SwitchFormTurnOff> createState() => _SwitchFormTurnOffState();
}

class _SwitchFormTurnOffState extends State<SwitchFormTurnOff> {
  final _formkey = GlobalKey<FormState>();
  late String _Operations = "GET";
  TextEditingController _switchTurnOffUrl = TextEditingController();
  TextEditingController _switchTurnOffSuccessCode = TextEditingController();

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
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Request",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      dropdownColor: Colors.black,
                      style: const TextStyle(color: Colors.white),
                      value: _Operations,
                      isDense: true,
                      onChanged: (newValue) {
                        setState(() {
                          _Operations = newValue!;
                        });
                      },
                      items: Operations.op.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                kTextFormField(
                    controller: _switchTurnOffUrl,
                    keyboardType: TextInputType.url,
                    hintText: "URL"),
                const SizedBox(
                  height: 20,
                ),
                kTextFormField(
                  controller: _switchTurnOffSuccessCode,
                  keyboardType: TextInputType.number,
                  hintText: "Success Status Code",
                ),
                const SizedBox(
                  height: 20,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
