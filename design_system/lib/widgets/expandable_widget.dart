import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ExpandableWidget extends StatefulWidget {
  final Widget expanded;
  final Widget collapsed;
  final Widget? header;
  final bool? hasIcon;
  final bool? tapHeaderToExpand;

  const ExpandableWidget({
    super.key,
    this.header,
    required this.collapsed,
    required this.expanded,
    this.hasIcon = true,
    this.tapHeaderToExpand = true,
  });

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  late final controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.toggle(),
      child: ExpandablePanel(
        controller: controller,
        header: widget.header,
        collapsed: widget.collapsed,
        expanded: widget.expanded,
      ),
    );
  }
}
