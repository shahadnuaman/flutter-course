class Weather {
  String? cityName;
  double? temp;
  String? lastUpdate;
  String? Icon;
  String? IconText;

  Weather(
      {this.cityName, this.temp, this.lastUpdate, this.Icon, this.IconText});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['location']['name'];
    temp = json['current']['temp_c'];
    lastUpdate = json['current']['last_updated'];
    IconText = json['current']['condition']['text'];
    Icon = json['current']['condition']['icon'];
  }
}
