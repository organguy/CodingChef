import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: 'Welcome to my app',
            body: 'This is the 1st page',
            image: Image.asset('assets/tutorial_page_1.png'),
            decoration: getPageDecoration()
        ),
        PageViewModel(
            title: 'Welcome to my app',
            body: 'This is the 2nd page',
            image: Image.asset('assets/tutorial_page_2.png'),
            decoration: getPageDecoration()
        ),
        PageViewModel(
            title: 'Welcome to my app',
            body: 'This is the 3rd page',
            image: Image.asset('assets/tutorial_page_3.png'),
            decoration: getPageDecoration()
        ),
        PageViewModel(
            title: 'Welcome to my app',
            body: 'This is the 4th page',
            image: Image.asset('assets/tutorial_page_4.png'),
            decoration: getPageDecoration()
        ),
      ],
      done: const Text('done'),
      onDone: () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnBoardingMyPage())
        );
      },
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text('skip'),
      dotsDecorator: DotsDecorator(
        color: Colors.cyan,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        activeColor: Colors.red
      ),
      curve: Curves.bounceOut,
    );
  }

  PageDecoration getPageDecoration(){
    return const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold
      ),
      bodyTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue
      ),
      imagePadding: EdgeInsets.only(top: 40.0),
      pageColor: Colors.orange
    );
  }
}

class OnBoardingMyPage extends StatelessWidget {
  const OnBoardingMyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Main Screen',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const OnBoardingPage())
                  );
                },
                child: const Text('Go to onboarding screen'))
          ],
        ),
      ),
    );
  }
}
