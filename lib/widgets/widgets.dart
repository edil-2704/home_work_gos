import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:home_work_gos/models/models.dart';
import 'package:home_work_gos/screens/info_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class CommonListTile extends StatelessWidget {
  final String subtitle;
  final String title;

  const CommonListTile({
    super.key,
    required this.subtitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Color(
                  0xffA8A8A8,
                ),
              ),
            ),
            Text(subtitle),
          ],
        ),
        IconButton(
          highlightColor: Colors.transparent,
          onPressed: () async {
            await FlutterPhoneDirectCaller.callNumber('-');
            launch('+9965858585855');
          },
          icon: const Icon(
            Icons.phone_outlined,
            color: Color(0xff36CD72),
            size: 24,
          ),
        ),
      ],
    );
  }
}

class CommonNameCard extends StatelessWidget {
  const CommonNameCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: birhtdayList.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InfoScreen(userModel: birhtdayList[index]),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Image.asset(
                      birhtdayList[index].imageUrl,
                      height: 42,
                      width: 42,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        birhtdayList[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                            birhtdayList[index].phoneNumber ?? '');
                        launch(birhtdayList[index].phoneNumber ?? '');
                      },
                      icon: const Icon(
                        Icons.phone_outlined,
                        color: Color(0xff36CD72),
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 15);
        },
      ),
    );
  }
}
