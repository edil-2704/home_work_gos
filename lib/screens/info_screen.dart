import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:home_work_gos/models/models.dart';
import 'package:home_work_gos/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  final UserModel userModel;

  const InfoScreen({
    super.key,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 114,
                          width: 114,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                          ),
                          child: Image.asset(
                            userModel.imageUrl,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 70,
                          width: 300,
                          child: Expanded(
                            child: Text(
                              userModel.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          userModel.position ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff3B81EA),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Направление',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffA8A8A8),
                    ),
                  ),
                  Text(
                    userModel.deployment ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Отдел',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffA8A8A8),
                    ),
                  ),
                  Text(
                    userModel.department ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffA8A8A8),
                    ),
                  ),
                  Text(
                    userModel.email ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Дата рождения',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffA8A8A8),
                    ),
                  ),
                  Text(
                    userModel.birhtday ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Wrap(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Позвонить',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(Icons.close),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(userModel.name),
                                const SizedBox(height: 40),
                                CommonListTile(
                                  subtitle: userModel.phoneNumber ?? '-',
                                  title: 'Телефон основной',
                                ),
                                const SizedBox(height: 20),
                                CommonListTile(
                                  subtitle: userModel.phoneNumber ?? '-',
                                  title: 'Телефон рабочий',
                                ),
                                const SizedBox(height: 20),
                                CommonListTile(
                                  subtitle: userModel.phoneNumber ?? '-',
                                  title: 'Телефон WhatsApp',
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Телефон основной',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xffA8A8A8),
                              ),
                            ),
                            Text(
                              userModel.phoneNumber ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: () async {
                            await FlutterPhoneDirectCaller.callNumber(
                                userModel.phoneNumber ?? '');
                            launch(userModel.phoneNumber ?? '');
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
