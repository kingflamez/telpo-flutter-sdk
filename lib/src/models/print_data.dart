/// [Enum] representing printable element type.
enum _PrintDataType { byte, text, space, columns }

/// Plain Old Dart Object representing printing data.
///
/// Types: [PrintData.text], [PrintData.byte], [PrintData.space], [PrintData.columns]
class PrintData {
  final dynamic _data;
  final double? _width;
  final double? _height;
  final PrintAlignment? _alignment;
  final int? _fontSize;
  final bool? _isBold;
  final int? _gray;
  final List<String>? _columnsText;
  final List<int>? _columnsWidth;
  final List<int>? _columnsAlignment;
  final int? _columnsTextSize;

  final _PrintDataType _type;

  const PrintData._(
    this._type,
    this._data, [
    this._width,
    this._height,
    this._alignment,
    this._fontSize,
    this._isBold,
    this._gray,
    this._columnsText,
    this._columnsWidth,
    this._columnsAlignment,
    this._columnsTextSize,
  ]);

  factory PrintData.text(
    String text, {
    PrintAlignment? alignment,
    int? fontSize,
    bool isBold = false,
    int? gray,
  }) {
    return PrintData._(
      _PrintDataType.text,
      text,
      null,
      null,
      alignment,
      _clampFontSize(fontSize),
      isBold,
      _clampGray(gray),
    );
  }

  factory PrintData.columns({
    required List<String> columnsText,
    required List<int> columnsWidth,
    required List<int> columnsAlignment,
    required int columnsTextSize,
    bool isBold = false,
    int? gray,
  }) {
    return PrintData._(
      _PrintDataType.columns,
      null,
      null,
      null,
      null,
      isBold,
      _clampGray(gray),
      columnsText,
      columnsWidth,
      columnsAlignment,
      columnsTextSize,
    );
  }

  factory PrintData.space({required int line}) {
    return PrintData._(_PrintDataType.space, line);
  }

  static int? _clampFontSize(int? fontSize) {
    if (fontSize == null) return null;
    return fontSize.clamp(8, 64);
  }

  static int? _clampGray(int? gray) {
    if (gray == null) return null;
    return gray.clamp(0, 12);
  }

  Map<String, dynamic> toJson() {
    return {
      "data": _data,
      "width": _width,
      "height": _height,
      "alignment": _alignment?.name,
      "type": _type.name,
      "fontSize": _fontSize,
      "isBold": _isBold,
      "gray": _gray,
      "columnsText": _columnsText,
      "columnsWidth": _columnsWidth,
      "columnsAlignment": _columnsAlignment,
      "columnsTextSize": _columnsTextSize,
    };
  }

  @override
  String toString() {
    return '''PrintData(
      data: $_data,
      width: $_width,
      height: $_height,
      alignment: $_alignment,
      type: $_type,
      fontSize: $_fontSize,
      isBold: $_isBold,
      gray: $_gray,
      columnsText: $_columnsText,
      columnsWidth: $_columnsWidth,
      columnsAlignment: $_columnsAlignment,
      columnsTextSize: $_columnsTextSize,
    )''';
  }
}
