import 'package:flutter/material.dart';
import 'package:tween_animation_ui/constants.dart';

import '../common.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(this.index, {super.key});
  final int index;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {
  late final Animation<Offset> mainBodySlideUpAnimation;
  late final Animation<double> mainTimeFadeInAnimation;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    mainTimeFadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1.0, curve: Curves.ease)));
    mainBodySlideUpAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -0.1))
            .animate(CurvedAnimation(
                parent: controller,
                curve: const Interval(0.5, 1.0, curve: Curves.ease)));

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: HeaderAppBar(index: widget.index, controller: controller),
        body: Column(
      children: [
        HeaderAppBar(index: widget.index, controller: controller),
        SlideTransition(
            position: mainBodySlideUpAnimation,
            child: Column(
              children: [
                Positioned(
                  top: 300,
                  child: BodyMainInfoWidget(
                    index: widget.index,
                    controller: controller,
                  ),
                ),
                DetailContent(
                  index: widget.index,
                ),
              ],
              // ),
            )),
      ],
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class DetailContent extends StatelessWidget {
  const DetailContent({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 16,),
          SizedBox( child: Text(sampleContentList[index]["content"]!,)),
        ],
      ),
    );
  }
}

class BodyMainInfoWidget extends StatefulWidget {
  const BodyMainInfoWidget({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  final AnimationController controller;

  @override
  State<BodyMainInfoWidget> createState() => _BodyMainInfoWidgetState();
}

class _BodyMainInfoWidgetState extends State<BodyMainInfoWidget> {
  late final Animation<double> calendarScaleUpAnimation;
  late final Animation<double> gpsIconScaleUpFadeInAnimation;
  late final Animation<double> timerScaleUpFadeInAnimation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    calendarScaleUpAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.7, curve: Curves.ease)));
    //for scale, fade in
    gpsIconScaleUpFadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.25, 0.7, curve: Curves.ease)));
    //for scale, fade in
    timerScaleUpFadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1.0, curve: Curves.ease)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Hero(
        tag: "content${widget.index}",
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ScaleTransition(
                        scale: calendarScaleUpAnimation,
                        child: const Calendar(),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        child: Text(sampleContentList[widget.index]["title"]!,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ScaleTransition(
                          scale: gpsIconScaleUpFadeInAnimation,
                          child: const Icon(
                            Icons.location_pin,
                            color: AppColor.primaryColor,
                          )),
                      const SizedBox(width: 5),
                      FadeTransition(
                        opacity: gpsIconScaleUpFadeInAnimation,
                        child:
                        Expanded(child: Text(sampleContentList[widget.index]["location"]!)),)
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ScaleTransition(
                          scale: timerScaleUpFadeInAnimation,
                          child: const Icon(
                            Icons.access_time_filled,
                            color: AppColor.primaryColor,
                          )),
                      const SizedBox(width: 5),
                      FadeTransition(
                          opacity: timerScaleUpFadeInAnimation,
                          child: Container(child: Text("9:00 AM - 6:00 PM")))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderAppBar extends StatefulWidget with PreferredSizeWidget {
  const HeaderAppBar(
      {super.key, required this.index, required this.controller});

  final int index;
  final AnimationController controller;

  @override
  State<HeaderAppBar> createState() => _HeaderAppBarState();
  @override
  Size get preferredSize => const Size(500, 300);
}

class _HeaderAppBarState extends State<HeaderAppBar> {
  late final Animation<Offset> headerBodySlideAnimation;

  @override
  void initState() {
    headerBodySlideAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -0.1))
            .animate(CurvedAnimation(
                parent: widget.controller,
                curve: const Interval(0.5, 1.0, curve: Curves.ease)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: "test${widget.index}",
        child: Container(
          height: 300,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/bunny.jpg",
                  )),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              )),
        ));
  }
}
