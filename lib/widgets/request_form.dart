import 'package:flutter/material.dart';
import 'package:plc_data/MODEL/operations.dart';
import 'package:plc_data/widgets/textFormFieldWidget.dart';

class RequestForm extends StatefulWidget {
  String operations;
  final TextEditingController URL;
  final TextEditingController successCode;

  RequestForm({
    Key? key,
    required this.operations,
    required this.URL,
    required this.successCode,
  }) : super(key: key);

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 50,
      ),
      const Text(
        "Request",
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
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
            value: widget.operations,
            isDense: true,
            onChanged: (newValue) {
              setState(() {
                widget.operations = newValue!;
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
          controller: widget.URL,
          keyboardType: TextInputType.url,
          hintText: "URL"),
      const SizedBox(
        height: 20,
      ),
      kTextFormField(
        controller: widget.successCode,
        keyboardType: TextInputType.number,
        hintText: "Success Status Code",
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
