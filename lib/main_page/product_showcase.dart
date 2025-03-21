import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProductShowcase extends StatefulWidget {
  const ProductShowcase({super.key});

  @override
  State<ProductShowcase> createState() => _ProductShowcaseState();
}

class _ProductShowcaseState extends State<ProductShowcase> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController.fromVideoId(
      videoId: 'K_G_gr3GQM4',
      autoPlay: false,
      params: YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(  // Belirli bir boyut vermek için SizedBox ekledik
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 64) ,
          child: Animate(
            effects: [
              FadeEffect(
                delay: 300.milliseconds,
                duration: 800.milliseconds,
                begin: 0.5,
                end: 1,
              ),
              MoveEffect(
                delay: 300.milliseconds,
                duration: 800.milliseconds,
                begin: const Offset(0, 50),
                end: const Offset(0, -25),
                curve: Curves.easeInOut,
              ),
            ],
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  AnimatedTitle(),
                  const Text(
                    'Streamline your invoice management with AI-powered analysis',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 30,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: MediaQuery.of(context).size.width * 0.45,
                                    color: Colors.black,
                                    child: YoutubePlayer(
                                      controller: _controller,
                                      aspectRatio: 16 / 9,
                                    ),
                                  ),
                                ),
                                // Kapat butonu
                                Positioned(
                                  top: -15,
                                  right: -15,
                                  child: GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(5),
                                      child: const Icon(Icons.close, color: Colors.black, size: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Resim
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/phone_canvas.png',
                              width: 720,
                            ),
                          ),
                          // Play butonu
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.8),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: const Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedTitle extends StatefulWidget {
  const AnimatedTitle({super.key});

  @override
  State<AnimatedTitle> createState() => _AnimatedTitleState();
}

class _AnimatedTitleState extends State<AnimatedTitle> {
  final List<String> _texts = [
    'Discover the Future of Invoicing',
    'with InvoiX'
  ];
  int _currentIndex = 0;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;

      // Fade out
      setState(() => _opacity = 0.0);
      await Future.delayed(const Duration(milliseconds: 500));
      if (!mounted) return;

      // Change text
      setState(() {
        _currentIndex = (_currentIndex + 1) % _texts.length;
      });

      // Fade in
      setState(() => _opacity = 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _opacity,
        child: Text(
          _texts[_currentIndex],
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}