import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sup_labs_task/core/common/widgets/utility_widgets/custom_text_widgets.dart';
import 'package:sup_labs_task/core/common/widgets/utility_widgets/image_widget.dart';
import 'package:sup_labs_task/core/themes/colors.dart';
import 'package:sup_labs_task/core/themes/stylings.dart';
import 'package:sup_labs_task/features/search/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, left: 10.w),
      height: 240.h,
      width: 200.w,
      decoration:
          BoxDecoration(border: Border.all(), color: AppColors.pearlWhite),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget<Product>(
              boxFit: BoxFit.contain,
              imageUrl: product.imageUrl,
              height: 100,
              width: 180.w,
              data: product),
          SizedBox(
            height: 5.h,
          ),
          TextWidget(
            textAlign: TextAlign.left,
            text: product.title,
            width: 200.w,
            maxLines: 3,
            textStyle:
                TextStylings.defaultTs.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                  product.rating.toInt(),
                  (i) => Icon(
                        size: 16.h,
                        Icons.star,
                        color: AppColors.marigoldYellow,
                      ))),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "\$ ${product.price}",
                style: TextStylings.defaultTs.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.crimsonRed),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "\$ ${(product.getStrikedPrice())}",
                style: TextStylings.defaultTs.copyWith(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
