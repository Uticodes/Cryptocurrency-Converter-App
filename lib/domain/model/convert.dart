
class ConvertResponse {
  bool? success;
  Query? query;
  Info? info;
  String? date;
  double? result;

  ConvertResponse(
      {this.success, this.query, this.info, this.date, this.result});

  ConvertResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    query = json['query'];
    info = json['info'];
    date = json['date'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['query'] = this.query;
    data['info'] = this.info;
    data['date'] = this.date;
    // if (result != null) {
    //   network['result'] = result?.toJson();
    // }
    data['result'].fromIterable(result, key: (e) => e.result,);
    return data;
  }
}

class Query{
  String? from;
  String? to;
  int? amount;
  Query({ this.from, this.to, this.amount});
}

class Info{
  int? timestamp;
  double? rate;
  Info({ this.timestamp, this.rate});
}

class Result{
  double? result;
  Result({ this.result});
}

class ResultData {
  double? result;

  ResultData({
    this.result,
  });

  ResultData.fromJson(dynamic json) {
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['result'] = result;
    return map;
  }

}

class User {
  final bool success;
  final double result;

  User(this.success, this.result);

  User.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        result = json['result'];

  Map<String, dynamic> toJson() => {
    'success': success,
    'result': result,
  };
}