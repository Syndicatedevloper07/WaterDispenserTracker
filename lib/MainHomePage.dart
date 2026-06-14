import 'package:flutter/material.dart';
import 'package:panipelo/Utils.dart';

class Mainhomepage extends StatefulWidget {
  const Mainhomepage({super.key});

  @override
  State<Mainhomepage> createState() => _MainhomepageState();
}

class _MainhomepageState extends State<Mainhomepage> {

  final List<Machine> machines = [
    Machine(name: "Machine A", location: "Office Building", waterLevel: 75),
    Machine(name: "Machine B", location: "Shopping Mall", waterLevel: 40),
    Machine(name: "Machine C", location: "School Campus", waterLevel: 90),
    Machine(name: "Machine D", location: "Gym Center", waterLevel: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff4f8fb),
        toolbarHeight: 75,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning.", style: TextStyle(color: Colors.grey.shade400, fontFamily: 'Noto', fontSize: 14, ),),
            SizedBox(height: 2,),
            Text("Manish Suthar", style: TextStyle(color: Colors.black, fontFamily: 'Noto', fontSize: 18, fontWeight: FontWeight.w500 ),)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none, color: Color(0xff389ffd),))
        ],
      ),
      backgroundColor: Color(0xfff4f8fb),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 2),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.heightOf(context) * 0.05,
              padding: EdgeInsetsGeometry.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 1),
                        blurRadius: 1,
                        spreadRadius: 1
                    )
                  ]
              ),
              child:   Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: SizedBox(
                      height: 50, // Adjust this value
                      child: TextFormField(
                        obscureText: true,
                        decoration:  InputDecoration(
                            hintText: "Search machine..",
                            border: InputBorder.none,
                            isDense: true,
                            hintStyle: TextStyle(color: Colors.grey.shade600, fontFamily: 'Noto', fontSize: 12)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.heightOf(context) * 0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Machines" , style: TextStyle(color: Colors.black, fontFamily: 'Noto', fontSize: 18, fontWeight: FontWeight.w700,),),
                InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (_) => const AddMachineDialog(),
                      barrierDismissible: false
                    );
                  },
                  child: Container(
                    width: MediaQuery.widthOf(context) * 0.3,
                    height: MediaQuery.heightOf(context) * 0.04,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff389ffd), width: 1.5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, color: Color(0xff389ffd), size: 20,),
                        SizedBox(width: 2,),
                        Text("Add Machine" , style: TextStyle(color: Color(0xff389ffd), fontFamily: 'Noto', fontSize: 10, fontWeight: FontWeight.w600),)
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 110),
                itemCount: machines.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: MachineCard(
                      machine: machines[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
}}

class AddMachineDialog extends StatefulWidget {
  const AddMachineDialog({super.key});

  @override
  State<AddMachineDialog> createState() => _AddMachineDialogState();
}

class _AddMachineDialogState extends State<AddMachineDialog> {

  final machineIdController = TextEditingController();
  final machineNameController = TextEditingController();
  final machinePlaceController = TextEditingController();

  InputDecoration inputDecoration(
      String hint,
      IconData icon,
      ) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        fontFamily: 'Noto',
        color: Colors.grey,
      ),
      prefixIcon: Icon(
        icon,
        color: const Color(0xff389ffd),
      ),
      filled: true,
      fillColor: const Color(0xffF8FAFC),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Color(0xff389ffd),
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [

              Row(
                children: [

                  const Expanded(
                    child: Text(
                      "Add Machine",
                      style: TextStyle(
                        fontFamily: 'Noto',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff56627A),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius:
                    BorderRadius.circular(50),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                "Enter machine information below",
                style: TextStyle(
                  fontFamily: 'Noto',
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: machineIdController,
                style: const TextStyle(
                  fontFamily: 'Noto',
                ),
                decoration: inputDecoration(
                  "Machine ID",
                  Icons.qr_code_2,
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: machineNameController,
                style: const TextStyle(
                  fontFamily: 'Noto',
                ),
                decoration: inputDecoration(
                  "Machine Name",
                  Icons.water_drop_outlined,
                ),
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: machinePlaceController,
                style: const TextStyle(
                  fontFamily: 'Noto',
                ),
                maxLines: 2,
                decoration: inputDecoration(
                  "Installed Location",
                  Icons.location_on_outlined,
                ),
              ),

              const SizedBox(height: 28),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {

                        final id =
                            machineIdController.text;

                        final name =
                            machineNameController.text;

                        final place =
                            machinePlaceController.text;

                        // Add machine logic here

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color(0xff56627A),
                        foregroundColor:
                        Colors.white,
                        minimumSize:
                        const Size.fromHeight(52),
                        elevation: 0,
                        shape:
                        RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Add Machine",
                        style: TextStyle(
                          fontFamily: 'Noto',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: width < 350 ? 8 : 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
