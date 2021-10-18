import 'package:flutter/material.dart';
import 'package:flutter_mask/model/store.dart';
import 'package:flutter_mask/ui/widget/remain_stat_listtile.dart';
import 'package:flutter_mask/viewmodel/store_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('마스크 재고 있는 곳 : ${storeModel.stores.length}'),
          actions: [
            IconButton(
                onPressed: () {
                  storeModel.fetch();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: storeModel.isLoading == true
            ? loadingWidget()
            : ListView(
                children: storeModel.stores.map((e) {
                  return ListTile(
                    title: Text(e.name ?? ""),
                    subtitle: Text(e.addr ?? ""),
                    trailing: RemainStatListTIle(e),
                  );
                }).toList(),
              ));
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는중'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
