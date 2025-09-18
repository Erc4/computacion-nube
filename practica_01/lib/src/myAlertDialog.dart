import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, String msg, String titulo, String botonOk, String botonCancelar){
  Widget btnCancelar =
    ElevatedButton(onPressed: () {}, child: Text(botonCancelar));

    Widget btnOk =
    ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(botonOk)
    );
    AlertDialog alert = AlertDialog(
      title: Text(titulo),
      content: Text(msg),
      actions: [
        btnCancelar,
        btnOk,
      ],
    );

    showDialog(context: context, 
    builder:(BuildContext content){
      return alert;
    },
  );
}