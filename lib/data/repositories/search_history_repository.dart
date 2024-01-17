import 'dart:convert';
import 'dart:io';

import 'package:darkshop/data/models/search_history.dart';
import 'package:path_provider/path_provider.dart';

class SearchHistoryRepository {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //setting
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/search_histories.json');
  }

  Future<String> getStringJson() async {
    File file = await _localFile;
    String jsonString = await file.readAsString();

    return jsonString;
  }

  Future<List<Map<String, dynamic>>> getListMap() async {
    String json = await getStringJson();

    List<Map<String, dynamic>> list =
        jsonDecode(json).cast<Map<String, dynamic>>();

    return list;
  }

  Future<List<SearchHistory>> getListSearchHistories() async {
    List<Map<String, dynamic>> listMap = await getListMap();
    List<SearchHistory> results = [];

    try {
      results = listMap.map((map) => SearchHistory.fromJson(map)).toList();
      return results;
    } catch (e) {
      print(e);
      return results;
    }
  }

  Future<void> saveSearchHistoryToFile(
      List<SearchHistory> searchHistoryList) async {
    try {
      final file = await _localFile;

      final List<Map<String, dynamic>> searchHistoryMapList = searchHistoryList
          .map((searchHistory) => searchHistory.toJson())
          .toList();

      final jsonString = json.encode(searchHistoryMapList);

      await file.writeAsString(jsonString);
    } catch (e) {
      print(e);
    }
  }
}
