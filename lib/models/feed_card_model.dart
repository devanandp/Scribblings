class FeedCardModel {
  int id;
  String name;
  String poem;
  String createdAt;
  String description;
  String updatedAt;

  FeedCardModel(
      {this.id,
        this.name,
        this.poem,
        this.createdAt,
        this.description,
        this.updatedAt});

  FeedCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    poem = json['poem'];
    createdAt = json['createdAt'];
    description = json['description'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['poem'] = this.poem;
    data['createdAt'] = this.createdAt;
    data['description'] = this.description;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
