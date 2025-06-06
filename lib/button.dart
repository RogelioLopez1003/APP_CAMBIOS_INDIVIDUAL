import 'package:flutter/material.dart';

class OutlinedButtonExample extends StatefulWidget {
  const OutlinedButtonExample(this.text, this.action, this.selectedIcon, {super.key});
  
  final void Function() action;
  final String text;
  final Icon selectedIcon;

  @override
  State<OutlinedButtonExample> createState() => _OutlinedButtonExampleState();
}

class _OutlinedButtonExampleState extends State<OutlinedButtonExample> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = OutlinedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 17),
        shape: const BeveledRectangleBorder(),
        side: const BorderSide(width: 1.5, color: Colors.greenAccent), // Se aumento el grosor y cambio el color del borde del botón
        foregroundColor: Colors.white);

    return Center(
      child: Column(
        children: <Widget>[
          OutlinedButton.icon(
            style: style,
            onPressed: widget.action,
            label: Text(widget.text),
            icon: widget.selectedIcon,
          ),
        ],
      ),
    );
  }
}
