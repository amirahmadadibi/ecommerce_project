class Banner {
  String? id;
  String? collectionId;
  String? thumbnail;
  String? categoryId;

  Banner(this.id, this.collectionId, this.thumbnail, this.categoryId);

  factory Banner.fromJson(Map<String, dynamic> jsonObject) {
    return Banner(
      jsonObject['id'],
      jsonObject['collectionId'],
      'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
      jsonObject['categoryId'],
    );
  }
}
