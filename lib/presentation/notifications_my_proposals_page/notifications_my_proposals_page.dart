import '../notifications_my_proposals_page/widgets/notificationsmyproposals_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

class NotificationsMyProposalsPage extends StatefulWidget {
  const NotificationsMyProposalsPage({Key? key}) : super(key: key);

  @override
  NotificationsMyProposalsPageState createState() =>
      NotificationsMyProposalsPageState();
}

class NotificationsMyProposalsPageState
    extends State<NotificationsMyProposalsPage>
    with AutomaticKeepAliveClientMixin<NotificationsMyProposalsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.background,
                child: Column(
                    children: [SizedBox(height: 24), _buildOpened(context)]))));
  }

  /// Section Widget
  Widget _buildOpened(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text("Application Status (3)",
                    style: CustomTextStyles.titleMediumBold_1)),
            CustomImageView(
                imagePath: ImageConstant.imgArrowUp, height: 24, width: 24)
          ]),
          SizedBox(height: 23),
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.5),
                    child: SizedBox(
                        width: 327,
                        child: Divider(
                            height: 1, thickness: 1, color: appTheme.gray300)));
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return NotificationsmyproposalsItemWidget();
              })
        ]));
  }
}
