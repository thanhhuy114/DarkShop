class SearchHistory {
  int id;
  String key;

  SearchHistory({required this.id, required this.key});

  SearchHistory.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        key = json["key"];

  Map<String, dynamic> toJson() => {"id": id, "key": key};
}
