import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Text(
                textAlign: TextAlign.start,
                "나의 정보",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
              ),
              SizedBox(height: 16),
              Text(
                textAlign: TextAlign.start,
                "010-1234-5678",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32),
              ListTile(
                onTap: () => {},
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.home_outlined, color: Colors.black),
                title: Text(
                  "주소 관리",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                onTap: () => {},
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.credit_card_outlined, color: Colors.black),
                title: Text(
                  "결제 수단 관리",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                onTap: () => {},
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.article_outlined, color: Colors.black),
                title: Text(
                  "공지사항",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              ListTile(
                onTap: () => {},
                contentPadding: EdgeInsets.all(0),
                leading: Icon(Icons.help_outline, color: Colors.black),
                title: Text(
                  "문의사항",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
