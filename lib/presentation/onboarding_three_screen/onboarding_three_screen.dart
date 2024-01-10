import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';

class OnboardingThreeScreen extends StatelessWidget {
  OnboardingThreeScreen({Key? key})
      : super(
          key: key,
        );

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgOnboardingThree,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: 768,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 29,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 739,
                  child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 699,
                            width: 327,
                            margin: EdgeInsets.only(bottom: 5),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgImage,
                                  height: 422,
                                  width: 313,
                                  alignment: Alignment.topCenter,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    height: 367,
                                    width: 327,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 41,
                                          vertical: 32,
                                        ),
                                        decoration:
                                            AppDecoration.white.copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder32,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 214,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 14),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          "Application surely viewed by ",
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                    TextSpan(
                                                      text: "each company",
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              width: 243,
                                              margin: EdgeInsets.only(top: 14),
                                              child: Text(
                                                "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleSmallGray500SemiBold_1
                                                    .copyWith(
                                                  height: 1.57,
                                                ),
                                              ),
                                            ),
                                            CustomElevatedButton(
                                              width: 156,
                                              text: "Get Started",
                                              margin: EdgeInsets.only(top: 69),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 718,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgImage361x283,
                                  height: 361,
                                  width: 283,
                                  alignment: Alignment.topCenter,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 335,
                                    width: 327,
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 39,
                                          vertical: 32,
                                        ),
                                        decoration:
                                            AppDecoration.white.copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder32,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 246,
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "The best app for ",
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "Find Your Dream Job",
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              width: 243,
                                              margin: EdgeInsets.only(top: 18),
                                              child: Text(
                                                "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleSmallGray500SemiBold_1
                                                    .copyWith(
                                                  height: 1.57,
                                                ),
                                              ),
                                            ),
                                            CustomElevatedButton(
                                              width: 101,
                                              text: "Next",
                                              margin: EdgeInsets.only(top: 69),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 713,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 1,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgImage369x306,
                                  height: 369,
                                  width: 306,
                                  alignment: Alignment.topCenter,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 335,
                                    width: 327,
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 32,
                                        ),
                                        decoration:
                                            AppDecoration.white.copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder32,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 273,
                                              margin: EdgeInsets.only(left: 6),
                                              child: RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: "Better ",
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          "future is starting from you",
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              width: 243,
                                              margin: EdgeInsets.only(
                                                left: 17,
                                                top: 14,
                                                right: 17,
                                              ),
                                              child: Text(
                                                "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem . ",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleSmallGray500SemiBold_1
                                                    .copyWith(
                                                  height: 1.57,
                                                ),
                                              ),
                                            ),
                                            CustomElevatedButton(
                                              width: 101,
                                              text: "Next",
                                              margin: EdgeInsets.only(top: 69),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      spacing: 12,
                      activeDotColor: theme.colorScheme.primary,
                      dotColor: theme.colorScheme.primary.withOpacity(0.41),
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                    onDotClicked: (value) {
                      pageController.jumpToPage(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
