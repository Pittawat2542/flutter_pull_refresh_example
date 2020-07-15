import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainScreen(),
    ),
  );
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final colorForSwap1 = [Colors.red, Colors.green, Colors.blue];
  final colorForSwap2 =  [Colors.yellow, Colors.purple, Colors.orange];
  var colors;

  @override
  void initState() {
    colors = colorForSwap1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onPullToRefresh() async {
      await Future.delayed(Duration(milliseconds: 500));
      setState(() {
        if (colors[0] == colorForSwap1[0]) {
          colors = colorForSwap2;
        } else {
          colors = colorForSwap1;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Pull to Refresh Example"),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onPullToRefresh,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                color: colors[index],
                child: Center(child: Text('$index')),
              );
            },
          ),
        ),
      ),
    );
  }
}

