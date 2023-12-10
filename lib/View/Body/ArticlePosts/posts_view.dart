import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../ViewModel/Body/ArticlePosts/post_viewmodel.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PostViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Container(
                  height: 250.h,
                  color: Colors.blue,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height - 300.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24.r),
                        topLeft: Radius.circular(24.r),
                      ),
                    ),
                    padding:
                        EdgeInsets.only(top: 20.h, right: 10.w, left: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            'Recent Post',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.sp),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: ListView.separated(
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  //to the article
                                },
                                child: BlogCard(),
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 20.h,
                              ),
                              itemCount: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              spreadRadius: 1,
              blurRadius: 1,
              color: Colors.grey.shade200),
        ],
        borderRadius: BorderRadius.circular(24.r),
        color: Colors.white,
        // border: Border.all(color: Colors.blue.shade900),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            width: 80.w,
            height: 100.h,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(12.r)),
          ),
          Container(
            width: 220.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hello World',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    const Spacer(),
                    const Text('25 Aug.'),
                  ],
                ),
                Text(
                  'This is Dart programing lang with all the feautures in it is ameasin and cool fpr use',
                  style: TextStyle(fontSize: 12.sp),
                  softWrap: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Adedeji Idris',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text('Likes')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
