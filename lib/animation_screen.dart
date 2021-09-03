import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  _AnimatedScreenState createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
      
          Colors.blue.shade300,
          Colors.blue.shade200,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  AnimateCloud(
                    beginOffset:Offset(-1, 0) ,
                    endOffset: Offset(3.2, 0),
                    speed: 10,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  AnimateCloud(
                    beginOffset: Offset(3.2, 0),
                    endOffset: Offset(-1, 0),
                    speed: 7,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  AnimateCloud(
                    beginOffset:Offset(-1, 0) ,
                    endOffset: Offset(3.2, 0),
                    speed: 16,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AnimateCloud(
                    beginOffset: Offset(-1, 0),
                    endOffset: Offset(3.2, 0),
                    speed: 10,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  AnimateCloud(
                    beginOffset:Offset(3.2, 0) ,
                    endOffset:Offset(-1, 0) ,
                    speed: 13,
                  ),
                ],
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.36),
                    Container(
                      width: 180,
                      height: 180,
                      decoration:BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: Center(child: Text('Challenge\n❤',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lobster(fontSize: 25 )
                      )
                      
                      )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimateCloud extends StatefulWidget {
  const AnimateCloud({required this.speed,required this.beginOffset,required this.endOffset});
  final int speed;
  final Offset beginOffset;
  final Offset endOffset;
  

  @override
  _AnimateCloudState createState() => _AnimateCloudState(speed , beginOffset, endOffset);
}

class _AnimateCloudState extends State<AnimateCloud>
    with SingleTickerProviderStateMixin {
  final int speed;
  final Offset beginOffset;
  final Offset endOffset;
  _AnimateCloudState(this.speed, this.beginOffset, this.endOffset);

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: speed))
        ..repeat();
  late Animation<Offset> _animation =
      Tween(begin: beginOffset, end: endOffset).animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        'images/cloud.png',
        width: 110,
        height: 110,
      ),
    );
  }
}
