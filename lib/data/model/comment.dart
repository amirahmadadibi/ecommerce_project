class Comment {
  String id;
  String text;
  String productId;
  String userId;

  Comment(this.id, this.text, this.productId, this.userId);

  factory Comment.fromMapJson(Map<String, dynamic> jsonObject) {
    return Comment(
      jsonObject['id'],
      jsonObject['text'],
      jsonObject['product_id'],
      jsonObject['user_id'],
    );
  }
}
