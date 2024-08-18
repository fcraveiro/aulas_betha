import 'package:flutter/material.dart';

typedef SizerFractionBuilder = Widget Function(Sizer);

class MediaQuerySize {
  late Size size;
  late EdgeInsets padding;
  static MediaQuerySize? _instance;
  MediaQuerySize._();
  factory MediaQuerySize(BuildContext context) {
    if (_instance == null) {
      _instance = MediaQuerySize._();
      _instance!.calculateSizes(context);
    }
    return _instance!;
  }

  calculateSizes(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    size = media.size;
    padding = media.padding;
  }
}

class Sizer {
  static double _safeHeight = 0;
  static double _safeWidth = 0;
  static double _paddingTop = 0;
  static double _paddingBottom = 0;

  final double? _height;
  final double? _width;

  double get paddingTop => _paddingTop;
  double get paddingBottom => _paddingBottom;
  bool get isVertical => _safeHeight > _safeWidth;
  bool get isEmpty => _height == null && _width == null;

  const Sizer(this._height, this._width);

  factory Sizer.of(BuildContext context) {
    calculateSize(context);
    Sizer sizer = Sizer(_safeHeight, _safeWidth);
    return sizer;
  }

  static calculateSize(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);
    _safeHeight = media.size.height - media.padding.top - media.padding.bottom;
    _safeWidth = media.size.width;
    _paddingTop = media.padding.top;
    _paddingBottom = media.padding.bottom;
  }

  double height(double percentage) {
    double height = _height ?? _safeHeight;
    return height * (percentage / 100);
  }

  double width(double percentage) {
    double width = _width ?? _safeWidth;
    return width * (percentage / 100);
  }

  double fontSize(double percentage) {
    return width(percentage) / (width(30) / height(100));
  }

  double min(double percentageHeight, double percentageWidth) {
    double h = height(percentageHeight);
    double w = width(percentageWidth);
    return h < w ? h : w;
  }

  double max(double percentageHeight, double percentageWidth) {
    double h = height(percentageHeight);
    double w = width(percentageWidth);
    return h > w ? h : w;
  }

  double screenHeight(double percentage) {
    return (_safeHeight + paddingTop + paddingBottom) * (percentage / 100);
  }

  double screenWidth(double percentage) {
    return _safeWidth * (percentage / 100);
  }

  double safeHeight(double percentage) {
    return _safeHeight * (percentage / 100);
  }

  Sizer fraction({double? height, double? width}) {
    return Sizer(this.height(height ?? 100), this.width(width ?? 100));
  }
}

class PercentageSizer extends Sizer {
  const PercentageSizer(super.height, super.width);
  @override
  double height(double percentage) {
    double height = _height == null
        ? Sizer._safeHeight
        : Sizer._safeHeight * (_height / 100);
    return height * (percentage / 100);
  }

  @override
  double width(double percentage) {
    double width =
        _width == null ? Sizer._safeWidth : Sizer._safeWidth * (_width / 100);
    return width * (percentage / 100);
  }
}
