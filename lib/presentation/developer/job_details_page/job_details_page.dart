import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3_freelancer/data/model/project_details.dart';
import 'package:web3_freelancer/widgets/custom_elevated_button.dart';

class JobDetailsPage extends StatefulWidget {
  final String s;
  final String details;
  const JobDetailsPage(this.s, this.details, {Key? key}) : super(key: key);

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
        child: Column(children: [
      SizedBox(height: 20),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 24),
                child:
                    Text(widget.s, style: CustomTextStyles.titleMediumBold_1))),
        SizedBox(height: 13),
        Container(
            width: 319,
            margin: EdgeInsets.only(left: 31, right: 24),
            child: Text(widget.details,
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
            ]))
      ])
    ]));
  }
}
