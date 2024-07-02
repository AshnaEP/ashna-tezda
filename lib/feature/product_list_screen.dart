import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../models/product_list_model.dart';
import '../services/product_list_api_service.dart';
import '../styles/colors.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  late Future<List<ProductListModel>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService.fetchProducts();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: FutureBuilder<List<ProductListModel>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No products found'));
                } else {
                  return StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      ProductListModel product = snapshot.data![index];
                      return InkWell(
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
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
                                    child: Center(
                                      child: Image.network('${product.image}',
                                        height: 150,
                                      ),
                                    ),
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
                                child: Text('${product.title}',
                                  // style: plantTypeText
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Text('\$${product.price.toString()}',
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
                      );
                    },
                    staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  );
                }
              },
            ),
          ),
        )
    );
  }
}
