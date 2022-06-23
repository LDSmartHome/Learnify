import 'package:flutter/material.dart';
import 'package:learnify/widget/menu.dart';

class ViewDataset extends StatefulWidget {
  const ViewDataset({Key? key}) : super(key: key);

  @override
  State<ViewDataset> createState() => _ViewDatasetState();
}

class _ViewDatasetState extends State<ViewDataset> {
  @override
  Widget build(BuildContext context) {
    final datasetDoc = ModalRoute.of(context)!.settings.arguments as String;

    return MenuWidget(
      title: "View",
      body: Center(
        child: Text(datasetDoc),
      ),
    );
  }
}
