import 'package:flutter/material.dart';
import 'package:movies/onboarding/on_boarding4.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111713),

      body: Stack(
        children: [

       
          Positioned.fill(
            child: Image.asset(
              'assets/images/img3.jpg',
              fit: BoxFit.cover,
            ),
          ),

          

          Positioned(
            left: 0,
            right: 0,
            bottom: -20,

            child: Container(
              padding: const EdgeInsets.fromLTRB(
                25,
                35,
                25,
                25,
              ),

              decoration: const BoxDecoration(
                color: Colors.black,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [

                 
                  const Text(
                    'Explore All Genres',
                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                 
                  const Text(
                    'Discover movies from every genre, in all '
                    'available qualities. Find something new '
                    'and exciting to watch every day.',

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 25),

                 

                  SizedBox(
                    width: double.infinity,
                    height: 65,

                    child: ElevatedButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingPage4(),
                          ),
                        );

                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xffffc107),

                        foregroundColor: Colors.black,

                        elevation: 0,

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                      ),

                      child: const Text(
                        'Next',

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                 

                  SizedBox(
                    width: double.infinity,
                    height: 65,

                    child: OutlinedButton(
                      onPressed: () {

                        Navigator.pop(context);

                      },

                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                            const Color(0xffffc107),

                        side: const BorderSide(
                          color: Color(0xffffc107),
                          width: 2,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20),
                        ),
                      ),

                      child: const Text(
                        'Back',

                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



