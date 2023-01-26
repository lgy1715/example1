class FeedModel {
  int? id;
  String? title;
  int? user_id;
  String? contents;
  String? board_type;
  DateTime? createdAt;

  FeedModel.parse(Map m) {
    id = m['id'];
    contents = m['contents'];
    createdAt = DateTime.parse(m['create_at']);
    title = m['title'];
    user_id = m['user_id'];
    board_type = m['board_type'];
  }
}