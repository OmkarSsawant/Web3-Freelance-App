import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';

class JobDetailsPage extends StatefulWidget {
  const JobDetailsPage({Key? key}) : super(key: key);

  @override
  JobDetailsPageState createState() => JobDetailsPageState();
}

class JobDetailsPageState extends State<JobDetailsPage>
    with AutomaticKeepAliveClientMixin<JobDetailsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: _buildScrollView(context)));
  }

  /// Section Widget
  Widget _buildScrollView(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(top: 419),
            child: Column(children: [
              SizedBox(height: 20),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 24),
                        child: Text("Job Description",
                            style: CustomTextStyles.titleMediumBold_1))),
                SizedBox(height: 13),
                Container(
                    width: 319,
                    margin: EdgeInsets.only(left: 31, right: 24),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nec porttitor magna luctus tortor. Pretium malesuada lobortis consequat et mauris. ",
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.titleSmallBluegray400
                            .copyWith(height: 1.57))),
                SizedBox(height: 3),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                    decoration: AppDecoration.linear,
                    child: Column(children: [
                      SizedBox(height: 12),
                      CustomElevatedButton(
                          text: "Apply Now",
                          onPressed: () {
                            onTapApplyNow(context);
                          })
                    ]))
              ])
            ])));
  }

  /// Navigates to the applyJobScreen when the action is triggered.
  onTapApplyNow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.applyJobScreen);
  }
}
