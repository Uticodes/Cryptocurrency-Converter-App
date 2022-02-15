class SymbolsResponse {
  bool? success;
  List<Symbol>? symbols;

  SymbolsResponse(
      {this.success, this.symbols});

  SymbolsResponse.fromJson(Map<String, dynamic> json) {
    symbols=[];
    success = json['success'];
    if(json['symbols'] != null){
      json["symbols"].entries.map((e)=> symbols!.add(Symbol(name: e.value.toString(), symbol: e.key))).toList();

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (symbols != null) {
      data["rates"].fromIterable(symbols, key: (e) => e.symbol, value: (e) => e.name);
    }
    return data;
  }
}

class Symbol{
  String? symbol;
  String? name;
  Symbol({ this.symbol, this.name});
}