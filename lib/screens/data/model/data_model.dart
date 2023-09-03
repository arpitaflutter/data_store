class DataModel {
  String? author, title, publishedAt, content, description;
  int? id;

  DataModel(
      {this.author,
      this.title,
      // this.publishedAt,
      this.content,
      this.description,
      this.id});

  DataModel fromJson(Map m1) {
    author = m1['author'];
    title = m1['title'];
    description = m1['description'];
    content = m1['content'];
    id = m1['id'];

    DataModel d1 = DataModel(
        id: id,
        author: author,
        content: content,
        title: title,
        description: description,
        );

    return d1;
  }
}
