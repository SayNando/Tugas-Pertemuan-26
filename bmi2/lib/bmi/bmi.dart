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

  String hasilBMI = '';

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
              ),
            );
          },
          child: Icon(Icons.west, color: Colors.white),
        ),
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.deepPurple],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.accessibility_new,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  child: Column(
                    children: [
                      TextFormField(
                        controller: tinggiController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.height, color: Colors.purple),
                          labelText: "Tinggi Badan (CM)",
                          labelStyle: TextStyle(fontSize: 16),
                          hintText: 'Contoh: 150',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: beratController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 18),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.fitness_center, color: Colors.purple),
                          labelText: "Berat Badan (KG)",
                          labelStyle: TextStyle(fontSize: 16),
                          hintText: 'Contoh: 60',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
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
                    primary: Colors.purple,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Hitung BMI',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  child: Text(
                    hasilBMI,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
