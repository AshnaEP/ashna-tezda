import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../styles/colors.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) => InkWell(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    side: new BorderSide(
                        color: grayColor,
                        width: 0.3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15),
                                bottom: Radius.circular(0)),
                            child: Image.network("https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 1, right: 1),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       IconButton(
                          //         onPressed: () {
                          //           if (storedToken.isEmpty) {
                          //             Stopwatch stopwatch = new Stopwatch()..start();
                          //             data.list[index].isWishlist ?? false
                          //                 ? productListProvider
                          //                 .deleteWishlist(data.list[index].id)
                          //                 : productListProvider
                          //                 .addToWishlist(data.list[index].id);
                          //             print('doSomething() executed in ${stopwatch.elapsed}');
                          //             Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
                          //           } else {
                          //             Navigator.push(
                          //                 context,
                          //                 MaterialPageRoute(
                          //                     builder: (context) => LoginPage()));
                          //           }
                          //         },
                          //         icon: data.list[index].isWishlist ?? false
                          //             ? Icon(
                          //           Icons.favorite,
                          //           color: Colors.red[700],
                          //         )
                          //             : Icon(
                          //           Icons.favorite_border,
                          //           color: Colors.white,
                          //         ),
                          //       )
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text('HP LapTop',
                            // style: plantTypeText
                        ),
                      ),
                      const SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text('rgrehdfher',
                            // style: semiBoldText
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Text('\₹' + '89526',
                                // style: priceText
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         ProductDetail('${data.list[index].id!}',data.list[index].isWishlist,true,false,false),
                  //   ),
                  // );
                },
              ),
              staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            )
          ),
        )
    );
  }
}
