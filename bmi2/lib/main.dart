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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green,Colors.yellow],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Icon(
                  Icons.widgets,
                  size: 150,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Selamat Datang di Aplikasi Kami!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  'Pilih Alat (Tools) yang Anda Butuhkan:',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              ToolButton(
                title: 'Pengonversi Suhu',
                icon: Icons.wb_sunny,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TemperatureConverterApp(),
                  ));
                },
              ),
              ToolButton(
                title: 'Hitung BMI',
                icon: Icons.fitness_center,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BmiApp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToolButton extends StatefulWidget {
  final String title;
  final IconData? icon;
  final VoidCallback onTap;

  ToolButton({required this.title, this.icon, required this.onTap});

  @override
  _ToolButtonState createState() => _ToolButtonState();
}

class _ToolButtonState extends State<ToolButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: () {
          setState(() {
            _isTapped = !_isTapped;
          });
          Future.delayed(Duration(milliseconds: 100), () {
            widget.onTap();
            setState(() {
              _isTapped = !_isTapped;
            });
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          padding: EdgeInsets.symmetric(horizontal: _isTapped ? 20 : 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  size: 24,
                ),
              SizedBox(width: 10),
              Text(
                widget.title,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
