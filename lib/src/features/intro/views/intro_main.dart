import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tabpay_app/gen/assets.gen.dart';
import 'package:tabpay_app/gen/fonts.gen.dart';
import 'package:tabpay_app/src/routes/app_router.gr.dart';
import 'package:tabpay_app/tabpay_core/tabpay_core.dart';
import 'package:tabpay_app/tabpay_core/utils/shared_prefs.dart';

class IntroItem {
  String title, subtitle, image, backgroundImage;
  IntroItem(
      {required this.title,
      required this.subtitle,
      required this.image,
      required this.backgroundImage});
}

@RoutePage()
class InstructionPage extends StatefulWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  InstructionPageState createState() => InstructionPageState();
}

class InstructionPageState extends State<InstructionPage> {
  late int currentIndex;
  bool value = false;
  bool isChecked = false;

  final ScrollController controller = ScrollController(initialScrollOffset: 0);
  final CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<IntroItem> introItems = [
      IntroItem(
        title: "No more asking \naccount number",
        subtitle: "",
        image: Assets.images.introduction.intro1.path,
        backgroundImage: Assets.images.introduction.introBg1.path,
      ),
      IntroItem(
        title: "Easy to Use",
        subtitle: "Just tap & tap devices",
        image: Assets.images.introduction.intro2.path,
        backgroundImage: Assets.images.introduction.introBg2.path,
      ),
      IntroItem(
        title: "Welcome",
        subtitle: "Please sign with your phone and continue.",
        image: Assets.images.introduction.intro2.path,
        backgroundImage: Assets.images.introduction.introBg3.path,
      ),
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Expanded(
                child: CarouselSlider.builder(
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    autoPlay: false,
                    viewportFraction: 1,
                    aspectRatio: 1,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                        controller.animateTo(
                            (currentIndex * introItems.length - 20),
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      });
                    },
                  ),
                  itemCount: introItems.length,
                  itemBuilder: (context, index, realIndex) {
                    return Stack(
                      children: [
                        Container(
                          // width: size.width / 3 * (index + 1),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                alignment: const Alignment(0, -0.5),
                                image: AssetImage(
                                    introItems[index].backgroundImage),
                                fit: BoxFit.contain),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset(
                                introItems[index].image,
                                fit: BoxFit.contain,
                                height: 250,
                                width: 300,
                              ),
                              Column(
                                children: [
                                  Text(
                                    introItems[index].title,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: index != 2
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    constraints: BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                3 /
                                                4),
                                    child: Center(
                                      child: Text(introItems[index].subtitle,
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: TextStyle(
                                              fontFamily:
                                                  FontFamily.codeNextSemiBold,
                                              color: index != 2
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 13)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: size.height > 720 ? 50 : 25,
            width: size.width,
            child: Padding(
                padding: EdgeInsets.only(left: getSize(20), right: getSize(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: CheckBoxWidget(
                        textColor: currentIndex == 2
                            ? Colors.white
                            : HexColor("#04715E"),
                        isCheck: isChecked,
                        onResult: (value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                        title: "Never show",
                        checkColor: currentIndex == 2
                            ? HexColor("#04715E")
                            : Colors.white,
                        fillColor: currentIndex == 2
                            ? Colors.white
                            : HexColor("#04715E"),
                        borderColor: currentIndex == 2
                            ? Colors.white
                            : HexColor("#04715E"),
                      ),
                    ),
                    // InkWell(
                    //   key: const Key("instruction_skip"),
                    //     child: Text(
                    //       AppLocalizations.of(context)!.intro_page_button_skip,
                    //       style: TextStyle(
                    //           fontSize: 13,
                    //           fontFamily: FontFamily.codeNextSemiBold,
                    //           color: MonpayTheme().color.defaultTextWhite),
                    //     ),
                    //     onTap: () {
                    //       SharedPrefs().isInstructionShow = isChecked;
                    //       AutoRouter.of(context).replace(const HomeRoute());
                    //     })
                  ],
                )),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.only(
                      bottom: getSize(30),
                      left: getSize(30),
                      right: getSize(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            controller: controller,
                            scrollDirection: Axis.horizontal,
                            child: AnimatedSmoothIndicator(
                              count: introItems.length,
                              activeIndex: currentIndex,
                              axisDirection: Axis.horizontal,
                              effect: ExpandingDotsEffect(
                                  expansionFactor: 4,
                                  activeDotColor: currentIndex == 2
                                      ? Colors.white
                                      : HexColor("#04715E"),
                                  dotHeight: 6,
                                  dotWidth: 6,
                                  dotColor: currentIndex == 2
                                      ? Colors.white
                                      : HexColor("#04715E")),
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: currentIndex == 2
                                      ? Colors.white
                                      : HexColor("#04715E"),
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              constraints: const BoxConstraints(
                                  maxHeight: 50, maxWidth: 50),
                              child: TextButton(
                                onPressed: () {
                                  if (currentIndex != introItems.length - 1) {
                                    buttonCarouselController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.linear);
                                  } else {
                                    SharedPrefs().isIntroSkip = isChecked;
                                    AutoRouter.of(context)
                                        .replace(const LoginMainRoute());
                                  }
                                },
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: currentIndex == 2
                                      ? HexColor("#04715E")
                                      : Colors.white,
                                  // color: MonpayTheme().color.deepPurple_A200),
                                ),
                              ))),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
