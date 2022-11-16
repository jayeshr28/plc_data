import 'package:flutter/material.dart';
import 'package:plc_data/widgets/data_points_form.dart';
import 'package:plc_data/widgets/request_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TempForm extends StatefulWidget {
  const TempForm({Key? key}) : super(key: key);

  @override
  State<TempForm> createState() => _TempFormState();
}

class _TempFormState extends State<TempForm> {
  final _formkey = GlobalKey<FormState>();
  late String _Operations = "GET";
  late SharedPreferences sharedPreferences;
  late List<String> fanNameList = [];
  late List<String> fanIDList = [];

  TextEditingController _tempURL = TextEditingController();
  TextEditingController _tempSuccessCode = TextEditingController();
  TextEditingController tempJson = TextEditingController();
  TextEditingController humidityJson = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialiseSP();
  }

  void initialiseSP() async {
    sharedPreferences = await SharedPreferences.getInstance();
    fanNameList = sharedPreferences.getStringList('fanNameList')!;
    fanIDList = sharedPreferences.getStringList('fanIDList')!;
  }

  void StoreData() {
    // FanData data = FanData(fanName: _fanName.text, fanID: _fanID.text);
    // String fanNameData = jsonEncode(data.fanName);
    // String fanIdData = jsonEncode(data.fanID);
    // fanNameList.insert(fanNameList.length, fanNameData);
    // fanIDList.insert(fanIDList.length, fanIdData);
    // sharedPreferences.setStringList('fanNameList', fanNameList);
    // sharedPreferences.setStringList('fanIDList', fanIDList);
  }

  Future<void> _submit() async {
    if (!_formkey.currentState!.validate()) {
      return;
    }
    _formkey.currentState!.save();
  }

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
                    URL: _tempURL,
                    successCode: _tempSuccessCode),
                const SizedBox(
                  height: 20,
                ),
                DataPointsForm(
                    JsonPath: tempJson,
                    JsonPath2: humidityJson,
                    title: "Temperature",
                    secondTitle: "Humidity"),
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
