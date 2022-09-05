import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';



void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(primary: const Color.fromRGBO(120, 132, 241, 1)),
      ),
      debugShowCheckedModeBanner: false, //hide debug banner
      home: Donut()
  ));
}


enum ColorStyle {
  style1,
  style2,
  style3,
  style4,
  style5,
  style6,
  style7,
  style8,
  style9
}
class Donut extends StatefulWidget {
  @override

  State<Donut> createState() => _DonutState();
}
class _DonutState extends State<Donut> with TickerProviderStateMixin {
  final audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      donutFunction();
    });
    _ticker.stop();
    audioPlayer.setAsset('assets/soundmusic.mp3');
    audioPlayer.setLoopMode(LoopMode.one);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _myAnimation =
        CurvedAnimation(curve: Curves.decelerate, parent: _controller);
  }

  @override
  late Animation<double> _myAnimation;
  late AnimationController _controller;
  late final Ticker _ticker;
  late int k;
  double A = 0, B = 0;
  Color background = Colors.black;
  Color front = Color.fromRGBO(252, 220, 207, 1);
  ColorStyle currentStyle = ColorStyle.style1;
  List<dynamic> b = List.generate(1761, (index) => ' ');
  List<double> z = (List.generate(1761, (index) => 0));
  String value = '';
  @override
  Widget build(BuildContext context) {

    value = "";

    for (var k = 0; k < 1761; k++) {
      value = value + ((k % 80) > 0 ? b[k] : '\n').toString();
    }
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Donut spin',
          style: GoogleFonts.robotoMono().copyWith(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            InteractiveViewer(
              child: RotatedBox(
                quarterTurns: 1,
                child: FittedBox(
                  child: Text(
                    value,
                    style: GoogleFonts.robotoMono().copyWith(
                      color: front,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: front,
            onPressed: () {
              switch (currentStyle) {
                case ColorStyle.style1:
                  {
                    currentStyle = ColorStyle.style2;
                    background = Colors.black;
                    front = Color.fromRGBO(255, 180, 187, 1);
                  }
                  break;
                case ColorStyle.style2:
                  {
                    currentStyle = ColorStyle.style3;
                    background = Colors.black;
                    front = Color.fromRGBO(255, 224, 186, 1);
                  }
                  break;
                case ColorStyle.style3:
                  {
                    currentStyle = ColorStyle.style4;
                    background = Colors.black;
                    front = Color.fromRGBO(255, 254, 187, 1);
                  }
                  break;
                case ColorStyle.style4:
                  {
                    currentStyle = ColorStyle.style5;
                    background = Colors.black;
                    front = Color.fromRGBO(186, 255, 201, 1);
                  }
                  break;
                case ColorStyle.style5:
                  {
                    currentStyle = ColorStyle.style1;
                    background = Colors.black;
                    front = Color.fromRGBO(186, 225, 255, 1);
                  }
                  break;
                case ColorStyle.style6:
                  {
                    currentStyle = ColorStyle.style1;
                    background = Colors.black;
                    front = Color.fromRGBO(243, 187, 174, 1);
                  }
                  break;
                case ColorStyle.style7:
                  {
                    currentStyle = ColorStyle.style1;
                    background = Colors.black;
                    front = Color.fromRGBO(237, 234, 229, 1);
                  }
                  break;
                case ColorStyle.style8:
                  {
                    currentStyle = ColorStyle.style1;
                    background = Colors.black;
                    front = Color.fromRGBO(174, 223, 219, 1);
                  }
                  break;
                case ColorStyle.style9:
                  {
                    currentStyle = ColorStyle.style1;
                    background = Colors.black;
                    front = Color.fromRGBO(117, 200, 204, 1);
                  }
                  break;
                default:
              }
              setState(() {});
            },
            child: Icon(
              Icons.change_circle,
              color: background,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: front,
            onPressed: () async {
              if (_ticker.isActive) {
                audioPlayer.pause();
                _ticker.stop();
                _controller.forward();
              } else {
                audioPlayer.play();
                _ticker.start();
                _controller.reverse();
              }
            },
            child: AnimatedIcon(
              color: background,
              progress: _myAnimation,
              icon: AnimatedIcons.play_pause,
            ),
          ),
        ],
      ),
    );
  }
  donutFunction() async {
    double i, j;
    b = List.generate(1760, (index) => ' ');
    z = List.generate(1760, (index) => 0);
    for (j = 0; 6.28 > j; j += 0.07) {
      for (i = 0; 6.28 > i; i += 0.02) {
        double c = math.sin(i),
            d = math.cos(j),
            e = math.sin(A),
            f = math.sin(j),
            g = math.cos(A),
            h = d + 2,
            D = 1 / (c * h * e + f * g + 5),
            l = math.cos(i),
            m = math.cos(B),
            n = math.sin(B),
            t = c * h * g - f * e;
        int x = (40 + 30 * D * (l * h * m - t * n)).toInt(),
            y = (12 + 15 * D * (l * h * n + t * m)).toInt(),
            o = x + 80 * y,
            N = (8 * ((f * e - c * d * g) * m - c * d * e - f * g - l * d * n))
                .toInt();
        if (22 > y && y > 0 && x > 0 && 80 > x && D > z[o]) {
          z[o] = D;
          b[o] = [
            '.',
            ',',
            '-',
            '~',
            ':',
            ';',
            '=',
            '!',
            '*',
            '#',
            '\$',
            '@'
          ][math.max(N, 0)];
        }
      }
    }
    A += 0.04;
    B += 0.02;
    setState(() {});
  }
}