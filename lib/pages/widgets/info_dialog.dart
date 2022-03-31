import 'package:flutter/material.dart';
import 'package:performance/com/colors.dart';
import 'package:performance/conf/asset_image.dart';



class Pop extends StatelessWidget {
  const Pop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 10,
            top: 70,
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Image(
                width: 30,
                height:30,
                color: GlobalColor.springViolet,
                image: GlobalAsset.flexWhiteClose
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: (){
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return const CloseAndDots();
                  }
                );
              },
              child: const Text(
                  "POP UP",
                  style: TextStyle(
                    color: GlobalColor.springViolet,
                    fontSize: 40,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}

// ... 닫기, 백그라운드 투명도, 닷 인디케이터
class CloseAndDots extends StatefulWidget {
  const CloseAndDots({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CloseAndDots();
}

class _CloseAndDots extends State<CloseAndDots> with TickerProviderStateMixin {

  late TabController _dotsCtrl;

  @override
  void initState() {
    super.initState();
    _dotsCtrl = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _dotsCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Material(
            color: Colors.black54,
            child: TabBarView(
              controller: _dotsCtrl,
              children: const [
                DialogPage1(),
                DialogPage2(),
                DialogPage3(),
                DialogPage4(),
                DialogPage5(),
              ],
            ),
          ),
          //... whiteClose
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 60,
              height: 80,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const SizedBox(
                  width: 19,
                  height: 19,
                  child: Image(image: GlobalAsset.flexWhiteClose),
                ),
              ),
            ),
          ),
          //... dotIndicator
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 135,
              child: TabPageSelector(
                controller: _dotsCtrl,
                indicatorSize: 10.0,
                color: Colors.white12,
                selectedColor: GlobalColor.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogPage1 extends StatelessWidget {
  const DialogPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        SizedBox(height: 165),
        Image(
          image: GlobalAsset.flexTutorialHeader,
          width: 360,
          height: 160,
        ),
        SizedBox(height:  31),
        Text(
          '플렉스 타임은 예고된 시간에 진행되는\n 이벤트 모드에요.',
          style: TextStyle(
            color: GlobalColor.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 31),
        Text(
          '*PUSH 알림을 설정해, 편리하게 참가 할 수 있습니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: GlobalColor.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),

        ),
        SizedBox(height: 257),
      ],
    );
  }
}

class DialogPage2 extends StatelessWidget {
  const DialogPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: GlobalAsset.flexBookMark,
                width:  24,
                height:  30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '참여 방법',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 280,
            height: 435,
            child: Stack(
              children: const [
                Center(
                  child: Image(
                    image: GlobalAsset.flexTutorialPhoto2,
                    width: 265,
                    height: 340,
                  ),
                ),
                Positioned(
                  top: 153,
                  left: 20,
                  child: Image(
                    image: GlobalAsset.flexBlueArrow21,
                    width: 62,
                    height: 26,
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 215,
                  child: Image(
                    image: GlobalAsset.flexTutorialGreyBox2,
                    width: 66,
                    height: 41,
                  ),
                ),
                Positioned(
                  top: 183,
                  right: 219,
                  child: Text(
                    '플렉스 타임\n 활성화',
                    style: TextStyle(
                      color: GlobalColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                ),
                Positioned(
                  top: 360,
                  left: 135,
                  child: Image(
                    image: GlobalAsset.flexBlueArrow22,
                    width: 64,
                    height: 57,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 35,
                  child: Text(
                    '클릭 시\n자동참여',
                    style: TextStyle(
                      color: GlobalColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          const Text(
            '내가 맞춘 정답의 개수만큼\n ‘우리 학교 포인트’로 종합됩니다.',
            style: TextStyle(
              color: GlobalColor.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 96),
        ],
      );
  }
}

class DialogPage3 extends StatelessWidget {
  const DialogPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: GlobalAsset.flexBookMark,
                width:  24,
                height:  30,
              ),
              SizedBox(width:  15),
              Text(
                '참여 결과',
                style: TextStyle(
                  color: GlobalColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),

              ),
            ],
          ),
          const SizedBox(height: 42.8),
          SizedBox(
            width: 270,
            height: 435,
            child: Stack(
              children: const [
                Image(
                  image: GlobalAsset.flexTutorialPhoto3,
                  width: 265,
                  height: 419,
                ),
                Positioned(
                  top: 105,
                  left: 15,
                  child: Image(
                    image: GlobalAsset.flexTutorialPop2,
                    width: 222,
                    height: 56,
                  ),
                ),
                Positioned(
                  top: 108,
                  left: 25,
                  child: Image(
                    image: GlobalAsset.flexRedCircleNum2,
                    width: 20,
                    height: 20,
                  ),
                ),
                Positioned(
                  right: 38,
                  top: 370,
                  child: Image(
                    image: GlobalAsset.flexTutorialMore,
                    width: 66,
                    height: 66,
                  ),
                ),
                Positioned(
                  bottom: 45,
                  right: 70,
                  child: Image(
                    image: GlobalAsset.flexRedCircleNum1,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            '플렉스 타임 종료 후, 안내된 결과 발표시간이\n'
            '되면 [더보기 - 플타 순위/일정]에\n '
            '‘우승 학교/학생’이 발표됩니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: GlobalColor.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 33),
        ],
      );
  }
}

class DialogPage4 extends StatelessWidget {
  const DialogPage4({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: GlobalAsset.flexBookMark,
                width: 24,
                height: 30,
              ),
              SizedBox(width: 13),
              Text(
                '보상 신청하기',
                style: TextStyle(
                  color: GlobalColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 35),
          SizedBox(
            width: 350,
            height: 250,
            child: Stack(
              children: const [
                Center(
                  child: Image(
                    image: GlobalAsset.flexTutorialPhoto4,
                    width: 270,
                    height: 232,
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 65,
                  child: Image(
                    image: GlobalAsset.flexTutorialPop4,
                    width: 253,
                    height: 84,
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 245,
                  child: Image(
                    image: GlobalAsset.flexBlueArrow41,
                    width: 74,
                    height: 39,
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 17,
                  child: Text(
                    '해당 플타\n클릭',
                    style: TextStyle(
                      color: GlobalColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Positioned(
                  top: 23,
                  right:  290,
                  child: Image(
                    image: GlobalAsset.flexRedCircleNum1,
                    width: 20,
                    height: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          Stack(
            children: const [
              Image(
                image: GlobalAsset.flexTutorialFindSch,
                width: 204,
                height: 67,
              ),
              Positioned(
                bottom: 42,
                left:  18,
                child: Image(
                  image: GlobalAsset.flexRedCircleNum2,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          Center(
            child: SizedBox(
              width: 260,
              height:  120,
              child: Stack(
                children: const [
                  Positioned(
                    top: 15,
                    left:  10,
                    child: Image(
                      image: GlobalAsset.flexTutorialTimer,
                      width:  238,
                      height:  40,
                    ),
                  ),
                  Positioned(
                    bottom:  95,
                    right:  228,
                    child: Image(
                      image: GlobalAsset.flexRedCircleNum3,
                      width: 20,
                      height:  20,
                    ),
                  ),
                  Positioned(
                    top:  50,
                    left:  30,
                    child: Image(
                      image: GlobalAsset.flexBlueArrow42,
                      width:  64,
                      height:  47,
                    ),
                  ),
                  Positioned(
                    top: 73,
                    left:  90,
                    child: Text(
                      '보상 당첨 수령 정보 입력하면 신청 완료!',
                      style: TextStyle(
                        color: GlobalColor.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height:  25),
          const Text(
          '신청은 ‘결과 발표’후,72시간 동안만\n 가능하니 주의하세요.',
            style: TextStyle(
              color: GlobalColor.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 55),
        ],
      );
  }
}

class DialogPage5 extends StatelessWidget {
  const DialogPage5({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 65),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: GlobalAsset.flexBookMark,
                width:  24,
                height:  30,
              ),
              SizedBox(width:  13),
              Text(
                '보상 수령',
                style: TextStyle(
                  color: GlobalColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height:  90.8),
          const Text(
            '보상 수령은 최대 14일 이내, 아래 두 방법으로 안내됩니다',
            style: TextStyle(
              color: GlobalColor.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),

          ),
          const SizedBox(height: 70.8),
          SizedBox(
            width:  280,
            child: Stack(
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: SizedBox(
                    width:  90,
                    child:Image(
                      image: GlobalAsset.flexTutorialSendMsg,
                      width:  74,
                      height:  65,
                    ),
                  ),
                ),
                Positioned(
                  top:  8,
                  left:  5,
                  child: Image(
                    image: GlobalAsset.flexRedCircleNum1,
                    width:  20,
                    height:  20,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 90, top:  5),
                  child: Text(
                    '신청 시 입력한 정보(휴대폰\n 번호 등)로 보상 정보 발송',
                    style: TextStyle(
                      color: GlobalColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 42),
          Stack(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10, top:  10),
                child: Text(
                  '보상 지급 완료 후,\nPUSH 알림 발송',
                  style: TextStyle(
                    color: GlobalColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 150),
                child: Image(
                  image: GlobalAsset.flexTutorialBell,
                  width:  82,
                  height:  74,
                ),
              ),
              Positioned(
                top:  28,
                right:  5,
                child: Image(
                  image: GlobalAsset.flexRedCircleNum2,
                  width:  20,
                  height:  20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '* [더보기 - 설정 - 알림]에서 ‘플렉스 타임\n 보상 지급’ 알림이 활성 돼 있어야 합니다.',
            style: TextStyle(
              color: GlobalColor.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 100),
          const Text(
            "Apple is not a sponsor",
            style: TextStyle(
              color: GlobalColor.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 115),
        ],
      );
  }
}