class Category {
  String? collectionId;
  String? id;
  String? thumbnail;
  String? title;
  String? color;
  String? icon;

  Category(this.collectionId, this.id, this.thumbnail, this.title, this.color,
      this.icon);

  factory Category.fromMapJson(Map<String, dynamic> jsonObject) {
    return Category(
        jsonObject['collectionId'],
        jsonObject['id'],
        jsonObject['thumbnail'],
        jsonObject['title'],
        jsonObject['color'],
        jsonObject['icon']);
  }
}
