import 'package:flutter/material.dart';
import 'package:home_work_gos/models/models.dart';
import 'package:home_work_gos/screens/info_screen.dart';
import 'package:home_work_gos/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Сотрудники',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            const Text(
              'У кого сегодня день рождения',
              style: TextStyle(
                color: Color(0xff3B81EA),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                  ),
                  hintText: 'Поиск',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 87,
              width: 360,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: birhtdayList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.amber,
                      child: Image.asset(birhtdayList[index].imageUrl),
                      // backgroundImage: AssetImage(),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoScreen(
                           userModel: birhtdayList[index],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 5);
                },
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'У кого завтра день рождения',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 87,
              width: 360,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tomorrowBirhtdayList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.amber,
                      child: Image.asset(tomorrowBirhtdayList[index].imageUrl),
                      // backgroundImage: AssetImage(),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoScreen(
                          userModel: birhtdayList[index],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 5);
                },
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Все сотрудники',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 15),
            const CommonNameCard(),
          ],
        ),
      ),
    );
  }
}
