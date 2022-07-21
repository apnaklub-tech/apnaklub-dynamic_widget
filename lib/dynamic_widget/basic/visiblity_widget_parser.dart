import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:flutter/widgets.dart';

class VisibilityWidgetParser extends NewWidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext,
      EventListener? listener) {
    String? visibleString = map['visible'] as String;
    bool visible = visibleString.parseBool() ?? true;
    Map<String, dynamic>? childMap = map['child'];
    
    Widget? child = DynamicWidgetBuilder.buildFromMap(childMap, buildContext, listener);
    
    // Assert child as not null.

    return Visibility(
      visible: visible,
      child: child ?? const SizedBox(),
    );
  }

  @override
  String get widgetName => 'Visibility';

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Visibility;
    return <String, dynamic>{
      'type': widgetName,
      'visible': realWidget.visible,
      'child': DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Visibility;
}