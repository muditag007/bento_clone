// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:bento/test.dart';
import 'package:bento/tile.dart';
import 'package:bento/tile_diff.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reorderable_grid/reorderable_grid.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List items = List<int>.generate(4, (index) => index);
  // List items = [];

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      final item = items.removeAt(oldIndex);
      items.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 100,
                ),
                child: Container(
                  // height: 500,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 60,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.network(
                            "https://lh3.googleusercontent.com/-bOEvKN08Tg0IPfIAo5pK7Jkw727hAGgySGDYR1U2Nqmsn0s8djPE9maQuJZWqLJS-aWyL2LyxeH0Po=w544-h544-l90-rj",
                            height: 200.0,
                            width: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Mudit Agrawal",
                            maxLines: 2,
                            style: GoogleFonts.poppins(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Hey I am new here!!!",
                          maxLines: 4,
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: ReorderableGridView.extent(
                  maxCrossAxisExtent: 220,
                  shrinkWrap: true,
                  onReorder: _onReorder,
                  childAspectRatio: 1,
                  children: items.map((item) {
                    if (item < items.length - 4) {
                      return Padding(
                        key: ValueKey(item),
                        padding: const EdgeInsets.all(10.0),
                        child: Tile(),
                      );
                    } else {
                      return Padding(
                        key: ValueKey(item),
                        padding: const EdgeInsets.all(10.0),
                        child: DottedBorder(
                          dashPattern: [ 6, 4, 10, 4],
                          color: const Color.fromARGB(97, 158, 158, 158),
                          borderType: BorderType.RRect,
                          padding: EdgeInsets.all(1),
                          radius: Radius.circular(23),
                          borderPadding: EdgeInsets.all(0),
                          child: InkWell(
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                items.add(items.length);
                              });
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Add New",
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(23),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
