import 'package:homeservice/config/injector/injector_config.dart';
import 'package:homeservice/core/extensions/padding_extension.dart';
import 'package:homeservice/core/helpers/decoration.dart';
import 'package:homeservice/core/routes/route_exports.dart';
import 'package:homeservice/core/utils/app_palettes.dart';
import 'package:homeservice/core/utils/dimens.dart';
import 'package:homeservice/core/utils/sizedBox.dart';

class DraggableSheetWidget extends StatefulWidget {
  final Widget child;
  final Widget? title;
  final Widget? bottomChild;
  final Color? backgroundColor;
  final Color? indicatorcolor;
  final double size;
  final double? maxSize;
  final bool showClose;
  final double? radius;
  final double? horizontalPadding;
  final Function()? onCompleted;
  const DraggableSheetWidget({
    super.key,
    required this.child,
    this.title,
    this.bottomChild,
    this.backgroundColor,
    this.indicatorcolor,
    required this.size,
    this.maxSize,
    this.radius,
    this.onCompleted,
    this.showClose = false,
    this.horizontalPadding,
  });

  @override
  State<DraggableSheetWidget> createState() => _DraggableSheetWidgetState();
}

class _DraggableSheetWidgetState extends State<DraggableSheetWidget> {
  @override
  void initState() {
    super.initState();
    // controller.addListener(collapse);
  }

  void onChange() {
    final currentSize = controller.size;
    if (currentSize <= 0.05) collapse();
  }

  void collapse() => animateSheet(getSheet.snapSizes!.first);
  void anchor() => animateSheet(getSheet.snapSizes!.last);
  void expand() => animateSheet(getSheet.maxChildSize);
  void hide() => animateSheet(getSheet.minChildSize);

  void animateSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(microseconds: 50),
      curve: Curves.easeInOut,
    );
  }

  void animateCompleteSheet(double size) {
    controller.animateTo(
      size,
      duration: const Duration(microseconds: 50),
      curve: Curves.easeInOut,
    );
    widget.onCompleted;
  }

  DraggableScrollableSheet get getSheet =>
      (sheet.currentWidget as DraggableScrollableSheet);
  final sheet = GlobalKey();
  final controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builder, constraints) {
        return DraggableScrollableSheet(
          controller: controller,
          key: sheet,
          initialChildSize: widget.size,
          maxChildSize: widget.maxSize ?? 0.8,
          minChildSize: 0,
          expand: false,
          snap: true,
          snapSizes: [0 / constraints.maxHeight, widget.size],
          builder: (context, scrollController) {
            return Container(
              decoration: boxDecorationRoundedWithShadow(
                widget.radius ?? Dimens.radiusX2,
                disableBottomRadius: true,
                backgroundColor:
                    widget.backgroundColor ?? AppPalettes.whiteColor,
              ),
              padding: EdgeInsets.only(top: Dimens.allMarginX6),
              child: CustomScrollView(
                shrinkWrap: true,
                controller: scrollController,
                slivers: [
                  if (widget.showClose == false)
                    topButtonIndicitor(widget.indicatorcolor),
                  if (widget.showClose == true)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              widget.horizontalPadding ?? Dimens.horPaddingX4,
                        ),
                        child: Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            ?widget.title,
                            SizeBox.sizeWX3,
                            topCloseIndicitor(widget.indicatorcolor),
                          ],
                        ),
                      ),
                    ),
                  SliverToBoxAdapter(
                    child: widget.child.symmetricPadding(
                      horizontal:
                          widget.horizontalPadding ?? Dimens.horPaddingX4,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: widget.bottomChild?.symmetricPadding(
                        horizontal:
                            widget.horizontalPadding ?? Dimens.horPaddingX4,
                        vertical:
                            widget.horizontalPadding ?? Dimens.horPaddingX4,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget topCloseIndicitor(Color? color) {
    return GestureDetector(
      onTap: () => serviceLocater<GoRouter>().pop(),
      child: Container(
        padding: EdgeInsets.all(Dimens.allPaddingX2),

        decoration: boxDecorationRoundedWithShadow(
          Dimens.radius100,
          backgroundColor: AppPalettes.primaryColor,
        ),
        child: Icon(Icons.close_rounded, color: AppPalettes.whiteColor),
      ),
    );
  }

  SliverToBoxAdapter topButtonIndicitor(Color? color) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: Dimens.allMarginX2,
            bottom: Dimens.allMarginX2,
          ),
          height: Dimens.scaleX,
          width: Dimens.scaleX7,
          decoration: boxDecorationRoundedWithShadow(
            widget.radius ?? Dimens.radiusX2,
            backgroundColor: color ?? AppPalettes.whiteColor,
          ),
        ),
      ),
    );
  }
}
