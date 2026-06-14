import 'package:flutter/material.dart';
import 'package:panipelo/MachineDetailsScreen.dart';

class Machine {
  final String name;
  final String location;
  final int waterLevel;

  Machine({
    required this.name,
    required this.location,
    required this.waterLevel,
  });
}


class MachineCard extends StatelessWidget {
  final Machine machine;

  const MachineCard({
    super.key,
    required this.machine,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return MachineDetailsScreen();
        }));
      },
      child: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xffF3F8FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.water_drop,
                color: Color(0xff389ffd),
                size: 32,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    machine.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Noto'
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    machine.location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontFamily: 'Noto'
                    ),
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${machine.waterLevel}%",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff389ffd),
                    fontFamily: 'Noto'
                  ),
                ),
                const Text(
                  "Water Level",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                      fontFamily: 'Noto'
                  ),
                ),
              ],
            ),

            const SizedBox(width: 10),

            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}