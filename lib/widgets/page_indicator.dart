import 'dart:math';

import 'package:flutter/material.dart';

// class PageIndicator extends StatefulWidget {
//   final PageController controller;
//   const PageIndicator({super.key, required this.controller});
//
//   @override
//   State<PageIndicator> createState() => _PageIndicatorState();
// }
//
// class _PageIndicatorState extends State<PageIndicator> {
//   late ScrollController _controller;
//   bool isPressed = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = ScrollController();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     widget.controller.addListener(() => _controller.);
//     _controller.addListener(
//       () {
//
//       },
//     );
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Listener(
//       onPointerDown: (details) => setState(() {
//         isPressed = true;
//       }),
//       onPointerUp: (details) => setState(() {
//         isPressed = false;
//       }),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color:
//                 isPressed ? Colors.grey.withOpacity(0.3) : Colors.transparent),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: SizedBox(
//             width: 60,
//             height: 30,
//             child: ListView.builder(
//               controller: _controller,
//               scrollDirection: Axis.horizontal,
//               itemCount: 8,
//               itemBuilder: (context, index) {
//                 if (index == widget.controller.page) {
//                   return Dot(
//                     isSelected: true,
//                   );
//                 } else {
//                   return Dot(
//                     isSelected: false,
//                   );
//                 }
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Dot extends StatelessWidget {
//   final bool isSelected;
//   const Dot({super.key, required this.isSelected});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: SizedBox.square(
//         dimension: isSelected ? 6 : 5,
//         child: DecoratedBox(
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: isSelected ? Colors.red : Colors.grey)),
//       ),
//     );
//   }
// }
int _currentPage = 0;
double _startOffset = 0;
bool _isTapped = false;
int _previousPage = 0;
int _previousCurrentPage = _currentPage;
Offset? _clickedOffset;
double scrollOffset = 0;

class PageIndicator extends StatefulWidget {
  final PageController controller;
  final int pages;
  const PageIndicator(
      {super.key, required this.controller, required this.pages});

  @override
  State<PageIndicator> createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  double offset = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 65,
      child: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, child) {
            // print("yo ${widget.controller.position.maxScrollExtent}");
            return GestureDetector(
              onHorizontalDragStart: (details) {
                setState(() {
                  _isTapped = true;
                  _startOffset = details.localPosition.dx;
                });
              },
              onHorizontalDragUpdate: (details) {
                setState(() {
                  offset = details.localPosition.dx;
                  bool isLeft = offset < _startOffset;
                  bool isRight = offset > _startOffset;
                  _startOffset = offset;
                  final currentPos = widget.controller.position.pixels;
                  // final scrollOffset =
                  //     widget.controller.position.viewportDimension *
                  //         (offset.abs() / 100);
                  final scrollOffset =
                      widget.controller.position.viewportDimension *
                          (65 / (6 * offset.abs()));

                  if (isLeft) {
                    if (currentPos - scrollOffset >= 0) {
                      widget.controller.jumpTo(currentPos - scrollOffset);
                    }
                  } else if (isRight) {
                    if (currentPos + scrollOffset <=
                        widget.controller.position.maxScrollExtent) {
                      widget.controller.jumpTo(currentPos + scrollOffset);
                    }
                  }
                });
              },
              onHorizontalDragCancel: () {
                setState(() {
                  _isTapped = false;
                });
              },
              onHorizontalDragEnd: (_) {
                setState(() {
                  _isTapped = false;
                });
              },
              onTapDown: (details) {
                setState(() {
                  _clickedOffset = details.localPosition;
                  for (int i = 1; i <= widget.pages; i++) {
                    final widthCorrection = 65 / 2 - 3;
                    final position = Offset(
                        (10 * (i - 1)) + widthCorrection + scrollOffset - 22.5,
                        30 / 2);
                    if (_clickedOffset != null) {
                      final maxPosDx = position.dx + 4;
                      final minPosDx = position.dx - 4;
                      final maxPosDy = position.dy + 4;
                      final minPosDy = position.dy - 4;
                      if (_clickedOffset!.dx >= minPosDx &&
                          _clickedOffset!.dx <= maxPosDx &&
                          _clickedOffset!.dy >= minPosDy &&
                          _clickedOffset!.dy <= maxPosDy) {
                        widget.controller.jumpToPage(i.toInt() - 1);
                        _currentPage = i.toInt();
                        _clickedOffset = null;
                      }
                    }
                  }
                  _isTapped = true;
                });
              },
              onTapUp: (details) {
                setState(() {
                  _isTapped = false;
                });
              },
              onTapCancel: () {
                setState(() {
                  _isTapped = false;
                });
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: _isTapped
                      ? Colors.grey.withOpacity(.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 30,
                  width: MediaQuery.sizeOf(context).width,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 80),
                    child: CustomPaint(
                      size: const Size(65, 30),
                      painter: PageIndicatorPainter(
                          maxExtent:
                              widget.controller.position.viewportDimension,
                          noOfPages: widget.pages,
                          offset: widget.controller.position.pixels,
                          clickedOffset: _clickedOffset),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class PageIndicatorPainter extends CustomPainter {
  final double offset;
  final double maxExtent;
  final int noOfPages;
  final Offset? clickedOffset;

  PageIndicatorPainter({
    required this.maxExtent,
    required this.noOfPages,
    required this.offset,
    this.clickedOffset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final widthCorrection = size.width / 2 - 3;
    final pageOffset = maxExtent;
    Paint paint = Paint();
    canvas.translate(-30, 0);
    if (_currentPage != _previousCurrentPage) {
      _previousPage = _previousCurrentPage;
      _previousCurrentPage = _currentPage;
    }
    Offset position = Offset(0, 0);
    for (double i = 1; i <= noOfPages; i++) {
      position = Offset(
          (10 * (i - 1)) + widthCorrection + scrollOffset + 9, size.height / 2);
      if (i < noOfPages) {
        if (i > 1) {
          if (offset > ((pageOffset * (i - 2)) + (pageOffset / 2)) &&
              offset < ((pageOffset * (i)) - (pageOffset / 2))) {
            _currentPage = i.toInt();
          }
        } else {
          if (offset < ((pageOffset * (i)) - (pageOffset / 2))) {
            _currentPage = 1;
          }
        }
      } else {
        if (offset > ((pageOffset * (i - 2)) + (pageOffset / 2))) {
          _currentPage = noOfPages;
        }
      }
      bool isSelected = _currentPage == i;
      if (scrollOffset < (size.width - (noOfPages * 10)) - 8) {
        scrollOffset = size.width - (noOfPages * 10) - 5;
      }
      if (scrollOffset > 0) {
        scrollOffset = 0;
      }
      if (_currentPage == noOfPages) {
        scrollOffset = size.width - (noOfPages * 10) - 7;
      } else if (_currentPage == 1) {
        scrollOffset = 0;
      }
      Offset currentPos = Offset(
          (10 * (_currentPage - 1)) + widthCorrection + scrollOffset + 9,
          size.height / 2);
      bool isAtEdge = position.dx < widthCorrection + 10 ||
          position.dx > size.width + widthCorrection - 10;
      bool isCurrentAtLeftEdge = currentPos.dx < widthCorrection + 10;
      bool isCurrentAtRightEdge =
          currentPos.dx > size.width + widthCorrection - 10;
      bool isFirstOrLast = i == 1 || i == noOfPages;
      bool isCurrentFirstOrLast =
          _currentPage == 1 || _currentPage == noOfPages;
      bool hasOffsetChanged = scrollOffset != 0;
      if (isCurrentAtRightEdge &&
          !isCurrentFirstOrLast &&
          (_currentPage > _previousPage) &&
          currentPos.dx > size.width + widthCorrection - 15) {
        scrollOffset -= (size.width - 5) / 6;
        if (_currentPage == noOfPages - 1) {
          scrollOffset = size.width - (noOfPages * 10) - 7;
        }
      } else if (isCurrentAtLeftEdge &&
          !isCurrentFirstOrLast &&
          (_currentPage < _previousPage) &&
          currentPos.dx < widthCorrection + 10) {
        scrollOffset += (size.width - 5) / 6;
        if (_currentPage == 2 && hasOffsetChanged) {
          scrollOffset == 0;
        }
      }
      final radius = isSelected
          ? 3.5
          : (isFirstOrLast && hasOffsetChanged && isAtEdge && !isSelected
              ? 1210 /
                  pow(((size.width) / 2 - position.dx + widthCorrection).abs(),
                      2)
              : (isAtEdge
                  ? 1210 /
                      pow(
                          ((size.width) / 2 - position.dx + widthCorrection)
                              .abs(),
                          2)
                  : 2.5));
      if (position.dx < size.width + widthCorrection - 5 &&
          position.dx > widthCorrection)
        canvas.drawCircle(
            position,
            radius,
            paint
              ..color = isSelected
                  ? Color.fromRGBO(0, 149, 246, 1)
                  : Color.fromRGBO(219, 219, 219, 1));
    }
  }

  @override
  bool shouldRepaint(covariant PageIndicatorPainter oldDelegate) =>
      (oldDelegate.offset != offset) ||
      (oldDelegate.clickedOffset != clickedOffset);
}
