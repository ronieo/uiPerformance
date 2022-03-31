import 'package:flutter/material.dart';
import 'package:performance/com/colors.dart';
import 'package:performance/conf/asset_image.dart';
import 'package:performance/pages/widgets/speech_bubble_left.dart';
import 'package:performance/pages/widgets/speech_bubble_right.dart';

class SpeechBubbleChat extends StatefulWidget {
  const SpeechBubbleChat({Key? key}) : super(key: key);

  @override
  _SpeechBubbleChatState createState() => _SpeechBubbleChatState();
}

class _SpeechBubbleChatState extends State<SpeechBubbleChat> {

  bool _quizTalkEnd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 58,),
                  Align(
                    alignment: Alignment.topRight,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Image(
                        width: 20,
                        height: 20,
                        color: GlobalColor.springViolet,
                        image: GlobalAsset.flexWhiteClose
                      ),
                    ),
                  ),
                  //...상대방프로필
                  Row(
                    children: const [
                       Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, top: 15),
                          child: Image(
                            width:  39, height:  39,
                            image: GlobalAsset.defaultProfile01
                        ),
                      ),
                      ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, top:  12),
                          child: Text(
                            'Name, job',
                            style: TextStyle(
                              color: GlobalColor.davysGray,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                    ],
                  ),
                 const SizedBox(height: 5,),
                  //...상대 정답 선택 말풍선
                  const SpeechBubbleLeft(),

                  //...내프로필
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10,top:  20),
                      child: Image(
                        width:  39,
                        height:  39,
                        image: GlobalAsset.defaultProfile02,
                    ),
                  ),
                  ),
                  const SizedBox(height: 5,),
                  // 내 정답 선택 말풍선
                  const SpeechBubbleRight(),
                ],
              ),
            ),
            const SizedBox(height:  6.5,),
            Visibility(
              visible: _quizTalkEnd = !_quizTalkEnd,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 6.5,
                          left:  15.3,
                          bottom: 80
                      ),
                      child: SizedBox(
                        width:  340,
                        height: 160,
                        child: Stack(
                          children: [
                            Container(
                              width:  320.7,
                              height: 145,
                              padding: const EdgeInsets.only(
                                  left: 20.7, top:  33,
                                  right:  18, bottom: 17.5
                              ),
                                decoration: BoxDecoration(
                                color: GlobalColor.white,
                                border: Border.all(
                                color: GlobalColor.white,
                                width: 1
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(1,1),
                                blurRadius: 3,
                                spreadRadius: 0,
                                )],
                                ),
                              child: const Text(
                                "- on 소유격 way : 가는중인\n"
                                      "- on 소유격 way : 가는중인\n"
                                      "- on 소유격 way : 가는중인\n"
                                      "- on 소유격 way : 가는중인\n"
                                      "- on 소유격 way : 가는중인\n",
                                  style: TextStyle(
                                    color: GlobalColor.davysGray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            //...관련 단어 표현 + 이미지
                            Padding(
                              padding: const EdgeInsets.only(
                                top:  10, right: 216.5,
                                left:  20.7, bottom:  5,
                              ),
                              child: Stack(
                                children: const [
                                   Text(
                                    "관련 단어/표현",
                                    style: TextStyle(
                                      color: GlobalColor.brilliantAzure,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Positioned(
                                    left:  65.8,
                                    child: Image(
                                      width:  16,
                                      height: 20,
                                      image: GlobalAsset.tinyTwinkle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //...위 테이프
                  const Positioned(
                    left:  20.3,
                    bottom: 215.7,
                    child:Image(
                      width:  39,
                      height:  35,
                      image: GlobalAsset.tape,
                    ),
                  ),
                  //...아래 테이프
                  const Positioned(
                    right: 25,
                    bottom:  80.5,
                    child: Image(
                      width: 40,
                      height: 34,
                      image: GlobalAsset.tape,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
