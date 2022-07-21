import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/utils/event_listener.dart';
import 'package:dynamic_widget/dynamic_widget/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../widget_parser.dart';

class ScaffoldWidgetParser extends WidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    // TODO: implement assertionChecks
  }


  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext, int id) {
    var realWidget = widget as Scaffold;

    return <String, dynamic>{ "id":id,
      "type": widgetName,
      "body": DynamicWidgetBuilder.export(realWidget.body, buildContext),
      "appBar": DynamicWidgetBuilder.export(realWidget.appBar, buildContext),
      "floatingActionButton": DynamicWidgetBuilder.export(
          realWidget.floatingActionButton, buildContext),
      "backgroundColor": realWidget.backgroundColor != null
          ? realWidget.backgroundColor!.value.toRadixString(16)
          : null,
    };
  }

  @override
  Widget build(Map<String, dynamic> map, BuildContext buildContext,
      EventListener listener) {
    var scaffoldWidget = Scaffold(
      appBar: map.containsKey("appBar")
          ? DynamicWidgetBuilder.buildFromMap(
              map["appBar"], buildContext, listener) as PreferredSizeWidget?
          : null,
      body: map.containsKey("body")
          ? DynamicWidgetBuilder.buildFromMap(
              map["body"], buildContext, listener)
          : null,
      floatingActionButton: map.containsKey("floatingActionButton")
          ? DynamicWidgetBuilder.buildFromMap(
              map["floatingActionButton"], buildContext, listener)
          : null,
      backgroundColor: map.containsKey("backgroundColor")
          ? parseHexColor(map["backgroundColor"])
          : null,
    );

    return scaffoldWidget;
  }

  @override
  String get widgetName => "Scaffold";

  @override
  Type get widgetType => Scaffold;
}
