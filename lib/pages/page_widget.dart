import 'package:flutter/material.dart';

abstract class PageWidget extends StatefulWidget implements TitleProtocol {
}

abstract class TitleProtocol {
  String get title;
}