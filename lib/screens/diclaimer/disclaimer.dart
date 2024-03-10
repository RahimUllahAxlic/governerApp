import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/utils/colors.dart';

class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor.maincolor,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back()),
        title: const Text(
          'Disclaimer',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Disclaimer:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'This application is privately owned and is not affiliated with or endorsed by any government agency. The information provided is for general informational purposes only. The developers of this application disclaim any responsibility for the accuracy or completeness of the content and shall not be held liable for any errors or omissions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Terms of Use:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'By using this application, you hereby consent to our disclaimer and agree to its terms.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
