import 'package:flutter/material.dart';

const colorGrey = Color.fromRGBO(138, 134, 134, 1);
const colorBlue = Color.fromRGBO(192, 227, 245, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);

Widget ScreenBackground(context) {
  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: colorBlue.withOpacity(0.1), // Light blue background instead of SVG
    // You can add more styling here if needed
  );
}

InputDecoration AddInputDecoration(label) {
  return InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: colorBlue, width: 2)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: colorWhite, width: 0),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: colorBlue, width: 2)),
    labelText: label,
    labelStyle: const TextStyle(
      color: colorGrey,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    hintText: label,
    hintStyle: const TextStyle(
      color: colorBlue,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}

DecoratedBox AppDropDownStyle(child) {
  return DecoratedBox(
    decoration: BoxDecoration(
      color: colorWhite,
      border: Border.all(color: colorWhite, width: 2),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: child,
    ),
  );
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    elevation: 1,
    padding: const EdgeInsets.all(0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  );
}

Ink EleButtonChild(ButtonText) {
  return Ink(
    decoration: BoxDecoration(
      color: colorDarkBlue,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: colorWhite,
        ),
      ),
    ),
  );
}