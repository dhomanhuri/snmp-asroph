import 'package:flutter/material.dart';
import 'package:snmp/page/serverinfo/serverinfo.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder myinputborder() {
      //return type is OutlineInputBorder
      return const OutlineInputBorder(

          //Outline border type for TextFeild
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 3,
          ));
    }

    OutlineInputBorder myfocusborder() {
      return const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 3,
          ));
    }

    return Container(
      padding: const EdgeInsets.all(11),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blueAccent, Colors.white])),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 7,
          ),
          const Text(
            'Masukan Perangkat',
            style: TextStyle(
              fontSize: 30,
              // color: Colors.red,
              fontStyle: FontStyle.normal,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 24),
          TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              labelText: "Nama",
              border: myinputborder(), //normal border
              enabledBorder: myinputborder(), //enabled border
              focusedBorder: myfocusborder(), //focused border
              // set more border style like disabledBorder
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Address / IP",
              border: myinputborder(), //normal border
              enabledBorder: myinputborder(), //enabled border
              focusedBorder: myfocusborder(), //focused border
              // set more border style like disabledBorder
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.4,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.navigate_next),
              label: const Text("Berikutnya"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ServerInfo()),
                );
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 2.0, color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
