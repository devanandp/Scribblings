class CardPostModel {
  bool cardStatus;
  String cardId;
  String userId;
  String title;
  String tags;
  String country;
  String state;
  String city;
  String latitude;
  String longitude;
  String description;
  DateTime postdate;

  CardPostModel(
      {this.cardStatus,
      this.cardId,
      this.userId,
      this.title,
      this.tags,
      this.country,
      this.state,
      this.city,
      this.latitude,
      this.longitude,
      this.description,
      this.postdate});

  CardPostModel.fromJson(Map<String, dynamic> json) {
    cardStatus = json['cardStatus'];
    cardId = json['cardId'];
    userId = json['userId'];
    title = json['title'];
    tags = json['tags'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    postdate = json['postdate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cardStatus'] = cardStatus;
    data['cardId'] = cardId;
    data['userId'] = userId;
    data['title'] = title;
    data['tags'] = tags;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['description'] = description;
    data['postdate'] = postdate;
    return data;
  }

  static CardPostModel hardcordedPost = CardPostModel(
      cardStatus: true,
      cardId: '1',
      userId: '1',
      description:
          'Your constant hardwork and perseverance will sure lead to success no matter whatever happens!',
      country: 'India',
      city: 'Kaual',
      state: 'Hawaii',
      tags: '#cotton #everydaycasals #officewears',
      postdate: DateTime.now(),
      latitude: '12.2',
      longitude: '14.4',
      title: 'Uraban Dhara');
}
