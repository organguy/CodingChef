import 'package:flutter/material.dart';
import 'bubble_painter.dart';

class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.message, this.isMe, this.userName, this.userImage, {Key? key}) : super(key: key);

  final String message;
  final bool isMe;
  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
         if(isMe)
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 30, 45, 0),
             child: Align(
               alignment: Alignment.topRight,
               child: CustomPaint(
                 painter: BubblePainter(
                   color: Colors.blue,
                   alignment: Alignment.topRight,
                 ),
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(6, 2, 20, 2),
                   child: Container(
                     constraints: BoxConstraints(
                       maxWidth: MediaQuery.of(context).size.width * 0.7,
                     ),
                     padding: const EdgeInsets.all(4.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text(
                           userName,
                           style: const TextStyle(
                               fontWeight: FontWeight.bold,
                               color: Colors.white
                           ),
                         ),
                         const SizedBox(
                           height: 8.0,
                         ),
                         Text(
                           message,
                           style: const TextStyle(color: Colors.white),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           ),
          if(!isMe)
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 30, 45, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomPaint(
                  painter: BubblePainter(
                    color: Colors.grey,
                    alignment: Alignment.topLeft,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 2, 6, 2),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7,
                      ),
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            message,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: isMe ? 5 : null,
          left: isMe ? null : 5,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        )
      ]
    );
  }
}
