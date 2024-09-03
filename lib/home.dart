import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:amigaton/widgets/counter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amigaton/widgets/image_animate.dart';
import 'package:amigaton/widgets/custom_painter_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String meta = "";
  String valor = "";

  @override
  void initState() {
    _generateValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.32,
                ),
                painter: CustomPainterWidget(Colors.black12),
              ),
            ),
            Positioned(
              top: 0,
              child: CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.3,
                ),
                painter: CustomPainterWidget(const Color(0xFFeae064)),
              ),
            ),
            const Positioned(
              top: 50,
              right: 50,
              child: ColombianCoffeeWidget(),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  "AMIGATON",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                    fontFamily: "ArchivoBlack",
                    color: Color(0xFF3c6ba5),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Meta:",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "ArchivoBlack",
                      ),
                    ),
                    Text(
                      meta,
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w900,
                        fontFamily: "ArchivoBlack",
                      ),
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Conteo:",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "ArchivoBlack",
                      ),
                    ),
                    Text(
                      valor,
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.w900,
                        fontFamily: "ArchivoBlack",
                      ),
                    )
                  ],
                ),
                CountdownTimerPage()
              ],
            )
          ],
        ),
      ),
    );
  }

  _generateValue() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    final res = db.collection("precio").doc("jVDRNq3C0MzurANpV2Ff").snapshots();
    res.listen((data) {
      setState(() {
        meta = data.data()!["meta"];
        valor = data.data()!["valor"];
      });
    });
  }
}
