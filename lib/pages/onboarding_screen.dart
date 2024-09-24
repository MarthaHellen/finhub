import 'package:flutter/material.dart';
import 'package:finhub/pages/sign_in.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  final List<Widget> _fragments = const [
    OnboardingFragment(text: '1'),
    OnboardingFragment(text: '2'),
    OnboardingFragment(text: '3', lastFragment: true),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  void _nextPage() {
    if (_currentPage < _fragments.length - 1) {
      setState(() {
        _currentPage++;
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    } else {
      _navigateToLogin();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
        _pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    }
  }

  Widget _buildProgressDots() {
    List<Widget> dots = [];
    for (int i = 0; i < _fragments.length; i++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentPage == i ? const Color(0xFF4246B7) : Colors.grey,
            ),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: _fragments,
            ),
            if (_currentPage != 0) Positioned(
              top: 30,
              left: 20,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF2B5BBA).withOpacity(0.29),
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: _previousPage,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2B5BBA),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.chevron_right),
                      onPressed: _nextPage,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: Row(
                children: [
                  _buildProgressDots(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingFragment extends StatelessWidget {
  final String text;
  final bool lastFragment;

  const OnboardingFragment({
    Key? key,
    required this.text,
    this.lastFragment = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text == '1'
        ? Center(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              color: Colors.white,
              child: Column(
                children: [
                  Lottie.asset('animations/money-saving.json',
                      height: 300,
                      reverse: true,
                      repeat: true,
                      fit: BoxFit.contain),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: AlignmentDirectional.topStart,
                    child: const Text(
                      'Save And Invest',
                      style: TextStyle(
                        fontSize: 30,
                        color: Color(0xFF050901),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: const Text(
                      'At FinHub, we help you save your money and also invest it in productive activities so that it can generate profits for you. This helps you be prepared financially and prepare you for your post-education financial freedom',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF433D3D),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          )
        : text == '2'
            ? Center(
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Lottie.asset('animations/loan.json',
                          height: 300,
                          reverse: true,
                          repeat: true,
                          fit: BoxFit.contain),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          'Quick Loans',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF050901),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Text(
                          "Do you need a quick loan? Maybe you need to cover your campus expenses such as tuition, and other basic needs; don't worry, we've got you covered. We give quick loans to students with financial needs",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF433D3D),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: Container(
                  padding: EdgeInsets.only(top: 50),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Lottie.asset('animations/online-learning-platform.json',
                          height: 300,
                          reverse: true,
                          repeat: true,
                          fit: BoxFit.cover),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        alignment: AlignmentDirectional.topStart,
                        child: const Text(
                          'Financial literacy',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF050901),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Text(
                          "Having some financial literacy is very crucial as it can help you succeed financially. At Finhub, we help prepare you financially and teach you different ways of handling your finances such as savings, investments etc.",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF433D3D),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}
