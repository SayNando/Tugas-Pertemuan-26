import 'package:flutter/material.dart';
import 'package:bmi2/main.dart';

import 'logic_bmi.dart';

class BmiApp extends StatefulWidget {
  const BmiApp({Key? key}) : super(key: key);

  @override
  _BmiAppState createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  TextEditingController tinggiController = TextEditingController();
  TextEditingController beratController = TextEditingController();

  String hasilBMI = ''; // Variabel untuk menyimpan hasil BMI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoverPage(),
                ));
          },
          child: Icon(Icons.west),
        ),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(children: [
              Text("Masukan Tinggi Badan (CM)",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextField(
                controller: tinggiController,
                decoration: const InputDecoration(
                  hintText: 'Contoh: 150',
                ),
              )
            ]),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(children: [
              const Text(
                "Masukan Berat Badan (KG)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: beratController,
                decoration: const InputDecoration(
                  hintText: 'Contoh: 150',
                ),
              )
            ]),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                double tinggi = double.tryParse(tinggiController.text) ?? 0;
                double berat = double.tryParse(beratController.text) ?? 0;

                if (tinggi > 0 && berat > 0) {
                  BMICalculator kalkulator = BMICalculator();
                  double bmi = kalkulator.calculateBMI(berat, tinggi);
                  String hasil = kalkulator.getBMIResult(bmi);

                  setState(() {
                    hasilBMI =
                        'BMI Anda Dengan\nTinggi: $tinggi\nBerat: $berat\nAdalah: $bmi\nKategori: $hasil';
                  });
                } else {
                  setState(() {
                    hasilBMI = 'Masukkan Nilai yang Valid';
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: const Text(
                'Hitung',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              hasilBMI,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
