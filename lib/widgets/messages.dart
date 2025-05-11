import 'package:flutter/material.dart';
import 'package:relief_fund/widgets/colors.dart';

class Messages extends StatefulWidget {
  final List messages;
  const Messages({super.key, required this.messages});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.separated(
      separatorBuilder:
          (context, index) => const Padding(padding: EdgeInsets.only(top: 10)),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment:
                widget.messages[index]['isUserMessage']
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
            children: [
              //chat bubbles
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color:
                      widget.messages[index]['isUserMessage']
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(
                      widget.messages[index]['isUserMessage'] ? 0 : 20,
                    ),
                    bottomLeft: Radius.circular(
                      widget.messages[index]['isUserMessage'] ? 20 : 0,
                    ),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                constraints: BoxConstraints(maxWidth: width * 2 / 3),
                child: Text(
                  widget.messages[index]['message'], 
                  style: TextStyle(color: AppColors.backgroundColor),
                ),
              ),
            ],
          ),
        );
      },
      itemCount: widget.messages.length,
    );
  }
}
