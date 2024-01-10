import '../notifications_general_page/widgets/notificationsgeneral_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:web3_freelancer/core/app_export.dart';

class NotificationsGeneralPage extends StatefulWidget {
  const NotificationsGeneralPage({Key? key}) : super(key: key);

  @override
  NotificationsGeneralPageState createState() =>
      NotificationsGeneralPageState();
}

class NotificationsGeneralPageState extends State<NotificationsGeneralPage>
    with AutomaticKeepAliveClientMixin<NotificationsGeneralPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.background,
                child: Column(children: [
                  SizedBox(height: 24),
                  _buildNotificationsGeneral(context)
                ]))));
  }

  /// Section Widget
  Widget _buildNotificationsGeneral(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.5),
                  child: SizedBox(
                      width: 323,
                      child: Divider(
                          height: 1, thickness: 1, color: appTheme.gray300)));
            },
            itemCount: 4,
            itemBuilder: (context, index) {
              return NotificationsgeneralItemWidget();
            }));
  }
}
