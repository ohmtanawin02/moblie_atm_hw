import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'ธนาคารกรุงสี'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double Balance = 0;

  TextEditingController Amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'จำนวนเงิน',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Text(
                      "$Balance",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ))
                  ],
                )),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: Amount,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'กรอกจำนวนเงิน'),
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              children: [
                Container(
                  child: TextButton(
                      child: Text(
                        'ถอน',
                        style: TextStyle(fontSize: 30),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          if (double.parse(Amount.text) >= 0) {
                            if (Balance - double.parse(Amount.text) >= 0) {
                              Balance = Balance - double.parse(Amount.text);
                            }
                          }
                        });
                      }),
                ),
                SizedBox(
                  width: 100,
                ),
                Container(
                  child: TextButton(
                      child: Text(
                        'ฝาก',
                        style: TextStyle(fontSize: 30),
                      ),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.amber,
                      ),
                      onPressed: () {
                        setState(() {
                          if (0 <= double.parse(Amount.text)) {
                            Balance = Balance + double.parse(Amount.text);
                          }
                        });
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class InputDecoratorExample extends StatefulWidget {
  const InputDecoratorExample({Key? key}) : super(key: key);

  @override
  State<InputDecoratorExample> createState() => _InputDecoratorExampleState();
}

TextEditingController Amount = TextEditingController();

class _InputDecoratorExampleState extends State<InputDecoratorExample> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Amount,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Enter Your Number',
        labelStyle:
            MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
          final Color color = states.contains(MaterialState.error)
              ? Theme.of(context).errorColor
              : Colors.orange;
          return TextStyle(color: color, letterSpacing: 1.3);
        }),
      ),
      autovalidateMode: AutovalidateMode.always,
    );
  }
}
