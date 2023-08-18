import 'package:flutter/material.dart';
import 'package:sq/dB.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  SQL_db_Model sqLdb = SQL_db_Model();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Database'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 350),
              TextButton(
                child: Text('Insert  Data'),
                onPressed: () async {
                  int respons = await sqLdb.InsertData(
                      "INSERT INTO 'notes_table' ('note') VALUES ('note three') ");
                  print(respons);
                },
              ),
              TextButton(
                child: Text('Delete  Data'),
                onPressed: () async {
                  int respons = await sqLdb
                      .deleteData("DELETE FROM 'notes_table' WHERE id =  1 ");
                  print(respons);
                },
              ),
              TextButton(
                child: Text('Read Data'),
                onPressed: () async {
                  List<Map> respons =
                      await sqLdb.readData("SELECT * FROM 'notes_table'");
                  print(respons);
                },
              ),
              TextButton(
                child: Text('Updata Data'),
                onPressed: () async {
                  int respons = await sqLdb.UpdateData(
                      "UPDATE 'notes_table' SET 'note' = 'note six' WHERE id = 3 ");
                  print(respons);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
