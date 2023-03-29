import 'package:carousel_pro/carousel_pro.dart';
import 'package:e_commerce_app/appColors/app_colors.dart';
import 'package:e_commerce_app/styles/home_screen_styles.dart';
import 'package:e_commerce_app/svgimages/svg_images.dart';
import 'package:e_commerce_app/widgets/show_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/home-page-data/home_page_data.dart';
import '../../routes/routes.dart';
import '../../widgets/single_product_widget.dart';
import '../detailscreen/detail_screen.dart';
import '../tabbar/tabbar_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  AppBar buildAppBar() {
    return AppBar(
      bottom: const TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 22),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        tabs: [
          Text("All"),
          Text("Clothing"),
          Text("Shoes"),
          Text("Accessories"),
        ],
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        children: const [
          Text(
            "Welcome To",
            style: HomeScreenStyles.appBarUpperTitleStyles,
          ),
          Text(
            "Lapify Enterprise",
            style: HomeScreenStyles.appBarBottomTitleStyles,
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: RotationTransition(
            turns: const AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(
              SvgImages.filter,
              color: AppColors.baseBlackColor,
              width: 30,
            ),
          ),
        ),
        IconButton(
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildAdvertismentPlace() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        height: 170,
        child: Carousel(
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: const Duration(microseconds: 1000),
          showIndicator: false,
          images: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("images/mens.png"),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://assets-static.invideo.io/images/large/Creative_Clothing_Advertisement_Ideas_To_Boost_Sales_revised_3_1_cefa9cda88.png"),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("images/shoes ad.png"),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrendingProduct({
    required String productImage,
    required String productName,
    required String productModel,
    required double productPrice,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 20),
      height: 65,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(productImage),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: HomeScreenStyles.trendingProductNameStyle,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    productModel,
                    style: HomeScreenStyles.trendingProductModelStyle,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: MaterialButton(
              color: AppColors.baseLightPinkColor,
              elevation: 0,
              height: 45,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(0.7),
              ),
              onPressed: () {},
              child: Text(
                "\$ $productPrice",
                style: HomeScreenStyles.trendingProductPriceStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: buildAppBar(),
          body: TabBarView(
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  buildAdvertismentPlace(),
                  ShowAllWidget(leftText: "New Arrival"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      primary: true,
                      itemCount: singleProductData.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        var data = singleProductData[index];
                        return SingleProductWidget(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                          data: data,
                                        )));
                          },
                          productImage: data.productImage,
                          productModel: data.productModel,
                          productName: data.productName,
                          productOldPrice: data.productOldPrice,
                          productPrice: data.productPrice,
                        );
                      },
                    ),
                  ),
                  const Divider(
                    indent: 16,
                    endIndent: 16,
                  ),
                  ShowAllWidget(leftText: "What\'s trending"),
                  buildTrendingProduct(
                    productImage:
                        'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                    productModel: 'Tank-tops',
                    productName: 'Classics mesh tank top',
                    productPrice: 15,
                  ),
                  buildTrendingProduct(
                    productImage:
                        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d91819a9800047d1bb28ae920142ab44_9366/NMD_R1_Shoes_Red_GX9886_01_standard.jpg',
                    productModel: 'NMD-R1 Shoes',
                    productName: 'Classics Men Shoes',
                    productPrice: 25,
                  ),
                  buildTrendingProduct(
                    productImage:
                        'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/686b5cbb08bb4d21a2b3ad6600d47c18_9366/Ewood_Track_Pants_Blue_GT1818_23_hover_model.jpg',
                    productModel: 'Ewood Track Pants',
                    productName: 'Men Orignals',
                    productPrice: 20,
                  ),
                  ShowAllWidget(
                    leftText: "Your History",
                  ),
                  SizedBox(
                    height: 240,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      primary: true,
                      itemCount: singleProductData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) {
                        var data = singleProductData[index];

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
                  ),
                ],
              ),
              TabBars(
                productData: clothsData,
              ),
              TabBars(
                productData: shoesData,
              ),
              TabBars(
                productData: accessoriesData,
              ),
            ],
          )),
    );
  }
}
