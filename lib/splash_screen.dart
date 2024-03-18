import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      // SystemUiMode.manual,overlays: SystemUiOverlay.values
        SystemUiMode.immersive
    );

    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    );

  }

  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,overlays: SystemUiOverlay.values
      //   SystemUiMode.immersive
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(

            children: [
              Center(
                child: ShaderMask(
                    shaderCallback: (bounds)=>
                        const LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.purpleAccent,
                              Colors.pinkAccent,
                              Colors.red,
                              Colors.amber,
                              Colors.deepOrange
                            ],
                            stops: [0.2,0.3,0.4,0.5,0.9,0.2],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            transform: GradientRotation(6/4)
                        ).createShader(bounds),
                    child: const FaIcon(FontAwesomeIcons.instagram, size: 135,color: Colors.white,)),
              ),
              Positioned(
                bottom: 60,
                  left: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("from",style: TextStyle(color: Colors.grey,fontSize: 20),),
                      Row(
                        children: [
                          ShaderMask(
                              shaderCallback: (bounds)=>
                                  const LinearGradient(
                                      colors: [
                                        Colors.purple,
                                        Colors.purpleAccent,
                                        Colors.pinkAccent,
                                        Colors.red,
                                        Colors.amber,
                                        Colors.deepOrange
                                      ],
                                      stops: [0.2,0.3,0.4,0.5,0.9,0.2],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      transform: GradientRotation(6/4)
                                  ).createShader(bounds),
                              child: const FaIcon(FontAwesomeIcons.affiliatetheme,size: 30,color: Colors.white,)),
                          ShaderMask(
                              shaderCallback: (bounds)=>
                                  const LinearGradient(
                                      colors: [
                                        Colors.deepOrange,
                                        Colors.amber,
                                        Colors.pinkAccent,
                                      ],
                                      stops: [0.4,0.5,0.1],
                                      // stops: [0.2,0.3,0.4,0.5,0.9,0.2],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      // transform: GradientRotation(6/4)
                                  ).createShader(bounds),
                              child: const Text(' CASTERs',style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w700),))
                        ],
                      )
                    ],
                  )
              )
            ],
        ),
      ),
      );
  }
}
