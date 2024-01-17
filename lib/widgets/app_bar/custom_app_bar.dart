import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web3_freelancer/core/app_export.dart';
import 'package:web3modal_flutter/services/w3m_service/w3m_service.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.height,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  }) : super(
          key: key,
        );

  final double? height;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    W3MService web3Service = context.read();
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: height ?? 50,
      backgroundColor: Colors.transparent,
      actions: [
        if(web3Service.tokenImageUrl!=null)
        Image.network(web3Service.tokenImageUrl!,errorBuilder: (c,e,es){
          return SizedBox();
        }),
        // W3MNetworkSelectButton(service: web3Service),
        W3MAccountButton(service: web3Service,size: BaseButtonSize.small,),
        if (actions != null) ...actions!,
        W3MConnectWalletButton(service: web3Service),
        SizedBox(
          width: 7,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(
        100,
        height ?? 50,
      );
}
