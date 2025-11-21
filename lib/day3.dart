// lib/home_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';











class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context);
    final screenW = mq.size.width;
    final screenH = mq.size.height;
    final isLandscape = mq.orientation == Orientation.landscape;


    return Scaffold(
      appBar: AppBar(title: const Text('Responsive app زي المثال في main')),
      body: Padding(



        padding: EdgeInsets.all(12.w),

  
        child: SingleChildScrollView(

          child: Column(
            children: [

              Text('ubgiuhjkjn', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 8.h),

              Container(

                width: 180.r,

                height: 180.r,

                decoration: BoxDecoration  (borderRadius: BorderRadius. circular(16.r),   color: Colors.redAccent),
                   child: Center(child: Text ('180.r', style: TextStyle 
                   (color: Colors.white, fontSize: 18.sp)
                   )
                   ),
              ),

              SizedBox( height: 18.h ),

              Divider(),

              SizedBox(height: 12.h  ),


              Text('ينبةينبتؤةيبتىؤستيبى', style: TextStyle (fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox (height: 8.h ),

              FractionallySizedBox(

                widthFactor: isLandscape ? 0.45 : 0.9, 
                child: Container(

                  
                  height: screenH * 0.25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r), color: Colors.blueAccent),
                  child: Center(child: Text('widthFactor: 0.9\nheight: 25% of screen', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14.sp))),

                ),
              ),

              SizedBox(height: 18.h),
              Divider(),

              SizedBox(height: 12.h),
              Text('', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 8.h),

              LayoutBuilder(builder: (context, constraints) {
                final double rawSize = constraints.maxWidth * 0.45;
                final double size = rawSize.clamp(100.0, 300.0);

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                      width: size.w,
                      height: size.w,
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12.r)),
                      child: Center(child: Text('clamped: ${size.toInt()}', style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                    ),
                  ],
                );
              }),

              SizedBox(height: 22.h),
              Divider(),

              SizedBox(height: 12.h),
              Text('fhfgntghtherge', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
              SizedBox(height: 8.h),

              Container(
                width: double.infinity,
                decoration: BoxDecoration (color: Colors.orangeAccent, borderRadius: BorderRadius.circular(12.r)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Center(child: Text('AspectRatio 16:9', style: TextStyle(color: Colors.white, fontSize: 14.sp))),
                ),
              ),

              SizedBox(height: 24.h),
              Text('sthbfgb,fthk', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700)),
              SizedBox(height: 8.h),
              Text(
                '- استخدمي .sp للخطوط عشان تتدرج مع حجم الشاشة.\n'
                '- لو التطبيق بيشتغل على تابليت، فكري في تغيير الـ layout (مثلاً Grid بدل Column).\n'
                '- دائماً قَيّدي الأحجام باستخدام clamp أو min/max لتجنب أحجام غير معقولة.',
                style: TextStyle(fontSize: 13.sp),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
