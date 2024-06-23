import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:home_work_gos/models/models.dart';
import 'package:home_work_gos/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  final UserModel todayBirthdayModels;

  const InfoScreen({
    super.key,
    required this.todayBirthdayModels,
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
      body: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        // itemCount: birhtdayList.length,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Center(
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
                            birhtdayList[index].imageUrl,
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 70,
                          width: 300,
                          child: Expanded(
                            child: Text(
                              birhtdayList[index].name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          birhtdayList[index].position ?? '',
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
                    birhtdayList[index].deployment ?? '',
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
                    birhtdayList[index].department ?? '',
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
                    birhtdayList[index].email ?? '',
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
                    birhtdayList[index].birhtday ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
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
                                Text(birhtdayList[index].name),
                                const SizedBox(height: 40),
                                CommonListTile(
                                  subtitle:
                                      birhtdayList[index].phoneNumber ?? '-',
                                      title: 'Телефон основной',
                                ),
                                const SizedBox(height: 20),
                                CommonListTile(
                                  subtitle:
                                      birhtdayList[index].phoneNumber ?? '-',
                                      title: 'Телефон рабочий',
                                ),

                                const SizedBox(height: 20),
                                CommonListTile(
                                  subtitle:
                                      birhtdayList[index].phoneNumber ?? '-',
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
                              birhtdayList[index].phoneNumber ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 25);
        },
      ),
    );
  }
}
