class Category {
  String? collectionId;
  String? id;
  String? thumbnail;
  String? title;
  String? color;
  String? icon;
//http://127.0.0.1:8090/api/files/COLLECTION_ID_OR_NAME/RECORD_ID/FILENAME
  Category(this.collectionId, this.id, this.thumbnail, this.title, this.color,
      this.icon);

  factory Category.fromMapJson(Map<String, dynamic> jsonObject) {
    return Category(
        jsonObject['collectionId'],
        jsonObject['id'],
        'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['thumbnail']}',
        jsonObject['title'],
        jsonObject['color'],
         'http://startflutter.ir/api/files/${jsonObject['collectionId']}/${jsonObject['id']}/${jsonObject['icon']}',
    );
  }
}
