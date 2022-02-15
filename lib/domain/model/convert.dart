
class ConvertResponse {
  double? result;

  ConvertResponse(
      {this.result});

  ConvertResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
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