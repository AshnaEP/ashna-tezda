import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

class ProductDetailScreen extends StatefulWidget {
  dynamic imageUrl;
  dynamic productName;
  dynamic productDesc;
  dynamic price;
  dynamic category;
  dynamic rating;
   ProductDetailScreen(
       this.imageUrl,
       this.productName,
       this.productDesc,
       this.price,
       this.category,
       this.rating,
       {super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: greenButtonColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
              color: whiteColor,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          // padding: const EdgeInsets.only(top: 20,bottom: 20),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Image.network(
                        widget.imageUrl,
                        // height: 210,
                        width: 210,
                        // fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 20, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 9),
                    Text(
                        widget.productName,
                        style: productDetailTextStyle
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Category :',
                            style: categoryTitleTextStyle
                        ),
                        const SizedBox(width: 5),
                        Text(widget.category,
                            style: categoryTextStyle,
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    RatingBar.builder(
                      initialRating: widget.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: ratingStarColor,
                        // Colors.amber,
                        size: 5,
                      ),
                      onRatingUpdate: (rating) {
                      },
                      ignoreGestures: true, //disable rating when tapping on stars
                    ),

                    const SizedBox(height: 15),

                    Text('\$${widget.price.toString()}',
                        style: priceTextDetailStyle
                        // style: productPriceText
                    ),

                    const SizedBox(height: 15),

                    Text(
                        widget.productDesc,
                      style: descriptionTextStyle,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
        )
    );
  }
}
