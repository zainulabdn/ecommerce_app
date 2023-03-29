import 'package:e_commerce_app/appColors/app_colors.dart';
import 'package:e_commerce_app/svgimages/svg_images.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/detail-screen-data/detail-screen-data.dart';
import '../../models/single_product_models.dart';
import '../../styles/detail_screen_styles.dart';
import '../../widgets/drop_button_widget.dart';
import '../../widgets/single_product_widget.dart';

class DetailScreen extends StatefulWidget {
  final SingleProductModel data;

  const DetailScreen({super.key, required this.data});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String _ratingController;
  late String _sizeController;

  PreferredSize buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Reebok",
          style: TextStyle(
            color: AppColors.baseBlackColor,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              SvgImages.heart,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              SvgImages.upload,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  buildListTile() {
    return ListTile(
      leading: const CircleAvatar(
        radius: 35,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(
          "images/Logo.png",
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.productName,
            overflow: TextOverflow.ellipsis,
            style: DetailScreenStyles.companyTitleStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productModel,
            style: DetailScreenStyles.productModelStyle,
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.productPrice.toString(),
            style: DetailScreenStyles.productPriceStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productOldPrice.toString(),
            style: DetailScreenStyles.productOldPriceStyle,
          ),
        ],
      ),
    );
  }

  buildProductImages() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.data.productImage,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productSecondImage),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productThirdImage),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productFourImage),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildColorsAndSize() {
    return Row(
      children: [
        // Expanded(
        //   child: DropButton(
        //     hintText: "Color",
        //     item: const ["red", "blue", "white", "black", "pink"],
        //     ratingController: _ratingController,
        //   ),
        // ),
        // Expanded(
        //   child: DropButton(
        //     hintText: "Size",
        //     item: const ["25", "30", "35", "40", "45"],
        //     ratingController: _sizeController,
        //   ),
        // )
      ],
    );
  }

  buildExpensionTileRow(
      {required String firstTitle, required String secTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstTitle,
          // ".\t\tMaterial",
          style: const TextStyle(
            fontSize: 18.60,
          ),
        ),
        Text(
          secTitle,
          // "84%\nylon",
          style: const TextStyle(
            fontSize: 18.60,
          ),
        ),
      ],
    );
  }

  buildExpensionTile() {
    return ExpansionTile(
      title: const Text(
        "Description",
        style: DetailScreenStyles.descriptionTextStyle,
      ),
      children: [
        ListTile(
          title: Wrap(
            children: [
              const Text(
                "this woman\'s tank top is designed to help you\nstay cool. it\'s made of stretchy and breathable\nfabric that moves heat away from your skin\n",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Column(
                children: [
                  buildExpensionTileRow(
                    firstTitle: '.\t\tMaterial',
                    secTitle: "84%\tnylon",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "16% elastane",
                        style: TextStyle(
                          fontSize: 18.60,
                        ),
                      ),
                    ],
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\tSize",
                    secTitle: "2XS,\tXS, \ts,\tM, \tL",
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\tGender",
                    secTitle: "Woman",
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\tProvince",
                    secTitle: "Balochistan",
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\tCountry",
                    secTitle: "Pakistan",
                  ),
                  MaterialButton(
                    height: 55,
                    elevation: 0,
                    minWidth: double.infinity,
                    color: AppColors.basewhite60Color,
                    onPressed: () {},
                    child: const Text(
                      "Size guide",
                      style: DetailScreenStyles.sizeGuideTextStyle,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  buildAddtoCart() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: MaterialButton(
        elevation: 0,
        height: 50,
        color: AppColors.baseDarkGreenColor,
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(5)),
        child: const Text(
          "Add to Cart",
          style: DetailScreenStyles.buttonTextStyle,
        ),
        onPressed: () {},
      ),
    );
  }

  buildBottomGridView() {
    return SizedBox(
      height: 240,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        primary: true,
        itemCount: detailScreenData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) {
          var data = detailScreenData[index];
          return SingleProductWidget(
            onPressed: () {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: DetailScreen(
                  data: data,
                ),
              );
            },
            productImage: data.productImage,
            productModel: data.productModel,
            productName: data.productName,
            productOldPrice: data.productOldPrice,
            productPrice: data.productPrice,
          );
        },
      ),
    );
  }

  buildMayLikeYou() {
    return const ListTile(
      leading: Text(
        "You may also like",
        style: DetailScreenStyles.youmayalsolikeTextStyle,
      ),
      trailing: Text(
        "Show All",
        style: DetailScreenStyles.showAllTextStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          buildListTile(),
          buildProductImages(),
          buildColorsAndSize(),
          buildAddtoCart(),
          buildExpensionTile(),
          buildMayLikeYou(),
          buildBottomGridView(),
        ],
      ),
    );
  }
}
