class UpcomingBillsModel {
  final String name;
  final String image;
  final double amount;
  final String due;

  const UpcomingBillsModel({
    required this.name,
    required this.image,
    required this.amount,
    required this.due,
  });
}

final upcomingBills = [
  UpcomingBillsModel(
    name: 'Youtube Premium',
    image: 'youtube.png',
    amount: 7.99,
    due: 'Tomorrow',
  ),
  UpcomingBillsModel(
    name: 'iCloud Subscription',
    image: 'apple.png',
    amount: 11.99,
    due: 'Feb 20',
  ),
  UpcomingBillsModel(
    name: 'Geforce Now',
    image: 'nvidia.png',
    amount: 9.99,
    due: 'Feb 28',
  ),
];
