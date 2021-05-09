import 'dart:html';

import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js;
import './dart_ui.dart' as ui;

@JS('echarts')
external dynamic echarts;

@JS('eval')
external dynamic eval;

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

  final String option;

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
      eval('''
        var chart = echarts.init(document.getElementById('echarts'));

        // specify chart configuration item and data
        var option = ${widget.option};

        // use configuration item and data specified to show chart
        chart.setOption(option);
      ''');
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
