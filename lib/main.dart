import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text("Notched Bottom Navigation Bar"),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 1,
            // child: Container(height: 100, color: Colors.black),
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 70),
              painter: NotchedPainter(),
            ),
          ),
        ),
        // bottomNavigationBar: CustomNotchedBottomNavigationBar(),
      ),
    );
  }
}

class NotchedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();

    double centerX = size.width / 2;
    double notchWidth = 100;
    double notchHeight = 20; // 위로 튀어나오는 높이

    // 왼쪽 상단부터 시작
    path.moveTo(0, 0);

    // 왼쪽 직선
    path.lineTo(centerX - notchWidth / 2, 0);

    path.cubicTo(
      // 첫번째 제어점
      centerX - 20,
      0,
      // 두번째 제어점
      centerX - 30,
      0 - 19,
      // 끝점
      centerX,
      0 - notchHeight,
    );

    path.cubicTo(
      centerX + 30,
      0 - 19,
      centerX + 20,
      0,
      //끝점,
      centerX + notchWidth / 2,
      0,
    );

    // 오른쪽 직선
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // 그림자 먼저 그리기
    canvas.drawShadow(path, Colors.black, 5, false);

    // 배경 그리기
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
