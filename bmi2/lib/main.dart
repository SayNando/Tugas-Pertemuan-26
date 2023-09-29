import 'package:flutter/material.dart';

import 'bmi/bmi.dart';
import 'konverter_suhu/konversi_suhu.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CoverPage(),
  ));
}

class CoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.network(
          'https://picsum.photos/200',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text(
                  'Selamat Datang di Aplikasi Kami!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Text(
                'Pilih Alat (Tools) yang Anda Butuhkan:',
                style: TextStyle(fontSize: 18),
              ),
            ),
            ToolButton(
              title: 'Pengonversi Suhu',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TemperatureConverterApp()));
              },
            ),
            ToolButton(
              title: 'Hitung BMI',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => BmiApp()),
                );
              },
            ),
          ],
        ),
      ]),
    );
  }
}

class ToolButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  ToolButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black)),
        onPressed: onTap,
        child: Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
