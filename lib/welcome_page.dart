import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/pages/home_page.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          // first its the LOGO (image or icon) at the top
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 40, top: 100),
            child: Image.asset('lib/images/egg.png'),
          ),

          // second part will be the welcome message
          Padding(
            padding: const EdgeInsets.all(25),
            child: Text(
              "We deliver quality right at your doorstep",
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                textStyle: const TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
                )
              ),
            ),
          ),

          //followed by its subtitle
          Text(
            'We will take care of your health',
            textAlign: TextAlign.center,
            style: TextStyle( fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey[500]),
          ),

          const Spacer(),

          //last will be the -Get Started- button

          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
            {
              return const HomePage();
            }
            )),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.tealAccent[400],
                  borderRadius: BorderRadius.circular(12)),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
            ),
          ),

          const Spacer(),
        ],
      )),
    );
  }
}
