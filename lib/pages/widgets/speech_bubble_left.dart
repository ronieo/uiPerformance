import 'dart:math';
import 'package:flutter/material.dart';
import 'package:performance/com/colors.dart';

/// 왼쪽 말풍선
class SpeechBubbleLeft extends StatelessWidget {
  final Color color;

   const SpeechBubbleLeft({Key? key,
    this.color = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
       Container(
         width: 250,
         height: 100,
         padding: const EdgeInsets.only(
             left:  22, top:  10,
             right:  12, bottom: 10),
         decoration: BoxDecoration(
           color: GlobalColor.white,
           border: Border.all(
               color: GlobalColor.gainsboro,
               //color: _leftBorderColor,
               width: 1
           ),
           borderRadius: BorderRadius.circular(20),
           boxShadow: const [ BoxShadow(
             color: Color(0x29000000),
             offset: Offset(0,3),
             blurRadius: 6,
           )],
         ),
         child: const Text(
           "Then you’re left in the dust  Unless I stuck by ya You’re a "
               " sunflower I think your love  would be to much"
               "anehghlfmf enlwlqdj wkrdms thfksdmf dlfdmzu",
            style: TextStyle(
              color: GlobalColor.davysGray,
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

    final tailSize = Size(size.width * 0.8 , size.height * 0.2);
    final tailStartPoint = Point(size.height * 0.02, size.width * 0.8);

    /// tail outline
    final tailOutlinePath = Path()
    ..moveTo(tailStartPoint.x, tailStartPoint.y)
    ..lineTo(
        tailStartPoint.x + (tailSize.width * -0.5), tailStartPoint.y + (tailSize.height * -2.5)
    )
    ..lineTo(
        tailStartPoint.x +(tailSize.width * 0.05), tailStartPoint.y +(tailSize.height * -2.0)
    );

    ///tail body
    final tailPath = Path()
    ..moveTo(tailStartPoint.x, tailStartPoint.y)
    ..lineTo(
    tailStartPoint.x + (tailSize.width * -0.49), tailStartPoint.y + (tailSize.height * -2.49)
    )
    ..lineTo(
    tailStartPoint.x +(tailSize.width * 0.06), tailStartPoint.y +(tailSize.height * -2.01)
    );
    /// paint setting
    final outlinePaint = Paint()
      ..color = GlobalColor.gainsboro
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = GlobalColor.white
      ..style = PaintingStyle.fill;

    /// draw
    canvas.drawPath(tailOutlinePath, outlinePaint);
    canvas.drawPath(tailPath, fillPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}