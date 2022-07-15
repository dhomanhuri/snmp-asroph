import 'package:flutter/material.dart';
import 'package:snmp/page/devicepage/devicepage.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueAccent, Colors.white])),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.network(
              'https://akupintar.id/documents/20143/0/LOGO+POLITEKNIK+NEGERI+MALANG.png/949b5c7d-1fd2-121d-c1ad-f275911cb955?version=1.0&t=1519104037264&imagePreview=1',
              width: 200,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 23,
              // width: 400,
            ),
            const Text(
              'SNMP',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text('Simple Network Management Protocol'),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              // width: 400,
            ),
            SizedBox(
              width: 400,
              height: 60,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.navigate_next),
                label: const Text("Berikutnya"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DevicePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  side: const BorderSide(width: 2.0, color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
