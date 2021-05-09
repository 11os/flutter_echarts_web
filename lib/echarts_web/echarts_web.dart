import 'dart:html';

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js;
import './dart_ui.dart' as ui;

@JS('echarts')
external dynamic echarts;

dynamic mapToJsObject(Object a) {
  return js.jsify(a);
}

class EchartsWeb extends StatefulWidget {
  EchartsWeb({
    Key? key,
    required this.option,
    this.width = 600,
    this.height = 600,
    this.background = '#eee',
  }) : super(key: key);

  final Map<String, Object> option;

  final double? width;
  final double? height;
  final String background;

  @override
  State<StatefulWidget> createState() => EchartWebState();
}

class EchartWebState extends State<EchartsWeb> {
  @override
  void initState() {
    super.initState();

    ui.platformViewRegistry.registerViewFactory(
        'echarts',
        (int viewId) => DivElement()
          ..id = "echarts"
          ..style.background = widget.background
          ..style.width = '${widget.width}'
          ..style.height = '${widget.height}');

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      var myChart = echarts
          .init(document.querySelector('#echarts'), null, {'renderer': 'svg'});
      // 指定图表的配置项和数据
      var option = mapToJsObject(
        widget.option,
      );
      // 使用刚指定的配置项和数据显示图表。
      myChart.setOption(option);
      // print(myChart);
      print(option.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: HtmlElementView(
        viewType: 'echarts',
      ),
    );
  }
}
