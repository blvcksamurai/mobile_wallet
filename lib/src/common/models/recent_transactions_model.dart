class RecentTransactionsModel {
  final String name;
  final String transactionType;
  final String image;
  final double amount;
  final String timestamp;

  const RecentTransactionsModel({
    required this.name,
    required this.transactionType,
    required this.image,
    required this.amount,
    required this.timestamp,
  });
}

final recentTransactions = [
  RecentTransactionsModel(
    name: 'ChatGPT Plus',
    transactionType: 'Subscription',
    image: 'openai.png',
    amount: 19.99,
    timestamp: '12:45pm',
  ),

  RecentTransactionsModel(
    name: 'Sephora',
    transactionType: 'Shopping',
    image: 'framer.png',
    amount: 35.70,
    timestamp: 'Yesterday',
  ),

  RecentTransactionsModel(
    name: 'Spotify Premium',
    transactionType: 'Subscription',
    image: 'spotify.png',
    amount: 9.99,
    timestamp: 'Feb 11',
  ),
];
