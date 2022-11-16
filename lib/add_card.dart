import 'package:flutter/material.dart';
import 'package:plc_data/forms/button_form.dart';
import 'package:plc_data/forms/graph_form.dart';
import 'package:plc_data/forms/switch_form/switch_form_get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forms/temperature_form.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  late SharedPreferences sharedPreferences;
  late List<String> list1 = [];
  late List<String> list2 = [];
  @override
  void initState() {
    super.initState();
    initialiseSP();
  }

  void initialiseSP() async {
    sharedPreferences = await SharedPreferences.getInstance();
    list1 = sharedPreferences.getStringList('gridList')!;
    list2 = sharedPreferences.getStringList('singleGridList')!;
  }

  void StoreDataInList1(int index) {
    setState(() {
      list1.add(title[index]);
      sharedPreferences.setStringList('gridList', list1);
    });
  }

  void StoreDataInList2(int index) {
    setState(() {
      list2.add(title[index]);

      sharedPreferences.setStringList('singleGridList', list2);
    });
  }

  List title = [
    "Button",
    "Temperature",
    "Switch",
    "Graph",
    "Slider",
    "Pressure Monitoring",
    "Gauge"
  ];
  List<IconData> icons = [
    Icons.touch_app,
    Icons.thermostat_sharp,
    Icons.play_circle_fill,
    Icons.add_chart,
    Icons.landslide_rounded,
    Icons.looks_one_rounded,
    Icons.pie_chart
  ];
  List sharedtitle = [];
  List sharedIcon = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Parameter"),
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ButtonForm()));
                        break;
                      }

                    case 1:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TempForm()));
                        break;
                      }
                    case 2:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SwitchFormGet()));
                        break;
                      }
                    case 3:
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GraphForm()));
                        break;
                      }
                    case 4:
                      {
                        break;
                      }
                    case 5:
                      {
                        break;
                      }
                    case 6:
                      {}
                  }

                  // if (index == 3 || index == 4 || index == 6) {
                  //   StoreDataInList2(index);
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => HomePage()));
                  // } else {
                  //   StoreDataInList1(index);
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => HomePage()));
                  // }
                },
                child: Container(
                  height: 70,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title[index],
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        icons[index],
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}
