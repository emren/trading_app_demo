///Model class for data
class DataModel {
  ///Constructor
  DataModel({
    this.the1G,
    this.the1H,
    this.the1A,
    this.the3A,
    this.the1Y,
    this.the5Y,
    this.code,
    this.symbol,
  });

  ///List of price entries for one day
  List<PriceEntry> the1G;

  ///List of price entries for one week
  List<PriceEntry> the1H;

  ///List of price entries for one month
  List<PriceEntry> the1A;

  ///List of price entries for three months
  List<PriceEntry> the3A;

  ///List of price entries for one year
  List<PriceEntry> the1Y;

  ///List of price entries for five years
  List<PriceEntry> the5Y;

  ///Code
  String code;

  ///Market symbol
  String symbol;

  ///From json method
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        the1G: List<PriceEntry>.from(
            json["1G"].map((x) => PriceEntry.fromJson(x))),
        the1H: List<PriceEntry>.from(
            json["1H"].map((x) => PriceEntry.fromJson(x))),
        the1A: List<PriceEntry>.from(
            json["1A"].map((x) => PriceEntry.fromJson(x))),
        the3A: List<PriceEntry>.from(
            json["3A"].map((x) => PriceEntry.fromJson(x))),
        the1Y: List<PriceEntry>.from(
            json["1Y"].map((x) => PriceEntry.fromJson(x))),
        the5Y: List<PriceEntry>.from(
            json["5Y"].map((x) => PriceEntry.fromJson(x))),
        code: json["Code"],
        symbol: json["symbol"],
      );

  ///To json method
  Map<String, dynamic> toJson() => {
        "1G": List<dynamic>.from(the1G.map((x) => x.toJson())),
        "1H": List<dynamic>.from(the1H.map((x) => x.toJson())),
        "1A": List<dynamic>.from(the1A.map((x) => x.toJson())),
        "3A": List<dynamic>.from(the3A.map((x) => x.toJson())),
        "1Y": List<dynamic>.from(the1Y.map((x) => x.toJson())),
        "5Y": List<dynamic>.from(the5Y.map((x) => x.toJson())),
        "Code": code,
        "symbol": symbol,
      };
}

///Price entry class
class PriceEntry {
  ///Constructor
  PriceEntry({
    this.day,
    this.close,
    this.open,
    this.high,
    this.low,
    this.volume,
  });

  ///Day epoch
  int day;

  ///Close of the day
  double close;

  ///Open of the day
  double open;

  ///High of the day
  double high;

  ///Low of the day
  double low;

  ///Volume of the day
  int volume;

  ///From json method
  factory PriceEntry.fromJson(Map<String, dynamic> json) => PriceEntry(
        day: json["d"],
        close: json["c"] == null ? null : json["c"].toDouble(),
        open: json["o"] == null ? null : json["o"].toDouble(),
        high: json["h"] == null ? null : json["h"].toDouble(),
        low: json["l"] == null ? null : json["l"].toDouble(),
        volume: json["v"] == null ? null : json["v"],
      );

  ///To json method
  Map<String, dynamic> toJson() => {
        "d": day,
        "c": close,
        "o": open == null ? null : open,
        "h": high,
        "l": low,
        "v": volume == null ? null : volume,
      };
}
