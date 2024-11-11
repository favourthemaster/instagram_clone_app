import 'package:flutter/material.dart';

class ReloadableWidget extends StatefulWidget {
  final List<Widget> children;
  const ReloadableWidget({super.key, required this.children});

  @override
  State<ReloadableWidget> createState() => _ReloadableWidgetState();
}

class _ReloadableWidgetState extends State<ReloadableWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [...widget.children],
          )
        ],
      ),
    );
  }
}
