import 'dart:async';

import '../../../librearies.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  double? height, width;
  final pageViewController = PageController(initialPage: 0);
  int currentPage = 0;
  DateTime? currentBackPressTime;

  late ThemeChangerViewModel themeChangerViewModel;

  @override
  void initState() {
    super.initState();

    themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
        navigatorKey.currentContext!,
        listen: false);

    Timer.periodic(
      const Duration(seconds: 5),
      (Timer time) {
        if (currentPage < 3) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageViewController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
        doubleBackPress: true,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageViewController,
                onPageChanged: onChanged,
                children: [
                  page(
                      imgPath: "assets/common/images/onboarding1.png",
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                      heading: "Heading 1"),
                  page(
                      imgPath: "assets/common/images/onboarding2.png",
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                      heading: "Heading 2"),
                  page(
                      imgPath: "assets/common/images/onboarding3.png",
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                      heading: "Heading 3"),
                  page(
                      imgPath: "assets/common/images/onboarding4.png",
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                      heading: "Heading 4"),
                ],
              ),
            ),
            pageIndicator(),
            MasterSpacer.h.ten(),
          ],
        ));
  }

  pageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        currentPage != 3
            ? InkWell(
                onTap: () {
                  bypass();
                },
                child: Container(
                  width: 80,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeChangerViewModel.getGreyColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Skip',
                    style:
                        TextStyle(color: themeChangerViewModel.getPrimaryColor),
                  ),
                ),
              )
            : Container(width: 80),
        SmoothPageIndicator(
          controller: pageViewController,
          count: 4,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: themeChangerViewModel.getGreyColor,
            activeDotColor: themeChangerViewModel.getSecondaryColor,
          ),
        ),
        currentPage != 3
            ? InkWell(
                onTap: () {
                  setState(() {
                    currentPage++;
                  });
                  pageViewController.animateToPage(
                    currentPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  width: 80,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeChangerViewModel.getSecondaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Next',
                    style:
                        TextStyle(color: themeChangerViewModel.getPrimaryColor),
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  bypass();
                },
                child: Container(
                  width: 80,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: themeChangerViewModel.getWhiteColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Login',
                    style:
                        TextStyle(color: themeChangerViewModel.getPrimaryColor),
                  ),
                ),
              ),
      ],
    );
  }

  page(
      {required String imgPath,
      required String heading,
      required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: CompImage.showAsset(path: imgPath),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Headings.whiteTextStyle(
                  enumFontSize: EnumFontSize.extraLarge,
                  title: heading,
                  overflow: TextOverflow.clip,
                  align: TextAlign.center),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              Headings.whiteTextStyle(
                  title: text,
                  overflow: TextOverflow.clip,
                  align: TextAlign.center),
            ],
          )),
        ],
      ),
    );
  }

  void bypass() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }
}
