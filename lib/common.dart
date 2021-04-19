import 'package:flutter/material.dart';
import 'package:tween_animation_ui/constants.dart';

var sampleContentList = [
  {
    "dayOfWeek": "Sun",
    "day": "08",
    "image": "assets/images/bunny.jpg",
    "title": "Bunny Music Concert: Live",
    "location": "Hitech City, Hyderabad",
    "content":
        "Lorem ipsum dolor sit amet. In velit quae ut omnis molestiae ut fugit sunt sit ipsum rerum hic officia nulla ut rerum illo. Et voluptatum doloribus sed officiis veniam et labore libero non quibusdam doloribus aut accusantium exercitationem in tempore laborum. Ut totam obcaecati a placeat quam et suscipit perspiciatis est quia consectetur et perspiciatis corrupti. "
  },
  {
    "dayOfWeek": "Thu",
    "day": "19",
    "image": "assets/images/bunny.jpg",
    "title": "World Dog Expo by DOOG",
    "location": "North Street, Hyderabad",
    "content":
        "Lorem ipsum dolor sit amet. In velit quae ut omnis molestiae ut fugit sunt sit ipsum rerum hic officia nulla ut rerum illo. Et voluptatum doloribus sed officiis veniam et labore libero non quibusdam doloribus aut accusantium exercitationem in tempore laborum. Ut totam obcaecati a placeat quam et suscipit perspiciatis est quia consectetur et perspiciatis corrupti."
  },
  {
    "dayOfWeek": "Mon",
    "day": "23",
    "image": "assets/images/bunny.jpg",
    "title": "Complete Dog Solution",
    "location": "12-N Andheri West",
    "content":
        "Lorem ipsum dolor sit amet. In velit quae ut omnis molestiae ut fugit sunt sit ipsum rerum hic officia nulla ut rerum illo. Et voluptatum doloribus sed officiis veniam et labore libero non quibusdam doloribus aut accusantium exercitationem in tempore laborum. Ut totam obcaecati a placeat quam et suscipit perspiciatis est quia consectetur et perspiciatis corrupti."
  }
];

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      width: 50,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text("Mar", style: TextStyle(color: Colors.white)),
          Text("23", style: TextStyle(fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
