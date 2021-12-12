import 'package:allworkpro/constants/string_contants.dart';
import 'package:allworkpro/constants/theme.dart';
import 'package:allworkpro/presentation/features/onboarding/widgets/onboarding_page_content.dart';
import 'package:allworkpro/presentation/features/onboarding/widgets/onboarding_pages_background.dart';
import 'package:flutter/material.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages();

  @override
  _OnboardingPagesState createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  int _currentPage = 0;
  final int _numPages = 3;
  final PageController _pageController = PageController();

  List<Widget> buildPageIndicator() {
    final List<Widget> list = <Widget>[];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: isActive ? accentColor : whiteColor,
        border: Border.all(width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const OnboardingPagesBackground(appName),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: <Widget>[
                OnboardingPageContent(
                  indicatorList: buildPageIndicator(),
                  imagePath: onboardingPageOneImage,
                  title: 'JOBS!',
                  subtitle: 'JOBS THAT MATCH YOUR SKILL!',
                  content:
                      'Get professional well paying jobs that match your skill at your convinence!',
                  buttonText: skipButtonText,
                ),
                OnboardingPageContent(
                  indicatorList: buildPageIndicator(),
                  imagePath: onboardingPageTwoImage,
                  title: 'SERVICES!',
                  subtitle: 'GET PROFESSIONAL SERVICES!',
                  content:
                      'Get services from well trained professionals with industry leading skills!',
                  buttonText: skipButtonText,
                ),
                OnboardingPageContent(
                  indicatorList: buildPageIndicator(),
                  imagePath: onboardingPageThreeImage,
                  title: 'SAFETY!!',
                  subtitle: 'SAFE ENVIRONMENT FOR ALL PARTIES!',
                  content:
                      'Get to work or get your work done for you with peace of mind knowing safety is a priority on the platform.',
                  buttonText: finishButtonText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
