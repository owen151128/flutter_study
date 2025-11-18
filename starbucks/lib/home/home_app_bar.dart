import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.appBarBackgroundImageUrl});

  final String appBarBackgroundImageUrl;

  @override
  Widget build(BuildContext context) => SliverAppBar(
    backgroundColor: Colors.white,
    pinned: true,
    toolbarHeight: 1,
    collapsedHeight: 1,
    expandedHeight: 280,
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        children: [
          Image.network(appBarBackgroundImageUrl, fit: BoxFit.fill),
          Positioned(
            left: 24,
            right: 24,
            top: MediaQuery.of(context).size.height * 0.1,
            bottom: 52,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "한 해의 마무리,\n수고 많았어요💖",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "11 ★ until next Reward",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.grey.withValues(
                                alpha: 0.2,
                              ),
                              value: 0.083,
                              minHeight: 10,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black, // RichText는 기본이 흰색이라 안보임
                        ),
                        children: [
                          TextSpan(
                            text: "1",
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " / ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextSpan(
                            text: "12 ★",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(52),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Row(
          children: [
            TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.mail_outline, color: Colors.grey),
              label: Text(
                "What's New",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            TextButton.icon(
              onPressed: () => {},
              icon: Icon(Icons.confirmation_num_outlined, color: Colors.grey),
              label: Text(
                "Coupon",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Spacer(),
            Stack(
              children: [
                IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Colors.grey,
                    size: 32,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
