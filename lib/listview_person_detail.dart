import 'package:coding_chef/models/person.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class ListPersonDetailPage extends StatefulWidget {
  const ListPersonDetailPage({Key? key, required this.person})
      : super(key: key);

  final Person person;

  @override
  State<ListPersonDetailPage> createState() => _ListPersonDetailPageState();
}

class _ListPersonDetailPageState extends State<ListPersonDetailPage> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(widget.person.imgPath)),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Lives In ${widget.person.location}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            LikeButton(
              size: 30,
              isLiked: isLiked,
              likeCount: likeCount,
            )
          ],
        ),
      ),
    );
  }
}
