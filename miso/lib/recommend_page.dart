import 'package:flutter/material.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Theme.of(context).colorScheme.primary,
    body: SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Spacer(),
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Image.asset("assets/bg1.png"),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 64),
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 28,
                      height: 1.5, // 줄간격 한 줄의 1.5배
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: "친구 추천할 때마다\n"),
                      TextSpan(
                        text: "10,000원 ",
                        // 개별 스타일
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "할인 쿠폰 지급!"),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                InkWell(
                  borderRadius: BorderRadius.circular(64),
                  onTap: () => {},
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          "자세히 보기",
                        ),
                        Icon(Icons.chevron_right, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(64),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.redeem,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                          "친구 추천하기",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 42),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
