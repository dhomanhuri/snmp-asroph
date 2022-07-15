// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:dart_snmp/dart_snmp.dart';
import 'dart:io';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    print("asdsad");
    init();
  }

  void init() async {
    var target = InternetAddress('192.168.1.3');
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.6.1'); // sysDesc
    var message = await session.get(oid);
    print(message.pdu.varbinds);
  }

  void systeminfo() async {
    var target = InternetAddress('192.168.1.3');
    var session = await Snmp.createSession(target);
    var oid = Oid.fromString('1.3.6.1.2.1.31.1.1.1.6.1'); // sysDesc
    var message = await session.get(oid);
    print(message.pdu.varbinds[0]);
  }
  // void tests(){
  //   Varbind.fromBytes(Uint8List bytes) {
  // var sequence = ASN1Sequence.fromBytes(bytes);
  // assert(sequence.elements[0].tag == OBJECT_IDENTIFIER);
  // oid = Oid.fromBytes(sequence.elements[0].encodedBytes);
  // tag = sequence.elements[1].tag;
  // value = _decodeValue(sequence.elements[1]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("asd"),
      ),
      body: Container(
        child: IconButton(
            onPressed: () {
              init();
            },
            icon: const Icon(Icons.abc)),
      ),
    );
  }
}
