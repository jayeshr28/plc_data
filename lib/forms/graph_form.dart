import 'package:flutter/material.dart';

import '../widgets/request_form.dart';
import '../widgets/textFormFieldWidget.dart';

class GraphForm extends StatefulWidget {
  const GraphForm({Key? key}) : super(key: key);

  @override
  State<GraphForm> createState() => _GraphFormState();
}

class _GraphFormState extends State<GraphForm> {
  final _formkey = GlobalKey<FormState>();
  late String _Operations = "GET";
  TextEditingController _graph = TextEditingController();
  TextEditingController _graphSuccessCode = TextEditingController();
  TextEditingController arrayJsonPath = TextEditingController();
  TextEditingController xValueJsonPath = TextEditingController();
  TextEditingController xValueSuffix = TextEditingController();
  TextEditingController yValueJsonPath = TextEditingController();
  TextEditingController yValueSuffix = TextEditingController();

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
                    operations: _Operations,
                    URL: _graph,
                    successCode: _graphSuccessCode),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Data Points",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Line Chart",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      kTextFormField(
                        controller: arrayJsonPath,
                        keyboardType: TextInputType.multiline,
                        hintText: "Array Json Path",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      kTextFormField(
                        controller: xValueJsonPath,
                        keyboardType: TextInputType.multiline,
                        hintText: "X Value Json Path",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      kTextFormField(
                        controller: xValueSuffix,
                        keyboardType: TextInputType.multiline,
                        hintText: "X Value Suffix",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      kTextFormField(
                        controller: yValueJsonPath,
                        keyboardType: TextInputType.multiline,
                        hintText: "Y Value Json Path",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      kTextFormField(
                        controller: yValueSuffix,
                        keyboardType: TextInputType.multiline,
                        hintText: "Y Value Suffix",
                      ),
                    ],
                  ),
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
