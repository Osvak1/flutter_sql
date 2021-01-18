import 'package:flutter_smart_home_ui/model/employee_model.dart';
import 'package:flutter_smart_home_ui/providers/db_provider.dart';
import 'package:dio/dio.dart';

class EmployeeApiProvider {
  Future<List<Videojocs>> getAllVideojocs() async {
    var url = "https://demo1509672.mockable.io/videojocs";
    Response response = await Dio().get(url);

    return (response.data as List).map((videojocs) {
      print('Inserting $videojocs');
      DBProvider.db.createVideojocs(Videojocs.fromJson(videojocs));
    }).toList();
  }
}
