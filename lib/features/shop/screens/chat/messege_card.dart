import 'package:flutter/material.dart';

class MessegeCard extends StatelessWidget {
  const MessegeCard({super.key, required this.messege, this.isClient = false});
  final String messege;
  final bool isClient;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(
          left: isClient ? 40 : 8, right: isClient ? 8 : 40, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isClient
            ? Theme.of(context).primaryColor
            : Theme.of(context).secondaryHeaderColor,
      ),
      child: Text(messege),
    );
  }
}
