import 'dart:io';

import 'package:dart_snmp/dart_snmp.dart';
import 'package:flutter/material.dart';
import 'package:snmp/page/serverinfo/serverinfo.dart';
import 'package:snmp/globals.dart' as globals;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void devname() async {
    var target = InternetAddress(globals.ip);
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.1.1.0'); // sysDesc
    var message = await session.get(oid);
    // print('session 2= ' + session.toString());
    // print('getdadata 2= ' + message.pdu.varbinds[0].toString());
    // String devicename = message.pdu.varbinds[0].toString();
    // List<String> listname = devicename.split(':');
    // print('getdadata = ' + listname[1].toString());
    // print('tst');
    globals.login = true;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ServerInfo()),
    );
    //   setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder myinputborder() {
      //return type is OutlineInputBorder
      return const OutlineInputBorder(

          //Outline border type for TextFeild
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.black,
            width: 3,
          ));
    }

    OutlineInputBorder myfocusborder() {
      return const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.grey,
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
          Image.network(
            'https://akupintar.id/documents/20143/0/LOGO+POLITEKNIK+NEGERI+MALANG.png/949b5c7d-1fd2-121d-c1ad-f275911cb955?version=1.0&t=1519104037264&imagePreview=1',
            width: 200,
          ),
          const SizedBox(
            height: 10,
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
            onChanged: (value) {
              globals.name = value;
            },
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
            onChanged: (value) {
              globals.ip = value;
            },
            decoration: InputDecoration(
              labelText: "Address / IP",
              border: myinputborder(), //normal border
              enabledBorder: myinputborder(), //enabled border
              focusedBorder: myfocusborder(), //focused border
              // set more border style like disabledBorder
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
          ),
          SizedBox(
            width: 400,
            height: 60,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.navigate_next),
              label: const Text("Berikutnya"),
              onPressed: () async {
                if (globals.name == '' || globals.ip == '') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Masukan Nama dan IP Server"),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Menghubungkan Server SNMP"),
                  ));
                  devname();
                  print(globals.login);
                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ServerInfo()),
                // );
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(width: 2.0, color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          ),
          // SizedBox(
          //   width: double.infinity,
          //   height: 60,
          //   child: OutlinedButton.icon(
          //     icon: const Icon(Icons.navigate_next),
          //     label: const Text("Berikutnya"),
          //     onPressed: () async {
          //       if (globals.name == '' || globals.ip == '') {
          //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //           content: Text("Masukan Nama dan IP Server"),
          //         ));
          //       } else {
          //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          //           content: Text("Mohon Tunggu"),
          //         ));
          //         devname();
          //         print(globals.login);
          //       }
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const ServerInfo()),
          //       );
          //     },
          //     style: ElevatedButton.styleFrom(
          //       side: const BorderSide(width: 2.0, color: Colors.grey),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(17.0),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
