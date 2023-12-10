import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Universal Reuseable Widgets/Widgets/reuseable_click_button.dart';
import '../../../../../Universal Reuseable Widgets/Widgets/text.dart';

class UploadPrescription extends StatefulWidget {
  const UploadPrescription({Key? key}) : super(key: key);

  @override
  State<UploadPrescription> createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header2Text(text: 'Upload Prescription'),
            SizedBox(
              height: 20.h,
            ),
            Builder(builder: (context) {
              return Text(
                textAlign: TextAlign.center,
                'Please upload the prescription from a certified doctor.',
                style: TextStyle(fontSize: 20.sp, color: Colors.black54),
              );
            }),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.all(30),
              child: Center(
                child: Container(
                  // height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ShareUpload(
                        icon: Icons.link,
                        text: 'Share Link',
                      ),
                      const ShareUpload(
                        icon: Icons.file_upload,
                        text: 'Upload',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70.h,
            ),
            GestureDetector(
              onTap: () {},
              child: ClickButton(
                text: 'Continue',
                size: 30,
                color: Colors.blue.shade50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShareUpload extends StatelessWidget {
  const ShareUpload({
    Key? key,
    required this.text,
    required this.icon,
    this.color,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(
              icon,
              size: 40,
              color: color,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }
}
