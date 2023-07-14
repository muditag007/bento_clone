// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TileDiff extends StatefulWidget {
  const TileDiff({super.key});

  @override
  State<TileDiff> createState() => _TileDiffState();
}

class _TileDiffState extends State<TileDiff> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {},
        onHover: (value) {
          if (value) {
            setState(() {
              visible = true;
            });
          } else {
            setState(() {
              visible = false;
            });
          }
        },
        child: AnimatedContainer(
          height: 100,
          duration: Duration(seconds: 1),
          child: Stack(
            children: [
              AnimatedContainer(
                height: 100.0,
                width: 173.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 2),
                      color: Color.fromARGB(67, 158, 158, 158),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.circular(23),
                ),
                duration: Duration(seconds: 1),
                child: const Center(
                  child: Text('Draggable'),
                ),
              ),
              if (visible)
                Positioned(
                  bottom: 0,
                  left: 6.5,
                  child: Container(
                    height: 30,
                    width: 160,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          iconSize: 10,
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          iconSize: 10,
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          iconSize: 10,
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          iconSize: 10,
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
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
