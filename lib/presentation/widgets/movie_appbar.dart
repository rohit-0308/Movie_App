import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/common/constants/size_constraints.dart';
import 'package:movies/common/screenUtil/screenutil.dart';
import 'package:movies/common/extensions/size_extension.dart';
import 'package:movies/presentation/widgets/logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          // Uncomment below line if desired UI is not achieved
          // top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w),
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/menu.svg',
              height: Sizes.dimen_12.h,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: const Logo(
              height: Sizes.dimen_14,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
