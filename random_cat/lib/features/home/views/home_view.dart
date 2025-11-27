import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Placeholder());
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     foregroundColor: Colors.white,
    //     title: Text("랜덤 고양이"),
    //     backgroundColor: Colors.amber,
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.favorite),
    //         onPressed: () => Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) => FavoriteScreen()),
    //         ),
    //       ),
    //     ],
    //   ),
    //   body: SafeArea(
    //     child: GridView.count(
    //       padding: EdgeInsets.all(8),
    //       crossAxisCount: 2,
    //       children: List.generate(
    //         10,
    //             (i) => catImageInfo.when(
    //           data: (data) => InkWell(
    //             onTap: () {
    //               if (catImageFavorites.contains(data[i])) {
    //                 catImageFavoritesNotifier.remove(data[i]);
    //               } else {
    //                 catImageFavoritesNotifier.add(data[i]);
    //               }
    //             },
    //             borderRadius: BorderRadius.circular(10),
    //             splashColor: Colors.amberAccent,
    //             child: Padding(
    //               padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(10),
    //                 child: Stack(
    //                   children: [
    //                     Positioned.fill(
    //                       child: Image.network(
    //                         data[i].url ?? "",
    //                         fit: BoxFit.cover,
    //                       ),
    //                     ),
    //                     Positioned(
    //                       bottom: 10,
    //                       right: 10,
    //                       child: catImageFavorites.contains(data[i])
    //                           ? Icon(Icons.favorite, color: Colors.red)
    //                           : Icon(Icons.favorite_outline, color: Colors.red),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //           error: (error, stackTrace) =>
    //               getLoadingScreen(e: error, s: stackTrace),
    //           loading: () => getLoadingScreen(),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget getLoadingScreen({Object? e, StackTrace? s}) {
    if (e != null) {
      Logger().e(e);
      Logger().e(s);
    }

    return Center(child: CircularProgressIndicator(color: Colors.amber));
  }
}
