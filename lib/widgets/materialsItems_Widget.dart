import 'package:Lument/models/DatabaseService.dart';
import 'package:Lument/models/materialData.dart';
import 'package:Lument/widgets/materialList_widgets.dart';
import 'package:Lument/widgets/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaterialsItemsWidgets extends StatefulWidget {
  final String classId;
  MaterialsItemsWidgets({@required this.classId});
  @override
  _MaterialsItemsWidgetsState createState() => _MaterialsItemsWidgetsState();
}

class _MaterialsItemsWidgetsState extends State<MaterialsItemsWidgets> {
  Stream materialDataStream;
  DatabaseService databaseService = new DatabaseService();

  @override
  void initState() {
    databaseService.getMaterialData(widget.classId).then((value) {
      materialDataStream = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final materialData = Provider.of<List<MaterialData>>(context) ?? [];
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
        top: 32.0,
        right: 32.0,
        bottom: 32.0,
        left: 32.0,
      ),
      decoration: BoxDecoration(
        color: background98,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
      ),
      child: Column(
        children: [
          Container(
            height: 500.0,
            child: StreamBuilder(
              stream: materialDataStream,
              builder: (context, snapshot) {
                return snapshot.data == null
                    ? Container()
                    : ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          final materialSnaps =
                              snapshot.data.documents[index].data;
                          return MaterialListWidgets(
                            classId: materialSnaps['classId'],
                            creatorName: materialSnaps['creatorName'],
                            materialDescription:
                                materialSnaps['materialDescription'],
                            materialId: materialSnaps['materialId'],
                            materialLink: materialSnaps['materialLink'],
                            materialTitle: materialSnaps['materialTitle'],
                            numberOfMaterials: snapshot.data.documents.length,
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
