import 'package:flutter/material.dart';

class FiboSeries extends StatefulWidget {
  const FiboSeries({super.key});

  @override
  State<FiboSeries> createState() => _FiboSeriesState();
}

class _FiboSeriesState extends State<FiboSeries> {
  var value1 = TextEditingController();
  var fibon;

  @override
  void dispose() {
    value1.dispose();
    super.dispose();
  }

  int? fibonacci(int n, Map<int, int> memo) {
    if (memo.containsKey(n)) {
      return memo[n];
    }
    int result;
    if (n <= 1) {
      result = n;
    } else {
      result = fibonacci(n - 1, memo)! + fibonacci(n - 2, memo)!;
    }
    memo[n] = result;
    return result;
  }

  void _calculateFibonacci() {
    setState(() {
      int n = int.tryParse(value1.text) ?? 0;
      Map<int, int> memo = {};
      fibon = fibonacci(n, memo)!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fibonacci Series"),
        backgroundColor: Colors.black,
        leading: Icon(Icons.menu),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter the Number",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: value1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter position in Fibonacci Series",
                  labelStyle: TextStyle(color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.black))),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: _calculateFibonacci,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey, fixedSize: Size(110, 20)),
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            fibon != null
                ? Text(
                    'Fibonacci value: $fibon',
                    style: TextStyle(color: Colors.white),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
