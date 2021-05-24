import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uahage/src/Controller/place.controller.dart';
import 'package:uahage/src/Controller/user.controller.dart';
import 'package:uahage/src/Service/bookmark.dart';
import 'package:uahage/src/Static/Font/font.dart';
import 'package:uahage/src/Static/Widget/toast.dart';
import 'package:uahage/src/Static/url.dart';
import 'package:uahage/src/View/Nav/HomeSub/feedbackPage/feedbackPage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Controller/place.controller.dart';
import '../../../Static/Font/font.dart';

class ListSub extends GetView<PlaceController> {
  ScrollController _scrollController = ScrollController();
  WebViewController _controller;
  int placeCode = Get.arguments['placeCode'];
  var data = Get.arguments['data'];
  int index = Get.arguments['index'];

  String url = URL;

  //
  Bookmark bookmark = new Bookmark();
  var imagecolor = [
    "./assets/searchPage/image1.png",
    "./assets/searchPage/image2.png",
    "./assets/searchPage/image3.png",
    "./assets/searchPage/image4.png",
    "./assets/searchPage/image5.png",
    "./assets/searchPage/image6.png",
    "./assets/searchPage/image7.png",
    "./assets/searchPage/image8.png",
    "./assets/searchPage/image9.png",
    "./assets/searchPage/image10.png"
  ];
  var imagegrey = [
    "./assets/searchPage/image1_grey.png",
    "./assets/searchPage/image2_grey.png",
    "./assets/searchPage/image3_grey.png",
    "./assets/searchPage/image4_grey.png",
    "./assets/searchPage/image5_grey.png",
    "./assets/searchPage/image6_grey.png",
    "./assets/searchPage/image7_grey.png",
    "./assets/searchPage/image8_grey.png",
    "./assets/searchPage/image9_grey.png",
    "./assets/searchPage/image10_grey.png"
  ];

  var mainimage = [
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_sublist/image1.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_sublist/image2.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_sublist/image3.png"
  ];

  var restaurantListImage = [
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_sublist/image1.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_sublist/image2.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_sublist/image3.png"
  ];
  var hospitalListImage = [
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_exam_sublist_/image2.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_exam_sublist_/image1.png",
  ];
  var kidsCafeListImage = [
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_kidscafe_sublist/image1.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_kidscafe_sublist/image2.png",
  ];
  var experienceListImage = [
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_experience_sublist/image1.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_experience_sublist/image2.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_experience_sublist/image3.png",
    "https://uahage.s3.ap-northeast-2.amazonaws.com/images_experience_sublist/image4.png",
  ];
  mainImage(image, screenWidth) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.fitWidth,
    );
  }

  @override
  Widget build(BuildContext context) {
    PlaceController.to.changePageCounter(1);
    ScreenUtil.init(context, width: 720, height: 1280);
    return WillPopScope(
      onWillPop: () {
        Get.back();
        return;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xffff7292)),
                onPressed: () {
                  Navigator.pop(context, bookmark.toString());
                  print(bookmark.toString());
                },
              ),
              title: Text(
                '${data.name}',
                style: TextStyle(
                    color: Color(0xffff7292),
                    fontFamily: "NotoSansCJKkr_Medium",
                    fontSize: 30.0.sp),
              ),
            ),
          ),
          body: ListView(
            //  controller: _scrollController,
            //  physics: enabled ? NeverScrollableScrollPhysics() : ScrollPhysics(),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 450.w,
                    child: Stack(
                      children: [
                        PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return mainImage(restaurantListImage[0], 720.w);
                          },
                          onPageChanged: (int page) {
                            controller.changePageCounter(page + 1);
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: new BoxDecoration(
                                color: Colors.pink[200].withOpacity(0.8),
                                borderRadius: BorderRadius.circular(20.0)),
                            margin: EdgeInsets.only(bottom: 16.w, right: 16.w),
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            child: Obx(() => Text(
                                  '${controller.pageCounter.value}/2',
                                  style: TextStyle(
                                    fontSize: 32.sp,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 35.w, top: 26.h, bottom: 10.h),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 590.w,
                                child: boldfont(data.name, 39, Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 29.w,
                                ),
                              ),
                              Obx(
                                () => IconButton(
                                  padding: EdgeInsets.all(0),
                                  constraints: BoxConstraints(
                                      maxWidth: 33.w, maxHeight: 33.h),
                                  icon: Image.asset(
                                      controller.place[index].bookmark == 0
                                          ? "./assets/listPage/love_grey.png"
                                          : "./assets/listPage/love_color.png",
                                      height: 33.w),
                                  onPressed: () async {
                                    if (controller.place[index].bookmark == 0) {
                                      await bookmark.bookmarkCreate(
                                          UserController.to.userId.value,
                                          data.id);
                                      print("bookmark : ${data.id}");
                                      controller.setPlaceBookmark(index, 1);
                                    } else {
                                      await bookmark.bookmarkDelete(
                                          UserController.to.userId.value,
                                          data.id);
                                      print("bookmark : ${data.id}");
                                      controller.setPlaceBookmark(index, 0);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                            top: 3.3.h,
                          )),
                          Row(
                            children: [
                              RatingBar(
                                onRatingUpdate: null,
                                ignoreGestures: true,
                                allowHalfRating: true,
                                itemPadding: EdgeInsets.only(right: 12.w),
                                itemSize: 38.w,
                                ratingWidget: RatingWidget(
                                  full: Image.asset(
                                    'assets/listPage/star_color.png',
                                    // width: 1.3.h,
                                  ),
                                  half: Image.asset(
                                    'assets/listPage/star_half.png',
                                    // width: 1.3.h,
                                  ),
                                  empty: Image.asset(
                                    'assets/listPage/star_grey.png',
                                    // width: 1.3.h,
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 12.w)),
                              boldfont("3.5", 30, Color(0xff4d4d4d)),
                              Padding(padding: EdgeInsets.only(left: 12.w)),
                              normalfont(
                                '3명이 평가에 참여했습니다',
                                25,
                                Color(0xffc6c6c6),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 2.h,
                    color: Color(0xfff7f7f7),
                  ),

                  //information e.x. address

                  Container(
                    child: Container(
                      padding: EdgeInsets.only(left: 35.w, right: 23.8.w),
                      width: MediaQuery.of(context).size.width,
                      // alignment: Alignment.center,
                      //  height: 520 .h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                            top: 17.8.w,
                          )),
                          normalfont("주소", 30, Color(0xff4d4d4d)),
                          // Padding(padding: EdgeInsets.only(top: 10.w)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 496.w,
                                child: normalfont(
                                    "${data.address}", 30, Color(0xff808080)),
                              ),
                              GestureDetector(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "./assets/sublistPage/copy.png",
                                      width: 120.w,
                                      height: 37.h,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  FlutterClipboard.copy(data.address);
                                  toast(context, "주소가 복사되었습니다");
                                },
                              )
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(top: 26.w)),
                          normalfont("연락처", 30, Color(0xff4d4d4d)),
                          // Padding(
                          //     padding: EdgeInsets.only(
                          //   top: 10.w,
                          // )),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 496.w,
                                child: normalfont(
                                    "${data.phone}", 30, Color(0xff808080)),
                              ),
                              GestureDetector(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "./assets/sublistPage/call.png",
                                      width: 120.w,
                                      height: 37.h,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  FlutterClipboard.copy(data.address);
                                  toast(context, "번호가 복사되었습니다");
                                },
                              )
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                            top: 26.w,
                          )),
                          normalfont(
                            "영업시간",
                            30,
                            Color(0xff4d4d4d),
                          ),

                          Container(
                            width: 496.w,
                            child: normalfont(
                              "오전 11:30 ~ 21:00(샐러드바 마감 20:30) 브레이크타임 15:00~17:00",
                              30,
                              Color(0xff808080),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                            top: 30.w,
                          )),
                        ],
                      ),
                    ),
                  ),

                  // grey seperator
                  Container(
                    height: 26.w,
                    color: Color(0xfff7f7f7),
                  ),

                  // price container
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.only(
                        top: 30.2.w, bottom: 30.2.w, left: 35.w, right: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalfont(
                          "매장정보",
                          30,
                          Color(0xff4d4d4d),
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.w)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            normalfont(
                              "애슐리퀸즈 평일 런치",
                              30,
                              Color(0xff808080),
                            ),
                            regularfont("15,900원", 30, Color(0xffc6c6c6))
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.w)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            normalfont(
                              "애슐리퀸즈 평일 디너",
                              30,
                              Color(0xff808080),
                            ),
                            regularfont("22,900원", 30, Color(0xffc6c6c6))
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 8.w)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            normalfont(
                              "애슐리퀸즈 주말/공휴일",
                              30,
                              Color(0xff808080),
                            ),
                            regularfont("25,900원", 30, Color(0xffc6c6c6))
                          ],
                        ),
                      ],
                    ),
                  ),
                  // grey seperator
                  Container(
                    height: 26.w,
                    color: Color(0xfff7f7f7),
                  ),
                  (() {
                    if (placeCode == 1) {
                      return Container(
                        padding: EdgeInsets.only(
                            top: 33.w, left: 35.w, right: 42.9.w),
                        child: Container(
                          // height: 928.h,
                          padding: EdgeInsets.only(bottom: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  normalfont("편의시설", 30, Color(0xff4d4d4d)),
                                  regularfont(
                                      "업데이트 2021.04.21", 24, Color(0xffc6c6c6))
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 28.w)),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data.menu == "1"
                                        ? Image.asset(
                                            imagecolor[0],
                                            width: 102.w,
                                            height: 143.h,
                                          )
                                        : Image.asset(
                                            imagegrey[0],
                                            width: 102.w,
                                            height: 143.h,
                                          ),
                                    data.bed == "1"
                                        ? Image.asset(
                                            imagecolor[1],
                                            width: 102.w,
                                            height: 143.h,
                                          )
                                        : Image.asset(
                                            imagegrey[1],
                                            width: 102.w,
                                            height: 143.h,
                                          ),
                                    data.tableware == "1"
                                        ? Image.asset(
                                            imagecolor[2],
                                            width: 102.w,
                                            height: 143.h,
                                          )
                                        : Image.asset(
                                            imagegrey[2],
                                            width: 102.w,
                                            height: 143.h,
                                          ),
                                    data.meetingroom == "1"
                                        ? Image.asset(
                                            imagecolor[3],
                                            width: 102.w,
                                            height: 143.h,
                                          )
                                        : Image.asset(
                                            imagegrey[3],
                                            width: 102.w,
                                            height: 143.h,
                                          ),
                                    data.diapers == "1"
                                        ? Image.asset(
                                            imagecolor[4],
                                            width: 113.w,
                                            height: 140.h,
                                          )
                                        : Image.asset(
                                            imagegrey[4],
                                            width: 113.w,
                                            height: 140.h,
                                          ),
                                  ]),
                              Padding(padding: EdgeInsets.only(top: 24.w)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  data.playroom == "1"
                                      ? Image.asset(
                                          imagecolor[5],
                                          width: 102.w,
                                          height: 143.h,
                                        )
                                      : Image.asset(
                                          imagegrey[5],
                                          width: 102.w,
                                          height: 143.h,
                                        ),
                                  data.carriage == "1"
                                      ? Image.asset(
                                          imagecolor[6],
                                          width: 102.w,
                                          height: 143.h,
                                        )
                                      : Image.asset(
                                          imagegrey[6],
                                          width: 102.w,
                                          height: 143.h,
                                        ),
                                  data.nursingroom == "1"
                                      ? Image.asset(
                                          imagecolor[7],
                                          width: 102.w,
                                          height: 143.h,
                                        )
                                      : Image.asset(
                                          imagegrey[7],
                                          width: 102.w,
                                          height: 143.h,
                                        ),
                                  data.chair == "1"
                                      ? Image.asset(
                                          imagecolor[8],
                                          width: 102.w,
                                          height: 143.h,
                                        )
                                      : Image.asset(
                                          imagegrey[8],
                                          width: 102.w,
                                          height: 143.h,
                                        ),
                                  Padding(
                                      padding: EdgeInsets.only(right: 100.w)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                      //not changed yet
                    } else if (placeCode == 2) {
                      return Container(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            left: 75.w,
                            top: 50.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              normalfont("검진항복", 58, Color(0xff4d4d4d)),
                              Padding(padding: EdgeInsets.only(top: 10.h)),
                              normalfont(
                                  "${data.examination}", 58, Color(0xff808080)),
                              Padding(padding: EdgeInsets.only(top: 50.h)),
                            ],
                          ),
                        ),
                      );
                    }
                    //not changed yet
                    else {
                      return Container(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            left: 75.w,
                            top: 50.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              normalfont("관람 / 체험료", 58, Color(0xff4d4d4d)),
                              Padding(padding: EdgeInsets.only(top: 10.h)),
                              normalfont("${data.fare}", 58, Color(0xff808080)),
                              Padding(padding: EdgeInsets.only(top: 50.h)),
                            ],
                          ),
                        ),
                      );
                    }
                  }()),

                  // grey seperator
                  Container(
                    height: 26.w,
                    color: Color(0xfff7f7f7),
                  ),

                  //graphic design not finished yet
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding:
                        EdgeInsets.only(top: 24.w, left: 35.w, right: 104.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        normalfont("방문자 평가분석", 30, Color(0xff4d4d4d)),
                        regularfont("54명이 평가에 참여했습니다.", 25, Color(0xffc6c6c6)),
                        normalfont("3.5", 45, Color(0xffff728e)),
                      ],
                    ),
                  ),

                  // grey seperator
                  Container(
                    height: 26.w,
                    color: Color(0xfff7f7f7),
                  ),

                  // map
                  Container(
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 35.w,
                              top: 36.h,
                            ),
                            child: normalfont("위치", 30, Color(0xff4d4d4d)),
                          ),
                          Padding(padding: EdgeInsets.only(top: 26.w)),
                          Container(
                            height: 567.h,
                            child: WebView(
                              // gestureNavigationEnabled: true,
                              onWebViewCreated:
                                  (WebViewController webViewController) {
                                _controller = webViewController;
                                _controller.loadUrl(url +
                                    '/maps/show-place-name?placeName=${data.name}&placeAddress=${data.address}');
                              },
                              javascriptMode: JavascriptMode.unrestricted,
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    height: 87.w,
                    child: Center(
                      child: Image.asset(
                        "./assets/sublistPage/modify.png",
                        height: 45.w,
                      ),
                    ),
                  ),

                  // start of rating
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
