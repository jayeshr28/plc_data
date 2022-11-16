import 'package:flutter/material.dart';
import 'package:plc_data/widgets/textFormFieldWidget.dart';

class DataPointsForm extends StatefulWidget {
  final String title;
  final String secondTitle;
  final TextEditingController JsonPath;
  final TextEditingController JsonPath2;
  const DataPointsForm(
      {Key? key,
      required this.JsonPath,
      required this.JsonPath2,
      required this.title,
      required this.secondTitle})
      : super(key: key);

  @override
  State<DataPointsForm> createState() => _DataPointsFormState();
}

class _DataPointsFormState extends State<DataPointsForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Data Points",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          // height: 100,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              kTextFormField(
                controller: widget.JsonPath,
                keyboardType: TextInputType.multiline,
                hintText: "Json Path",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          // height: 100,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white30, borderRadius: BorderRadius.circular(7)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.secondTitle,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              kTextFormField(
                controller: widget.JsonPath2,
                keyboardType: TextInputType.multiline,
                hintText: "Json Path",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
