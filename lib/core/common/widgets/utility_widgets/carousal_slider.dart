import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sup_labs_task/core/common/extensions/generic_declarations.dart';
import 'package:sup_labs_task/core/common/widgets/utility_widgets/generic_button.dart';
import 'package:sup_labs_task/core/common/widgets/utility_widgets/heading_text.dart';
import 'package:sup_labs_task/core/common/widgets/utility_widgets/image_widget.dart';
import 'package:sup_labs_task/core/dummy_data/dummy_classes.dart';
import 'package:sup_labs_task/core/themes/colors.dart';
import 'package:sup_labs_task/core/themes/stylings.dart';

//Author : Ishaque ---> ishaque.kannoth.dev@gmail.com
//Note: this widget can be optimised with less number of lines of code,but may reduce readability
//testing is not done..Edge cases are not tested..pls revert at ishaque.kannoth.dev@gmail.com for any known issues..
class CarouselIndicatorWithHeading extends StatelessWidget {
  //current index of the showing item
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);
  //required argument as category model
  final List<FeaturedImage> featuredImages;
  //allow boxfit for the image in the carousal
  final BoxFit? boxFit;
  //color for the active index dot
  final Color? activeDotColor;
  //color for the non selected index
  final Color? dotColor;
  //whether to allow the heading to the carousal or not,defaults to false
  final bool? allowHeading;
  //make the padding for the image carousal
  final EdgeInsets? padding;
  //height of the image only ,dont give the total height of the widget--defaults to 418 in height
  final double? height;
  //margin for the widget--defaults to vertical 16 pixels
  final EdgeInsets? margin;
  //margin for heeading text..only visible if the allowHeading is true..
  final EdgeInsets? headingMargin;
  //border radius to be allowed on the image..defaults to zero
  final BorderRadius? borderRadius;
  //heading text..if not provided -This is a heading-will be used
  final String? heading;
  //a black gradient color until the center from the bottom is applied..defaults to false
  final bool? allowBlackShade;
  //adjust the middleHeading provided by MiddleHeadPosition enum..Defaults to centre and takes full width
  final MiddleHeadingPosition? middleHeadingPosition;
  //the middle heading is shown in the middle across is shown,the category model must have this property
  final bool? allowMiddleHeading;
  //onTap function to get the data out of the widget tree
  final FlexibleProcessor<FeaturedImage, void>? onTap;
  //final WidgetDataExporter<FeaturedImage> onTap;
  //show the exploreMore button-->only shown when the categories.lenth==1 and showExploreMoreButton is true
  final bool? showGenericButton;
  //shows the indicator outside of the carousal when enabled..defaults to false or automatically disabled when the length of the list is one
  final bool? indicatorOutside;
  //function to run when the exploremore button is pressed..only active when the category length is one
  final WidgetDataExporter onGenericButtonTap;
  //customise name to the exploreMore button
  final String? exploreButtonName;
  //middleHeading color
  final Color? middleHeadingcolor;
  //this is the unique key to identify the widget since we impliment the unique position interface..Logic discarded by senior dev

  CarouselIndicatorWithHeading(
      {super.key,
      required this.featuredImages,
      this.onTap,
      this.boxFit = BoxFit.cover,
      this.activeDotColor,
      this.dotColor,
      this.allowHeading = false,
      this.padding,
      this.height,
      this.heading,
      this.margin,
      this.allowBlackShade = true,
      this.allowMiddleHeading = false,
      this.borderRadius,
      this.headingMargin,
      this.indicatorOutside = false,
      this.middleHeadingPosition = MiddleHeadingPosition.fullWidthCentered,
      this.showGenericButton = false,
      this.onGenericButtonTap,
      this.exploreButtonName = "Explore the brand",
      this.middleHeadingcolor});

  @override
  Widget build(BuildContext context) {
    //when heading is allowed the total size of the widget is increased to hold the AESingleHeading text..36 pixels
    return allowHeading!
        ? Container(
            margin: margin ?? EdgeInsets.symmetric(vertical: 16.h),
            padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
            //when the height is not null a 36 pixel is added since the allow heading is true
            //a 16 pixel extra added if the indicator is to be outside of the carousal and there are more than 1 item in category list
            height: height != null
                ? (height! + 36.h) +
                    (indicatorOutside! && featuredImages.length > 1
                        ? 16.h
                        : 0) +
                    (showGenericButton! && featuredImages.length < 2 ? 60.h : 0)
                : 454.h +
                    (indicatorOutside! ? 16.h : 0) +
                    (showGenericButton! && featuredImages.length < 2
                        ? 60.h
                        : 0),
            child: Column(
              children: [
                SingleHeadingText(
                    margin: headingMargin != null
                        ? headingMargin!.copyWith(
                            right: 0,
                            left: headingMargin?.left != null
                                ? headingMargin!.left.clamp(0.0, 16.0.w)
                                : 0.0,
                            top: 0,
                            bottom: 0)
                        : EdgeInsets.zero,
                    alignment: Alignment.topLeft,
                    heading: heading ?? "This is a heading",
                    style: TextStylings.defaultTs.copyWith(
                      color: AppColors.black,
                    )),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                      itemCount: featuredImages.length,
                      itemBuilder: (context, index, heroIndex) {
                        return GestureDetector(
                          onTap: onTap != null
                              ? () => onTap!(featuredImages[index])
                              : null,
                          child: Stack(
                            children: [
                              ImageWidget(
                                  data: featuredImages[index],
                                  imageUrl: featuredImages[index].imageUrl,
                                  height: height ?? 418.h,
                                  gradient: null,
                                  boxFit: boxFit!,
                                  borderRadius: borderRadius ??
                                      BorderRadius.circular(16.r),
                                  width: ScreenUtil().screenWidth),
                              if (allowMiddleHeading ?? false)
                                middleHeadingPosition ==
                                        MiddleHeadingPosition.fullWidthCentered
                                    ? Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: ScreenUtil().screenWidth,
                                          height: 40.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: middleHeadingcolor ??
                                                  const Color(0xCCFDFCFC)),
                                          child: Text(
                                            featuredImages[index]
                                                .serviceProviderId
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStylings.defaultTs
                                                .copyWith(
                                                    color: middleHeadingcolor ==
                                                            null
                                                        ? AppColors.black
                                                        : AppColors.white),
                                          ),
                                        ),
                                      )
                                    : Positioned(
                                        top: height != null
                                            ? height! / 4
                                            : 140.h,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: ScreenUtil().screenWidth / 2.5,
                                          height: 40.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: middleHeadingcolor ??
                                                  const Color(0xCCFDFCFC)),
                                          child: Text(
                                            featuredImages[index].serviceTitle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStylings.defaultTs
                                                .copyWith(
                                                    color: middleHeadingcolor ==
                                                            null
                                                        ? AppColors.black
                                                        : AppColors.white),
                                          ),
                                        ),
                                      )
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                          height: height ?? 418.h,
                          viewportFraction: 1,
                          enableInfiniteScroll: featuredImages.length > 1,
                          autoPlay: featuredImages.length > 1,
                          onPageChanged: (index, reason) {
                            selectedIndex.value = index;
                          }),
                    ),
                    //if the indicatorOutside is false or there is only 1 item to show,then the indicator is not shown
                    //if there are more than 1 item then the indicator is shown inside as the stack to the image
                    if (!indicatorOutside! && featuredImages.length > 1)
                      Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: ValueListenableBuilder(
                              valueListenable: selectedIndex,
                              builder: (context, value, _) =>
                                  _buildPageIndicator(
                                      activeDotColor: activeDotColor,
                                      dotColor: dotColor,
                                      activeIndex: value,
                                      count: featuredImages.length))),
                  ],
                ),

                //if the indicatorOutside is true,then the total height of the widget is automatically increased by 16px
                //and hence an extra widget is added out side of the carousal
                //if the category length is less than 1,then also no indicator is shown and the height is already automatically adjusted
                //see the height configuration above for the height adjustments
                if (indicatorOutside! && featuredImages.length > 1)
                  Expanded(
                      child: Container(
                    alignment: Alignment.bottomCenter,
                    child: ValueListenableBuilder(
                        valueListenable: selectedIndex,
                        builder: (context, value, _) => _buildPageIndicator(
                            activeDotColor: activeDotColor,
                            dotColor: dotColor,
                            activeIndex: value,
                            dotHeight: 6.h,
                            count: featuredImages.length)),
                  )),
                if (showGenericButton! && featuredImages.length < 2)
                  Expanded(
                    child: GenericButton(
                      buttonData: "",
                      margin: EdgeInsets.only(top: 16.h),
                      onTap: onGenericButtonTap,
                      buttonColor: AppColors.primaryColor,
                      buttonTitle: exploreButtonName,
                      textStyle: TextStylings.defaultTs
                          .copyWith(color: AppColors.white),
                      buttonDimensions: Size(145.w, 40.h),
                    ),
                  )
              ],
            ))

        //when the heading is not allowed,then this part is rendered
        : Container(
            alignment: Alignment.topCenter,
            height: height == null
                ? 418.h +
                    (indicatorOutside! ? 16.h : 0) +
                    (showGenericButton! && featuredImages.length < 2 ? 60.h : 0)
                : height! +
                    (indicatorOutside! && featuredImages.length > 1
                        ? 16.h
                        : 0) +
                    (showGenericButton! && featuredImages.length < 2
                        ? 60.h
                        : 0),
            margin: margin ?? EdgeInsets.symmetric(vertical: 16.h),
            padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider.builder(
                      itemCount: featuredImages.length,
                      itemBuilder: (context, index, heroIndex) {
                        return GestureDetector(
                          onTap: onTap != null
                              ? () => onTap!(featuredImages[index])
                              : null,
                          child: Stack(
                            children: [
                              ImageWidget(
                                  data: featuredImages[index],
                                  gradient: null,
                                  imageUrl: featuredImages[index].imageUrl,
                                  height: height ?? 418.h,
                                  borderRadius: borderRadius ??
                                      BorderRadius.circular(16.r),
                                  width: ScreenUtil().screenWidth),
                              if (allowMiddleHeading ?? false)
                                middleHeadingPosition ==
                                        MiddleHeadingPosition.fullWidthCentered
                                    ? Center(
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: ScreenUtil().screenWidth,
                                          height: 40.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: middleHeadingcolor ??
                                                  const Color(0xCCFDFCFC)),
                                          child: Text(
                                            featuredImages[index].serviceTitle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStylings.defaultTs
                                                .copyWith(
                                                    color: middleHeadingcolor ==
                                                            null
                                                        ? AppColors.black
                                                        : AppColors.white),
                                          ),
                                        ),
                                      )
                                    : Positioned(
                                        top: height != null
                                            ? height! / 4
                                            : 140.h,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: ScreenUtil().screenWidth / 2.5,
                                          height: 40.h,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                              color: middleHeadingcolor ??
                                                  const Color(0xCCFDFCFC)),
                                          child: Text(
                                            featuredImages[index].serviceTitle,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStylings.defaultTs
                                                .copyWith(
                                                    color: middleHeadingcolor ==
                                                            null
                                                        ? AppColors.black
                                                        : AppColors.white),
                                          ),
                                        ),
                                      )
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                          height: height ?? 418.h,
                          viewportFraction: 1,
                          autoPlay: featuredImages.length > 1,
                          enableInfiniteScroll: featuredImages.length > 1,
                          onPageChanged: (index, reason) {
                            selectedIndex.value = index;
                          }),
                    ),
                    if (!indicatorOutside! && featuredImages.length > 1)
                      Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: ValueListenableBuilder(
                              valueListenable: selectedIndex,
                              builder: (context, value, _) =>
                                  _buildPageIndicator(
                                      activeDotColor: activeDotColor,
                                      dotColor: dotColor,
                                      activeIndex: value,
                                      count: featuredImages.length))),
                  ],
                ),
                if (indicatorOutside! && featuredImages.length > 1)
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: ValueListenableBuilder(
                          valueListenable: selectedIndex,
                          builder: (context, value, _) => _buildPageIndicator(
                              activeDotColor: activeDotColor,
                              dotColor: dotColor,
                              activeIndex: value,
                              dotHeight: 6.h,
                              count: featuredImages.length)),
                    ),
                  ),
                if (showGenericButton! && featuredImages.length < 2)
                  GenericButton(
                    buttonData: featuredImages.first,
                    margin: EdgeInsets.only(top: 16.h),
                    onTap: onGenericButtonTap,
                    buttonColor: AppColors.primaryColor,
                    buttonTitle: exploreButtonName,
                    textStyle:
                        TextStylings.defaultTs.copyWith(color: AppColors.white),
                    buttonDimensions: Size(145.w, 40.h),
                  )
              ],
            ),
          );
  }

  Widget _buildPageIndicator(
      {required int activeIndex,
      required count,
      Color? dotColor,
      double? dotHeight,
      Color? activeDotColor}) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: count,
      effect: WormEffect(
        activeDotColor: activeDotColor ?? Colors.black87,
        dotColor: dotColor ?? Colors.black12,
        dotHeight: dotHeight ?? 10.h,
        dotWidth: dotHeight ?? 10.w,
        spacing: 10.h,
      ),
    );
  }
}

enum MiddleHeadingPosition { fullWidthCentered, halfWidthTopLeft }
