import 'package:flutter/material.dart';
import './waiting_screen_view.dart';

class WaitingScreen extends StatefulWidget {
  final int id;
  final int waiting;

  const WaitingScreen({Key key, this.id, this.waiting}) : super(key: key);
  @override
  WaitingScreenView createState() => new WaitingScreenView();
}
