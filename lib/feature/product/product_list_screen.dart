import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task/feature/product/product_detail_screen.dart';
import 'package:task/feature/user/profile_screen.dart';

import '../../models/product_list_model.dart';
import '../../services/product_list_api_service.dart';
import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

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
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            shadowColor: Colors.grey,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  children:  [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
                    },
                    child: const CircleAvatar(
                    backgroundColor: greenButtonColor,
                    radius: 20,
                    child: Icon(
                      Icons.person_2_outlined,
                    )
                                    ),
                  ),
                  ],
                ),
              )
            ],
          ),
            backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: FutureBuilder<List<ProductListModel>>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: const Center(
                        child: CircularProgressIndicator(
                          color: greenButtonColor,
                        )),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                          child: Text('No products found')
                      )
                  );
                } else {
                  return StaggeredGridView.countBuilder(
                    physics: const NeverScrollableScrollPhysics(),
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
                                ],
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 12,right: 12),
                                child: Text('${product.title}',
                                  style: plantNameTextStyle
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  children: [
                                    Text('\$${product.price.toString()}',
                                      style: priceTextStyle
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                  product.image,
                                  product.title,
                                  product.description,
                                  product.price,
                                  product.category,
                                  product.rating!.rate,
                              )
                            ),
                          );
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
