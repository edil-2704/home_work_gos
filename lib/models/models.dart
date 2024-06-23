class UserModel {
  final String name;
  final String imageUrl;
  final String? position;
  final String? deployment;
  final String? department;
  final String? email;
  final String? birhtday;
  final String? phoneNumber;

  UserModel({
    required this.name,
    required this.imageUrl,
    this.position,
    this.deployment,
    this.department,
    this.email,
    this.birhtday,
    this.phoneNumber,
  });
}

List<UserModel> birhtdayList = [
  UserModel(
    name: 'Жыпаркулов Мырзабек Жыпаркулович',
    imageUrl: 'assets/images/image1.png',
    position: 'Генеральный директор',
    deployment: 'Дирекция управления',
    department: 'Отдел управления',
    email: 'mjagarkulov@gosecotech.kg',
    birhtday: '16.09.1972',
    phoneNumber: '+9965501234321',
  ),
  UserModel(
    name: 'John Week Rodgers',
    imageUrl: 'assets/images/image2.png',
    position: 'Генеральный директор',
    deployment: 'Дирекция управления',
    department: 'Отдел управления',
    email: 'mjagarkulov@gosecotech.kg',
    birhtday: '16.09.1972',
    phoneNumber: '+9965501234321',
  ),
  UserModel(
    name: 'Артыкбаев Расул Саткынович',
    imageUrl: 'assets/images/image3.png',
    position: 'Главный Бухгалтер',
    deployment: 'Дирекция управления',
    department: 'Отдел бухгалтерии',
    email: 'mjagarkulov@gosecotech.kg',
    birhtday: '16.09.1972',
    phoneNumber: '+9965501234321',
  ),
  UserModel(
    name: 'Жыпаркулов Мырзабек Жыпаркулович',
    imageUrl: 'assets/images/image4.png',
    position: 'Генеральный директор',
    deployment: 'Дирекция управления',
    department: 'Отдел управления',
    email: 'mjagarkulov@gosecotech.kg',
    birhtday: '16.09.1972',
    phoneNumber: '+9965501234321',
  ),
];

List<UserModel> tomorrowBirhtdayList = [
  UserModel(
    name: 'Жыпаркулов Мырзабек Жыпаркулович',
    imageUrl: 'assets/images/bitmap2.png',
    position: 'Генеральный директор',
    deployment: 'Дирекция управления',
    department: 'Отдел управления',
    email: 'mjagarkulov@gosecotech.kg',
    birhtday: '16.09.1972',
    phoneNumber: '+9965501234321',
  ),
  UserModel(
    name: 'Жыпаркулов Мырзабек Жыпаркулович',
    imageUrl: 'assets/images/lady.png',
    position: 'Генеральный директор',
    deployment: 'Дирекция управления',
    department: 'Отдел управления',
    email: 'mjagarkulov@gosecotech.kg',
    birhtday: '16.09.1972',
    phoneNumber: '+9965501234321',
  ),
];
