import 'package:flutter/material.dart';
import 'package:flutter_give_collect_money/models/user.dart';
import 'package:flutter_give_collect_money/utils/utils.dart';
import 'package:flutter_give_collect_money/widgets/app_tile.dart';
import 'package:flutter_give_collect_money/widgets/revolving_user_widget.dart';
import 'package:flutter_give_collect_money/widgets/user_avatar.dart';
import 'package:flutter_give_collect_money/widgets/user_info_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              verticalSpace(60),
              /// Row for user img and notifications & more button...
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        horizontalSpace(4),
                        UserAvatar(user: UserList.users.first),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_none_rounded,
                          size: 28,
                        ),
                        horizontalSpace(16),
                        Icon(
                          Icons.more_vert_rounded,
                          size: 28,
                        ),
                        horizontalSpace(16),
                      ],
                    )
                  ],
                ),
              ),
              /// Container User name and Total balance avail &
              /// transactions detail button...
              UserInfoCard(size: size),
              verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  AppTile(
                    label: "Payment",
                    message: "Transfer to ",
                    lottieAssetPath: "assets/payment.json",
                  ),
                  AppTile(
                    label: "Collect money",
                    message: "Request from ",
                    lottieAssetPath: "assets/collect_money.json",
                  ),
                ],
              ),
              verticalSpace(16),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: const [
                    Text(
                      "Recently traded:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          /// Circular avatar rotations...
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: Offset(0, size.height / 4),
              child: RevolvingUserWidget(),
            ),
          )
        ],
      ),
    );
  }
}
