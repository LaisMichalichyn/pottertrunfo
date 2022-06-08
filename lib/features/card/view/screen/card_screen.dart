import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:potter_trunfo/features/card/view/controller/card_controller.dart';

class CardScreen extends StatefulWidget {
  final String? house;

  const CardScreen({Key? key, this.house}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final _controller = Modular.get<CardController>();

  @override
  void initState() {
    _controller.getHouse(widget.house!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Color(0xFF237A00), Color(0xFF003B7A)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Observer(
          builder: (_) {
            final characters = _controller.characteresList;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 300,
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(characters[index].name!),
                        Text(characters[index].species.toString()),
                        Text(characters[index].actor!),
                        Text(characters[index].dateOfBirth!),
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
