import 'package:flutter/material.dart';
import 'package:panipelo/HomePage.dart';

class MachineDetailsScreen extends StatelessWidget {
  const MachineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<CollectionItem> collections = [
      CollectionItem(
        date: "May 31, 2024",
        time: "10:30 AM",
        amount: 150,
        coins: 12,
      ),
      CollectionItem(
        date: "May 31, 2024",
        time: "09:15 AM",
        amount: 200,
        coins: 16,
      ),
      CollectionItem(
        date: "May 30, 2024",
        time: "04:45 PM",
        amount: 180,
        coins: 14,
      ),
      CollectionItem(
        date: "May 30, 2024",
        time: "03:20 PM",
        amount: 120,
        coins: 10,
      ),
      CollectionItem(
        date: "May 30, 2024",
        time: "11:10 AM",
        amount: 160,
        coins: 13,
      ),

    ];

    return Scaffold(
      backgroundColor: const Color(0xfff4f8fb),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: size.width * 0.05,
            right: size.width * 0.05,
            top: size.height * 0.01,
            bottom: 100, // Prevents overlap with bottom nav
          ),
          child: Column(
            children: [

              /// HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return Homepage();
                      }));
                    },
                    icon: const Icon(Icons.arrow_back_ios_new, size: 20,),
                  ),

                  Expanded(
                    child: Column(
                      children: const [
                        Text(
                          "Machine A",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Noto',
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Office Building",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'Noto',
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Color(0xff389ffd),
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.03),

              /// WATER LEVEL CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.03,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffEAF5FF),
                      const Color(0xffF8FBFF),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: size.width * 0.55,
                      height: size.width * 0.55,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: size.width * 0.55,
                            height: size.width * 0.55,
                            child: CircularProgressIndicator(
                              value: 0.75,
                              strokeWidth: 12,
                              backgroundColor:
                              const Color(0xffDCEEFF),
                              valueColor:
                              const AlwaysStoppedAnimation(
                                Color(0xff389ffd),
                              ),
                            ),
                          ),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children:  [
                              Text(
                                "75%",
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff389ffd),
                                  fontFamily: 'Noto'
                                ),
                              ),
                              Text(
                                "Water Level",
                                style: TextStyle(
                                  color: Colors.grey.shade900,
                                  fontSize: 16,
                                    fontFamily: 'Noto'
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),

              /// COLLECTION CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Today's Coin Collection",
                      style: TextStyle(
                        color: Color(0xff56627A),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Noto'
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "₹ 1,250.00",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Noto'
                      ),
                    ),
                    Text(
                      "Total collection today",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                          fontFamily: 'Noto'
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),

              /// QUICK STATS CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quick Stats (This Month)",
                      style: TextStyle(
                          color: Color(0xff56627A),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                          fontFamily: 'Noto'
                      ),
                    ),

                    SizedBox(height: size.height * 0.02),

                    Row(
                      children: const [
                        Expanded(
                          child: _StatItem(
                            title: "Transactions",
                            value: "32",
                          ),
                        ),
                        Expanded(
                          child: _StatItem(
                            title: "Total Coins",
                            value: "125",

                          ),
                        ),
                        Expanded(
                          child: _StatItem(
                            title: "Last Collection",
                            value: "10:30 AM",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        "Today's Collection",
                        style: TextStyle(
                            color: Color(0xff56627A),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Noto'
                        ),
                      ),
                    ),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: collections.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 1,
                          color: Colors.grey.shade200,
                        );
                      },
                      itemBuilder: (context, index) {
                        final item = collections[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [

                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.date,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff4D5A73),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.time,
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "₹ ${item.amount.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Color(0xff2DBE74),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Noto'
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${item.coins} Coins",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),


    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
              fontFamily: 'Noto'
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18  ,
            fontWeight: FontWeight.bold,
              fontFamily: 'Noto'
          ),
        ),
      ],
    );
  }
}

class CollectionItem {
  final String date;
  final String time;
  final double amount;
  final int coins;

  CollectionItem({
    required this.date,
    required this.time,
    required this.amount,
    required this.coins,
  });
}
