
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sup_labs_task/core/common/extensions/generic_declarations.dart';

class ImageWidget<T extends Object> extends StatelessWidget {
  final T data;
  final String imageUrl;
  final double height;
  final double? width;
  final WidgetDataExporter<T>? onTap;
  final BoxFit boxFit;
  final BorderRadiusGeometry borderRadius;
  final Gradient? gradient;
  final bool disableBlackGradient; // Flag to disable the gradient entirely

  const ImageWidget({
    super.key,
    required this.imageUrl,
    required this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
    this.boxFit = BoxFit.fill,
    this.onTap,
    required this.data,
    this.gradient,
    this.disableBlackGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(data) : null,
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: borderRadius,
            child: CachedNetworkImage(
              height: height,
              width: width,
              imageUrl: imageUrl,
              fit: boxFit,
              progressIndicatorBuilder: (context, url, progress) => SizedBox(
                height: height,
                width: width,
                child:
                    const Center(child: CircularProgressIndicator.adaptive()),
              ),
              errorWidget: (context, url, error) => SizedBox(
                height: height,
                width: width,
                child: const Icon(Icons.broken_image, color: Colors.red),
              ),
            ),
          ),

          if (!disableBlackGradient)
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                gradient: gradient ??
                    LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent,
                      ],
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
