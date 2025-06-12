import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseShimmer extends StatelessWidget {
  const BaseShimmer(
      {super.key,
      this.child,
      this.height,
      this.radius,
      this.itemCount,
      this.direction,
      this.width});

  final Widget? child;
  final double? height;
  final double? radius;
  final int? itemCount;
  final Axis? direction;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount ?? 6,
      shrinkWrap: true,
      scrollDirection: direction ?? Axis.vertical,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: const Color(0xff333333),
          highlightColor: const Color(0xff090909),
          child: Container(
            margin: const EdgeInsets.only(bottom: 14),
            width: width ?? double.infinity,
            height: height ?? 50,
            decoration: BoxDecoration(
              color: const Color(0xffF9F9F9).withOpacity(0.1),
              borderRadius: BorderRadius.circular(radius ?? 15),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 20,
        );
      },
    );
  }
}
