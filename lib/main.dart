import 'package:flutter/material.dart';
import 'package:flutter_echarts_web/echarts_web/echarts_web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EchartsWeb(
              option: '''
                {
                    title: {
                        text: 'ECharts entry example'
                    },
                    tooltip: {},
                    legend: {
                        data:['Sales']
                    },
                    xAxis: {
                        data: ["shirt","cardign","chiffon shirt","pants","heels","socks"]
                    },
                    yAxis: {},
                    series: [{
                        name: 'Sales',
                        type: 'bar',
                        data: [5, 20, 36, 10, 10, 20]
                    }]
                }
              ''',
            ),
          ],
        ),
      ),
    );
  }
}
