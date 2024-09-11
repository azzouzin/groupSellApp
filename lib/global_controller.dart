import 'dart:convert';


import 'package:get/get.dart';

import 'package:flutter/services.dart' show rootBundle;


import 'package:logger/logger.dart';

import 'features/shop/models/commune.dart';
import 'features/shop/models/wilaya.dart';

class GlobalController extends GetxController {

  WilayaList wilayaList = WilayaList([]);
  Wilaya? selectedWilaya;
  CommuneList communeList = CommuneList([]);
  CommuneList allCommuneList = CommuneList([]);
  Commune? selctedCommune;

  //...

  void changeSelctedWilaya(Wilaya w) async {
    selectedWilaya = w;
    commeneSetup(selectedWilaya!.id);

    update();
  }

  void changeSelctedCommune(Commune c) async {
    selctedCommune = c;
    update();
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    var jsonFile = await rootBundle.loadString(assetsPath);
    return json.decode(jsonFile);
  }

  Future<void> commeneSetup(String id) async {
    Map<String, dynamic> dmap =
        await parseJsonFromAssets('assets/json/communes.json');
    communeList = CommuneList.fromMap(dmap);
    allCommuneList = CommuneList.fromMap(dmap);
    Logger().e(allCommuneList.communeList.length);
    id != "9999"
        ? communeList.communeList.removeWhere((element) {
            return element.wilayaId != id;
          })
        : null;
    selctedCommune = communeList.communeList.first;
  }

  Future wilayaSetup() async {
    Map<String, dynamic> dmap =
        await parseJsonFromAssets('assets/json/wilayas.json');
    wilayaList = WilayaList.fromMap(dmap);
    selectedWilaya = wilayaList.wilayaList.first;
  }

  @override
  void onInit() {
    super.onInit();
    // selctedPharmacy = pharmacyList.first;
  }

  @override
  void onReady() async {
    super.onReady();
    await wilayaSetup();
    await commeneSetup("9999");
    update();
  }
}
