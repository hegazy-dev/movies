import 'package:flutter/material.dart';
import 'package:movies/onboarding/on_boarding2.dart';
import 'package:movies/onboarding/on_boarding3.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key, required void Function() onExplore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111713),

      body: Stack(
        children: [
        
          Positioned.fill(
            child: Image.asset(
              'assets/images/Movies Posters.png',
              fit: BoxFit.cover,
            ),
          ),

          
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.15),
                    Colors.black.withOpacity(0.95),
                  ],
                  stops: const [0.45, 0.65, 1.0],
                ),
              ),
            ),
          ),

         
          Positioned(
            left: 25,
            right: 25,
            bottom: 35,

            child: Column(
              children: [
                
                const Text(
                  'Find Your Next\nFavorite Movie Here',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    height: 1.25,
                  ),
                ),

                const SizedBox(height: 30),

                
                const Text(
                  'Get access to a huge library of movies\n'
                  'to suit all tastes. You will surely like it.',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 30),

               
                SizedBox(
                  width: double.infinity,
                  height: 65,

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingPage2(
                            onNext: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OnboardingPage3(),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffc107),

                      foregroundColor: Colors.black,

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),

                    child: const Text(
                      'Explore Now',

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
