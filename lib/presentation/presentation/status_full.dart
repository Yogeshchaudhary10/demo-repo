import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:text202/app/constants/enum.dart';
// import 'package:text202/models/story_model.dart';

// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:hamro_blog/presentation/widget/util.dart';
import 'package:http/http.dart';
import 'package:story_view/story_view.dart';
import 'package:text202/presentation/resources/color_manager.dart';

enum MediaType { image, video, text }

class WhatsappStory {
  final MediaType? mediaType;
  final String? media;
  final double? duration;
  final String? caption;
  final String? when;
  final String? color;

  WhatsappStory({
    this.mediaType,
    this.media,
    this.duration,
    this.caption,
    this.when,
    this.color,
  });
}

class StatusFull extends StatelessWidget {
  const StatusFull({super.key});
  static Future<List<WhatsappStory>> getWhatsappStories() async {
    final response = await get(Uri.parse(
        "https://raw.githubusercontent.com/blackmann/storyexample/master/lib/data/whatsapp.json"));

    final data = jsonDecode(utf8.decode(response.bodyBytes))['data'];

    final res = data.map<WhatsappStory>((it) {
      return WhatsappStory(
          caption: it['caption'],
          media: it['media'],
          duration: double.parse(it['duration']),
          when: it['when'],
          mediaType: _translateType(it['mediaType']),
          color: it['color']);
    }).toList();

    return res;
  }

  static MediaType _translateType(String type) {
    if (type == "image") {
      return MediaType.image;
    }

    if (type == "video") {
      return MediaType.video;
    }

    return MediaType.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return StoryViewDelegate(
              stories: snapshot.data,
            );
          }

          if (snapshot.hasError) {
            //  return ErrorView();
          }

          return const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          );
        },
        future: getWhatsappStories(),
      ),
    );
  }
}

class StatelessWidget {}

class StoryViewDelegate extends StatefulWidget {
  final List<WhatsappStory>? stories;

  const StoryViewDelegate({super.key, this.stories});

  @override
  StoryViewDelegateState createState() => StoryViewDelegateState();
}

class StoryViewDelegateState extends State<StoryViewDelegate> {
  final StoryController controller = StoryController();
  List<StoryItem> storyItems = [];

  String when = "";

  @override
  void initState() {
    super.initState();
    for (var story in widget.stories!) {
      if (story.mediaType == MediaType.text) {
        storyItems.add(
          StoryItem.text(
            title: story.caption!,
            backgroundColor: ColorManager.kPrimaryColor,
            duration: Duration(
              milliseconds: (story.duration! * 1000).toInt(),
            ),
          ),
        );
      }

      if (story.mediaType == MediaType.image) {
        storyItems.add(StoryItem.pageImage(
          url: story.media!,
          controller: controller,
          caption: story.caption,
          duration: Duration(
            milliseconds: (story.duration! * 1000).toInt(),
          ),
        ));
      }

      if (story.mediaType == MediaType.video) {
        storyItems.add(
          StoryItem.pageVideo(
            story.media!,
            controller: controller,
            duration: Duration(milliseconds: (story.duration! * 1000).toInt()),
            caption: story.caption,
          ),
        );
      }
    }

    when = widget.stories![0].when!;
  }

  Widget _buildProfileView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(
              "https://post.healthline.com/wp-content/uploads/2019/02/How-to-Become-a-Better-Person-in-12-Steps_1200x628-facebook.jpg"),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Matt Redman",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                when,
                style: const TextStyle(
                  color: Colors.white38,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        StoryView(
          storyItems: storyItems,
          controller: controller,
          onComplete: () {
            Navigator.of(context).pop();
          },
          onVerticalSwipeComplete: (v) {
            if (v == Direction.down) {
              Navigator.pop(context);
            }
          },
          onStoryShow: (storyItem) {
            int pos = storyItems.indexOf(storyItem);

            // the reason for doing setState only after the first
            // position is becuase by the first iteration, the layout
            // hasn't been laid yet, thus raising some exception
            // (each child need to be laid exactly once)
            if (pos > 0) {
              setState(() {
                when = widget.stories![pos].when!;
              });
            }
          },
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 48,
            left: 16,
            right: 16,
          ),
          child: _buildProfileView(),
        )
      ],
    );
  }
}

// status.dart code 
