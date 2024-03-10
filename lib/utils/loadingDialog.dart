import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  String Text;
  LoadingDialog(this.Text, {Key? key}) : super(key: key);

  @override
  LoadingDialogState createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        //backgroundColor: appcolor.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator(strokeWidth: 4.0),
                    ),
                    ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        'images/gbit_logo.jpg',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Text(
                  '${widget.Text}, please wait...',
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
