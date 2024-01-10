class TradeCenter {
  String? trade;
  String? center;
  String? cnicNo;

  TradeCenter({this.trade, this.center, this.cnicNo});

  TradeCenter.fromJson(Map<String, dynamic> json) {
    trade = json['trade'];
    center = json['center'];
    cnicNo = json['cnic_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trade'] = this.trade;
    data['center'] = this.center;
    data['cnic_no'] = this.cnicNo;
    return data;
  }
}
