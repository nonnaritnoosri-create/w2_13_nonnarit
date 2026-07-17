import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'โปรแกรมแปลงหน่วย',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'โปรแกรมแปลงนิ้วเป็นเซนติเมตร'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _inchesController = TextEditingController();

  double inches = 0;
  double cm = 0;

  void calculate() {

    inches = double.tryParse(_inchesController.text) ?? 0;

    print("Inches = $inches");

    setState(() {

      cm = inches * 2.54;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'โปรแกรมแปลงนิ้วเป็นเซนติเมตร',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),


              Text(
                "$inches นิ้ว = ${cm.toStringAsFixed(2)} เซนติเมตร",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),


              TextField(
                controller: _inchesController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "กรอกจำนวนหน่วย (นิ้ว)",
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.straighten),
                  iconColor: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),


              ElevatedButton(
                onPressed: () => calculate(),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                ),
                child: const Text("แปลงหน่วย", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}