import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learnify/util/dataset.dart';
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
        child: FutureBuilder<QuerySnapshot>(
            future: DataSet.getDataByID(datasetDoc),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                    return ListTile(
                      leading: const Icon(Icons.list),
                      trailing: Text(
                        document.id,
                        style: const TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(data['key']),
                      subtitle: Text(data['value']),
                    );
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
