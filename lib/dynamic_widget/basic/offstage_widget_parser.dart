import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/cupertino.dart';

import '../../widget_parser.dart';

class OffstageWidgetParser extends WidgetParser {
  @override
  void assertionChecks(Map<String, dynamic> map) {
    // TODO: implement assertionChecks
  }

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext, String id) {
    Offstage realWidget = widget as Offstage;
    return <String, dynamic>{ "id":id,
      "type": widgetName,
      "offstage": realWidget.offstage,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext, id)
    };
  }

  @override
  Widget build(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    return Offstage(
      offstage: map.containsKey("offstage") ? map['offstage'] : true,
      child: DynamicWidgetBuilder.buildFromMap(
          map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Offstage";

  @override
  Type get widgetType => Offstage;
}
