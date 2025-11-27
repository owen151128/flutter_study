import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Placeholder());
    // return Scaffold(
    //   appBar: AppBar(
    //     centerTitle: true,
    //     foregroundColor: Colors.white,
    //     title: Text("좋아요"),
    //     backgroundColor: Colors.amber,
    //   ),
    //   body: SafeArea(
    //     child: GridView.count(
    //       padding: EdgeInsets.all(8),
    //       crossAxisCount: 2,
    //       children: List.generate(
    //         catImageFavorites.length,
    //         (i) => InkWell(
    //           onTap: () {
    //             if (catImageFavorites.contains(catImageFavorites[i])) {
    //               catImageFavoritesNotifier.remove(catImageFavorites[i]);
    //             } else {
    //               catImageFavoritesNotifier.add(catImageFavorites[i]);
    //             }
    //           },
    //           borderRadius: BorderRadius.circular(10),
    //           splashColor: Colors.amberAccent,
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(10),
    //               child: Stack(
    //                 children: [
    //                   Positioned.fill(
    //                     child: Image.network(
    //                       catImageFavorites[i].url ?? "",
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                   Positioned(
    //                     bottom: 10,
    //                     right: 10,
    //                     child: catImageFavorites.contains(catImageFavorites[i])
    //                         ? Icon(Icons.favorite, color: Colors.red)
    //                         : Icon(Icons.favorite_outline, color: Colors.red),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
