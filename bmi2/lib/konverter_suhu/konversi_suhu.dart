import 'package:flutter/material.dart';
import 'package:bmi2/main.dart';

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.thermostat, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Pengonversi Suhu',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          leading: InkWell(
            child: Icon(Icons.arrow_back, color: Colors.white),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CoverPage(),
                ),
              );
            },
          ),
          backgroundColor: Colors.orange,
        ),
        body: TemperatureConverter(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum TemperatureUnit {
  Celsius,
  Fahrenheit,
  Kelvin,
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({Key? key}) : super(key: key);

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();
  TemperatureUnit inputUnit = TemperatureUnit.Celsius;
  TemperatureUnit outputUnit = TemperatureUnit.Fahrenheit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.orange, Colors.deepOrange],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40),
            InputField(
              controller: inputController,
              label: 'Input',
              onChanged: (value) {
                convertTemperature();
              },
            ),
            SizedBox(height: 20),
            DropdownButton<TemperatureUnit>(
              value: inputUnit,
              onChanged: (newValue) {
                setState(() {
                  inputUnit = newValue!;
                });
                convertTemperature();
              },
              items: TemperatureUnit.values.map<DropdownMenuItem<TemperatureUnit>>(
                (unit) {
                  return DropdownMenuItem<TemperatureUnit>(
                    value: unit,
                    child: Text(unit.toString().split('.').last),
                  );
                },
              ).toList(),
            ),
            SizedBox(height: 20),
            InputField(
              controller: outputController,
              label: 'Output',
              enabled: false, onChanged: (String value) {  },
            ),
            SizedBox(height: 20),
            DropdownButton<TemperatureUnit>(
              value: outputUnit,
              onChanged: (newValue) {
                setState(() {
                  outputUnit = newValue!;
                });
                convertTemperature();
              },
              items: TemperatureUnit.values.map<DropdownMenuItem<TemperatureUnit>>(
                (unit) {
                  return DropdownMenuItem<TemperatureUnit>(
                    value: unit,
                    child: Text(unit.toString().split('.').last),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void convertTemperature() {
    final inputText = inputController.text;
    if (inputText.isEmpty) {
      outputController.text = '';
      return;
    }

    final inputValue = double.tryParse(inputText) ?? 0.0;
    double result;

    switch (inputUnit) {
      case TemperatureUnit.Celsius:
        result = convertCelsius(inputValue, outputUnit);
        break;
      case TemperatureUnit.Fahrenheit:
        result = convertFahrenheit(inputValue, outputUnit);
        break;
      case TemperatureUnit.Kelvin:
        result = convertKelvin(inputValue, outputUnit);
        break;
    }

    outputController.text = result.toStringAsFixed(2);
  }

  double convertCelsius(double value, TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.Celsius:
        return value;
      case TemperatureUnit.Fahrenheit:
        return (value * 9 / 5) + 32;
      case TemperatureUnit.Kelvin:
        return value + 273.15;
    }
  }

  double convertFahrenheit(double value, TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.Celsius:
        return (value - 32) * 5 / 9;
      case TemperatureUnit.Fahrenheit:
        return value;
      case TemperatureUnit.Kelvin:
        return (value - 32) * 5 / 9 + 273.15;
    }
  }

  double convertKelvin(double value, TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.Celsius:
        return value - 273.15;
      case TemperatureUnit.Fahrenheit:
        return (value - 273.15) * 9 / 5 + 32;
      case TemperatureUnit.Kelvin:
        return value;
    }
  }

  @override
  void dispose() {
    inputController.dispose();
    outputController.dispose();
    super.dispose();
  }
}

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final ValueChanged<String> onChanged;
  final bool enabled;

  InputField({
    required this.controller,
    required this.label,
    required this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, color: Colors.white),
          hintText: 'Contoh: 25',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          prefixIcon: Icon(Icons.thermostat, color: Colors.white),
        ),
        enabled: enabled,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TemperatureConverterApp(),
  ));
}
