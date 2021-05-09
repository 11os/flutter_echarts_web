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
              option: {
                'title': {'text': 'ECharts 入门示例'},
                'tooltip': {'trigger': 'item'},
                'legend': {
                  'orient': 'vertical',
                  'left': 'left',
                },
                'series': [
                  {
                    'name': '访问来源',
                    'type': 'pie',
                    'radius': '50%',
                    'data': [
                      {'value': 1, 'name': '搜索引擎'},
                      {'value': 1, 'name': '直接访问'},
                      {'value': 1, 'name': '邮件营销'},
                      {'value': 1, 'name': '联盟广告'},
                      {'value': 1, 'name': '直接访问'},
                      {'value': 300, 'name': '视频广告'},
                      {'value': 300, 'name': '视频广告2'},
                      {'value': 300, 'name': '视频广告3'},
                    ],
                    'emphasis': {
                      'itemStyle': {
                        'shadowBlur': 10,
                        'shadowOffsetX': 0,
                        'shadowColor': 'rgba(0, 0, 0, 0.5)'
                      }
                    }
                  }
                ]
              },
            ),
          ],
        ),
      ),
    );
  }
}
