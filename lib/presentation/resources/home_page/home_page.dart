import 'package:flutter/widgets.dart';
import 'package:text202/models/feed_model.dart';
import 'package:text202/presentation/widgets/feed_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FeedModel> feeds = [
    const FeedModel(
      img:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg/1280px-Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg",
      title: "Image2",
      description:
          "lore ipsum this is nothing but bunch of fake text that may or may not make senseÒ",
    ),
    const FeedModel(
      img:
          "https://thumbs.dreamstime.com/b/morpho-butterfly-bright-shining-background-gold-blue-texture-background-golden-crumpled-paper-morpho-butterfly-bright-138179349.jpg",
      title: "Image3",
      description:
          "lore ipsum this is nothing but bunch of fake text that may or may not make senseÒ",
    ),
    const FeedModel(
      img:
          "https://wwd.com/wp-content/uploads/2021/07/Screenshot-2021-06-17-at-10.29.40.png",
      title: "Lisa",
      description:
          "lore ipsum this is nothing but bunch of fake text that may or may not make senseÒ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: feeds.length,
        itemBuilder: (context, index) => FeedUI(
              feed: feeds[index],
            ));
  }
}
