import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plc_data/add_card.dart';
import 'package:plc_data/widgets/chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences sharedPreferences;
  late List<String> gridList = [];
  late List<String> singleGridList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseSharedPref();
  }

  Future initialiseSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      gridList = sharedPreferences.getStringList('gridList')!;
      singleGridList = sharedPreferences.getStringList('singleGridList')!;
    });
  }

  Future clearField(int index) async {
    sharedPreferences = await SharedPreferences.getInstance();
    gridList.removeAt(index);
    singleGridList.removeAt(index);
    setState(() {
      sharedPreferences.setStringList('gridList', gridList);
      sharedPreferences.setStringList('singleGridList', singleGridList);
      // sharedPreferences.getStringList('dataList');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Things"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      drawer: Drawer(),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: gridList.length > 3 ? 240 : 120,
            child: GridView.builder(
                itemCount: gridList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 5, top: 10, right: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          gridList[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              clearField(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: singleGridList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 5,
                    margin: const EdgeInsets.only(left: 5, top: 10, right: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          singleGridList[index],
                          style: TextStyle(color: Colors.white),
                        ),
                        LiveLineChart()
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddCard()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
