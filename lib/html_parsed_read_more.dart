library html_parsed_read_more;

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlParsedReadMore extends StatefulWidget {
  const HtmlParsedReadMore({
    required this.text,
    this.maxLinesReadMore = 10000,
    this.maxLinesReadLess = 2,
    this.readLessText = 'Read less',
    this.readMoreText = 'Read more,',
    this.textOverflow = TextOverflow.ellipsis,
    this.fontFamily = 'poppins',
    this.textColor,
    this.textButtonColor,
    this.textButtonFontSize,
    this.buttonAlignment = Alignment.bottomRight,
    this.buttonPadding = const EdgeInsets.only(top: 3),
    super.key,
  });
  final String text;
  final int maxLinesReadMore;
  final int maxLinesReadLess;
  final String readMoreText;
  final String readLessText;
  final TextOverflow textOverflow;
  final String fontFamily;
  final Color? textColor;
  final Color? textButtonColor;
  final double? textButtonFontSize;
  final AlignmentGeometry buttonAlignment;
  final EdgeInsetsGeometry buttonPadding;

  @override
  State<HtmlParsedReadMore> createState() => _HtmlParsedReadMoreState();
}

class _HtmlParsedReadMoreState extends State<HtmlParsedReadMore> {
  bool readMore = false;

  bool hasExceededMaxLine({
    required BuildContext context,
    required String text,
    required int maxLine,
  }) {
    final constraints = BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
    );
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontSize: 16),
      ),
      textDirection: TextDirection.ltr,
      maxLines: maxLine,
    );
    textPainter.layout(maxWidth: constraints.maxWidth);
    return textPainter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final textExceededMaxLine = hasExceededMaxLine(
        context: context,
        text: widget.text,
        maxLine: widget.maxLinesReadLess,
      );
      return Wrap(
        children: [
          Html(
            data: widget.text,
            style: {
              '#': Style(
                margin: Margins.zero,
                fontFamily: widget.fontFamily,
                textOverflow: widget.textOverflow,
                color: widget.textColor ??
                    Theme.of(context).textTheme.bodyLarge!.color!,
                maxLines: readMore
                    ? widget.maxLinesReadMore
                    : widget.maxLinesReadLess,
              ),
            },
          ),
          textExceededMaxLine
              ? Container(
                  alignment: widget.buttonAlignment,
                  padding: widget.buttonPadding,
                  child: GestureDetector(
                    child: Text(
                      readMore ? widget.readLessText : widget.readMoreText,
                      style: TextStyle(
                        color: widget.textButtonColor ??
                            Theme.of(context).colorScheme.primary,
                        fontSize: widget.textButtonFontSize ?? 15.0,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        readMore = !readMore;
                      });
                    },
                  ),
                )
              : const SizedBox.shrink()
        ],
      );
    });
  }
}