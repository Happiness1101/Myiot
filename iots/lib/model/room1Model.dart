class room1Model {
  room1Model({
    this.temp,
    this.humi,
    this.light,
    this.date,
    this.dateTime,
  });

  room1Model.fromJson(dynamic json) {
    temp = json['temp'];
    humi = json['humidity'];
    light = json['light'];
    date = json['date'];
    dateTime = json['date_time'];
  }
  String? temp;
  String? humi;
  String? light;
  String? date;
  String? dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['humidity'] = humi;
    map['light'] = light;
    map['date'] = date;
    map['date_time'] = dateTime;
    return map;
  }
}
