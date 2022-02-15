
class RatesResponse {
  bool? success;
  int? timestamp;
  String? base;
  String? date;
  List<Rate>? rates;

  RatesResponse(
      {this.success, this.timestamp, this.base, this.date, this.rates});

  RatesResponse.fromJson(Map<String, dynamic> json) {
    rates=[];
    success = json['success'];
    timestamp = json['timestamp'];
    base = json['base'];
    date = json['date'];
    if(json['rates'] != null){
      json["rates"].entries.map((e)=> rates!.add(Rate(value: e.value.toDouble(), title: e.key))).toList();

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['timestamp'] = this.timestamp;
    data['base'] = this.base;
    data['date'] = this.date;
    if (rates != null) {
      data["rates"].fromIterable(rates, key: (e) => e.title, value: (e) => e.value);
    }
    return data;
  }
}

class Rate{
  String? title;
  double? value;
  Rate({ this.title, this.value});
}



