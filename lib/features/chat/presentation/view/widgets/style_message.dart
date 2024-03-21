import 'package:flutter/material.dart';
import 'package:gp_app/constants.dart';
import 'package:gp_app/features/chat/presentation/view/widgets/show_pdf.dart';

class StyleofMessage extends StatefulWidget {
  final bool ispdf;
  final bool isMe;
  final dynamic snapshot;
  final int index;
  const StyleofMessage({
    super.key,
    required this.isMe,
    required this.ispdf,
    required this.snapshot,
    required this.index,
  });

  @override
  State<StyleofMessage> createState() => _StyleofMessageState();
}

class _StyleofMessageState extends State<StyleofMessage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          widget.isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Material(
          borderRadius: widget.ispdf
              ? const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                )
              : widget.isMe
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
          color: widget.isMe ? chatColor : kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: widget.ispdf
                ? Text(
                    "${widget.snapshot.data!.docs[widget.snapshot.data!.docs.length - widget.index - 1].data()["message"]}",
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )
                : Text(
                    "${widget.snapshot.data!.docs[widget.snapshot.data!.docs.length - widget.index - 1].data()["message"]}",
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
          ),
        ),
        widget.ispdf
            ? Container(
                width: 35,
                height: 39,
                decoration: const BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: GestureDetector(
                  onTap: () async {
                    //call thing
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Showpdf(
                          url: widget
                              .snapshot
                              .data!
                              .docs[widget.snapshot.data!.docs.length -
                                  widget.index -
                                  1]
                              .data()["url"],
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.download_rounded,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 20,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
