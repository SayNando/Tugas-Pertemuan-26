import 'package:flutter/material.dart';
import 'package:bmi2/main.dart';

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pengonversi Suhu'),
          leading: InkWell(
            child: Icon(Icons.west),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CoverPage(),
                  ));
            },
          ),
        ),
        body: TemperatureConverter(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();
  TextEditingController kelvinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            controller: celsiusController,
            onChanged: (value) {
              if (value.isEmpty) {
                fahrenheitController.clear();
                kelvinController.clear();
                return;
              }
              final celsius = double.tryParse(value) ?? 0.0;
              final fahrenheit = (celsius * 9 / 5) + 32;
              final kelvin = celsius + 273.15;

              fahrenheitController.text = fahrenheit.toStringAsFixed(2);
              kelvinController.text = kelvin.toStringAsFixed(2);
            },
            decoration: InputDecoration(labelText: 'Celsius'),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: fahrenheitController,
            onChanged: (value) {
              if (value.isEmpty) {
                celsiusController.clear();
                kelvinController.clear();
                return;
              }
              final fahrenheit = double.tryParse(value) ?? 0.0;
              final celsius = (fahrenheit - 32) * 5 / 9;
              final kelvin = celsius + 273.15;

              celsiusController.text = celsius.toStringAsFixed(2);
              kelvinController.text = kelvin.toStringAsFixed(2);
            },
            decoration: InputDecoration(labelText: 'Fahrenheit'),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: kelvinController,
            onChanged: (value) {
              if (value.isEmpty) {
                celsiusController.clear();
                fahrenheitController.clear();
                return;
              }
              final kelvin = double.tryParse(value) ?? 0.0;
              final celsius = kelvin - 273.15;
              final fahrenheit = (celsius * 9 / 5) + 32;

              celsiusController.text = celsius.toStringAsFixed(2);
              fahrenheitController.text = fahrenheit.toStringAsFixed(2);
            },
            decoration: InputDecoration(labelText: 'Kelvin'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    celsiusController.dispose();
    fahrenheitController.dispose();
    kelvinController.dispose();
    super.dispose();
  }
}
