import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:com.example.liliya/bloc/get_book_details_bloc.dart';
import 'package:com.example.liliya/hive_helper/hive_names.dart';
import 'package:com.example.liliya/models/book_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/color_extenstion.dart';
import '../../common_widget/best_seller_cell.dart';
import '../../common_widget/genres_cell.dart';
import '../../common_widget/recently_cell.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
import '../../common_widget/top_picks_cell.dart';
import '../book_reading/book_reading_view.dart' show BookReadingView;
import '../login/sign_up_view.dart';
import '../main_tab/main_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List topPicksArr = [
    {
      "name": "Napoleon Bonapart",
      "author": "Sharl Loran",
      "img": "assets/img/1.jpg",
    },
    {
      "name": "Urush va Tinchlik",
      "author": "Lev Tolstoy",
      "img": "assets/img/2.jpg",
    },
    {
      "name": "O`tkan kunlar",
      "author": "Abdulla Qodiriy",
      "img": "assets/img/3.jpg",
    },
  ];

  List<BookDetailsModel> allBooks = HiveBoxes.book_details.values.toList();

  List genresArr = [
    {"name": "Graphic Novels", "img": "assets/img/g1.png"},
    {"name": "Graphic Novels", "img": "assets/img/g1.png"},
    {"name": "Graphic Novels", "img": "assets/img/g1.png"},
  ];

  List recentArr = [
    {
      "name": "The Fatal Tree",
      "author": "by Jake Arnott",
      "img": "assets/img/10.jpg",
    },
    {
      "name": "Day Four",
      "author": "by LOTZ, SARAH",
      "img": "assets/img/11.jpg",
    },
    {
      "name": "Door to Door",
      "author": "by Edward Humes",
      "img": "assets/img/12.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetBookDetailsBloc>(context).add(FirebaseBookEvent());
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<GetBookDetailsBloc, GetBookDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetBookDetailsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetBookDetailsSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        child: Transform.scale(
                          scale: 1.5,
                          origin: Offset(0, media.width * 0.8),
                          child: Container(
                            width: media.width,
                            height: media.width,
                            decoration: BoxDecoration(
                              color: TColor.primary,
                              borderRadius: BorderRadius.circular(
                                media.width * 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: media.width * 0.1),
                          AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            title: Row(
                              children: const [
                                Text(
                                  "Our Top Picks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            leading: Container(),
                            leadingWidth: 1,
                            actions: [
                              IconButton(
                                onPressed: () {
                                  sideMenuScaffoldKey.currentState
                                      ?.openEndDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: media.width,
                            height: media.width * 0.8,
                            child: CarouselSlider.builder(
                              itemCount: topPicksArr.length,
                              itemBuilder: (
                                BuildContext context,
                                int itemIndex,
                                int pageViewIndex,
                              ) {
                                var iObj = topPicksArr[itemIndex] as Map? ?? {};
                                return TopPicksCell(iObj: iObj);
                              },
                              options: CarouselOptions(
                                autoPlay: false,
                                aspectRatio: 1,
                                enlargeCenterPage: true,
                                viewportFraction: 0.45,
                                enlargeFactor: 0.4,
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Bestsellers",
                                  style: TextStyle(
                                    color: TColor.text,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.9,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 8,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: allBooks.length,
                              itemBuilder: ((context, index) {
                                var bookdetail = allBooks[index];

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => BookReadingView(
                                              title: bookdetail.title,
                                              Country: "Uzbekistan",
                                              creator: bookdetail.creator,
                                              description:
                                                  bookdetail.description,
                                              imgPath: bookdetail.img,
                                              ISBN: bookdetail.identifier,
                                              language: bookdetail.language,
                                              publicator: bookdetail.publisher,
                                              category: bookdetail.category,
                                              category_id:
                                                  bookdetail.category_id
                                                      .toString(),
                                              contributor:
                                                  bookdetail.contributor,
                                              coverage: bookdetail.coverage,
                                              date: bookdetail.date,
                                              format: bookdetail.format,
                                              id: bookdetail.id.toString(),
                                              relation: bookdetail.relation,
                                              subject: bookdetail.subject,
                                              type: bookdetail.type,
                                            ),
                                      ),
                                    );
                                  },
                                  child: BestSellerCell(
                                    title: bookdetail.title,
                                    Country: "Uzbekistan",
                                    creator: bookdetail.creator,
                                    description: bookdetail.description,
                                    imgPath: bookdetail.img,
                                    ISBN: bookdetail.identifier,
                                    language: bookdetail.language,
                                    publicator: bookdetail.publisher,
                                  ),
                                );
                              }),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Genres",
                                  style: TextStyle(
                                    color: TColor.text,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.6,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 8,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: genresArr.length,
                              itemBuilder: ((context, index) {
                                var bObj = genresArr[index] as Map? ?? {};

                                return GenresCell(
                                  bObj: bObj,
                                  bgcolor:
                                      index % 2 == 0
                                          ? TColor.color1
                                          : TColor.color2,
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: media.width * 0.1),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Recently Viewed",
                                  style: TextStyle(
                                    color: TColor.text,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: media.width * 0.7,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 8,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: recentArr.length,
                              itemBuilder: ((context, index) {
                                var bObj = recentArr[index] as Map? ?? {};

                                return RecentlyCell(iObj: bObj);
                              }),
                            ),
                          ),
                          SizedBox(height: media.width * 0.1),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "Monthly Newsletter",
                                  style: TextStyle(
                                    color: TColor.text,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: double.maxFinite,
                            margin: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: TColor.textbox.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.",
                                  style: TextStyle(
                                    color: TColor.subTitle,
                                    fontSize: 12,
                                  ),
                                ),

                                const SizedBox(height: 15),

                                RoundTextField(
                                  controller: txtName,
                                  hintText: "Name",
                                ),
                                const SizedBox(height: 15),
                                RoundTextField(
                                  controller: txtEmail,
                                  hintText: "Email Address",
                                ),

                                const SizedBox(height: 15),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    MiniRoundButton(
                                      title: "Sign Up",
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => const SignUpView(),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: media.width * 0.1),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Text('Spmething went wong');
          }
        },
      ),
    );
  }
}
