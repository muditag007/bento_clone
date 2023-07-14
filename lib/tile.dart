// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, avoid_unnecessary_containers

import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Tile extends StatefulWidget {
  const Tile({super.key});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  final items = ['LinkedIn', 'Instagram', 'YouTube', 'GitHub'];
  String selectedValue = 'LinkedIn';
  final links = {
    'LinkedIn': 'https://www.linkedin.com/in/',
    'YouTube': 'https://www.youtube.com/@',
    'Instagram': 'https://www.instagram.com/',
    'GitHub': 'https://github.com/',
  };
  FlipCardController _control = FlipCardController();
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      controller: _control,
      back: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (!await launchUrl(
            Uri.parse(links[selectedValue]!+_controller.text),
          )) {
            throw Exception('Could not launch');
          }
        },
        child: Container(
          height: 173.0,
          width: 173.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(97, 158, 158, 158),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.5, 0.5),
                color: Color.fromARGB(67, 158, 158, 158),
                // blurRadius: 0.5,
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(23),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Center(
                  child: Text(
                    selectedValue,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Center(
                  child: Text(
                    _controller.text,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      front: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: Container(
          height: 173.0,
          width: 173.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color.fromARGB(97, 158, 158, 158),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0.5, 0.5),
                color: Color.fromARGB(67, 158, 158, 158),
                // blurRadius: 0.5,
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.circular(23),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton<String>(
                  value: selectedValue,
                  onChanged: (String? newValue) => setState(
                    () => selectedValue = newValue.toString(),
                  ),
                  items: items
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 20,
                  underline: SizedBox(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  height: 30,
                  child: TextField(
                    controller: _controller,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                    ),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Color.fromARGB(97, 158, 158, 158),
                      ),
                      hintText: 'Enter username',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(97, 158, 158, 158),
                            width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(97, 158, 158, 158),
                            width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_controller.text != "") {
                    setState(() {
                      _control.toggleCard();
                    });
                  }
                },
                child: Container(
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                    child: Center(
                      child: Text(
                        "Confirm",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
