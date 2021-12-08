import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget errorMessageBox(message) {
  return Container(
    decoration: const BoxDecoration(
      color: Color.fromRGBO(255, 236, 237, 1.0),
    ),
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.error_outline, color: Colors.redAccent),
        Flexible(
            child: Text(
              message,
              style: const TextStyle(color: Color.fromRGBO(136, 0, 27, 1.0)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
      ],
    ),
  );
}