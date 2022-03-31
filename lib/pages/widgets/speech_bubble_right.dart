import 'dart:math';
import 'package:performance/com/colors.dart';
import 'package:flutter/material.dart';


class SpeechBubbleRight extends StatelessWidget {
   const SpeechBubbleRight({Key? key,
    this.color = Colors.transparent,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          width: 250,
          height: 100,
          padding: const EdgeInsets.only(
              left:  12, top:  10,
              right:  22, bottom:  10),
            decoration: BoxDecoration(
              color: GlobalColor.brilliantAzure,
              border: Border.all(
                  color: GlobalColor.blueCola,
                  width: 1
              ),
              boxShadow: const [ BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0,3),
                blurRadius: 6,
                )],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              "Needless to say, I keep her in check She was all bad-bad, never the less",
              style: TextStyle(
                color: GlobalColor.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        SizedBox(
          width:  30,
          height:  30,
          child: CustomPaint(
            painter: Bubble(),
          ),
        ),
      ],
    );
  }
}

class Bubble extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final tailSize = Size(size.width * 0.15, size.height * 0.05);
    final tailStartPoint = Point(size.width * 8.2, size.height * 0.28);

    ///bubble outline tail
    final tailOutlinePath = Path()
      ..moveTo(tailStartPoint.x, tailStartPoint.y)
      ..lineTo(
          tailStartPoint.x + (tailSize.width * 3.0), tailStartPoint.y + (tailSize.height * -1.5)
      )
      ..lineTo(
          tailStartPoint.x +(tailSize.width * 0.5), tailStartPoint.y +(tailSize.height * 9.0)
      );

    ///bubble body tail
    final tailPath = Path()
      ..moveTo(tailStartPoint.x, tailStartPoint.y)
      ..lineTo(
          tailStartPoint.x + (tailSize.width * 2.99), tailStartPoint.y + (tailSize.height * -1.51)
      )
      ..lineTo(
          tailStartPoint.x +(tailSize.width * 0.28), tailStartPoint.y +(tailSize.height * 8.99)
      );

    /// paint setting
    final outlinePaint = Paint()
      ..color = GlobalColor.blueCola
      ..strokeWidth = 1.3
      ..style = PaintingStyle.stroke;
    final fillPaint = Paint()
      ..color = GlobalColor.brilliantAzure
      ..style = PaintingStyle.fill;

    /// draw
    canvas.drawPath(tailOutlinePath, outlinePaint);
    canvas.drawPath(tailPath, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}