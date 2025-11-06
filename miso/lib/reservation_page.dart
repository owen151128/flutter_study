import 'package:flutter/material.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Text(
                "예약내역",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
              ),
              SizedBox(height: 64),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(Icons.info, color: Theme.of(context).primaryColor),
                  SizedBox(width: 8),

                  /// 예약된 서비스가 아직 없어요. 지금 예약해보세요!
                  /// Tip : 폰의 폭과 관계없이 텍스트를 언제나 한 줄로 보여주기
                  Expanded(
                    // row의 남은 영역을 모두 차지하도록
                    child: FittedBox(
                      // 해당 영역에 적절한 사이즈로 맞추기
                      fit: BoxFit.scaleDown, // child 최소 크기를 존중
                      child: Text(
                        "예약된 서비스가 아직 없어요. 지금 예약해보세요!",
                        style: TextStyle(
                          fontSize: 100, // 아무리 커도 한 줄로 보여요!
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.grey),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 58,
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    "예약하기",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 18),
            ],
          ),
        ),
      ),
    ),
  );
}
