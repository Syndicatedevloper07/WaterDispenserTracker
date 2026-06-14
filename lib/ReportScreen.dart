import 'package:flutter/material.dart';

class Reportscreen extends StatefulWidget {
  const Reportscreen({super.key});

  @override
  State<Reportscreen> createState() => _ReportscreenState();
}

class _ReportscreenState extends State<Reportscreen> {
  DateTime? fromDate;
  DateTime? toDate;

  String selectedMachine = "Machine 1";
  String selectedFormat = "PDF";

  Future<void> selectDate(bool isFromDate) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      setState(() {
        if (isFromDate) {
          fromDate = pickedDate;
        } else {
          toDate = pickedDate;
        }
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Select Date";

    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xffF4F8FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            top: height * 0.015,
            bottom: 100, // Prevent bottom nav overlap
          ),
          child: Column(
            children: [
              /// HEADER
              Center(
                child: Text(
                  "Reports",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Noto',
                  ),
                ),
              ),
              const SizedBox(width: 48),

              SizedBox(height: height * 0.03),

              /// FILTER CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
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
                    const Text(
                      "Filter Data",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Noto',
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    /// DATES
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "From Date",
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: 'Noto'
                                ),
                              ),

                              const SizedBox(height: 8),

                              InkWell(
                                onTap: () => selectDate(true),
                                child: Container(
                                  height: 55,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          formatDate(fromDate),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.calendar_month,
                                        color: Color(0xff389ffd),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: width * 0.03),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                "To Date",
                                style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily: 'Noto'
                                ),
                              ),

                              const SizedBox(height: 8),

                              InkWell(
                                onTap: () => selectDate(false),
                                child: Container(
                                  height: 55,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          formatDate(toDate),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.calendar_month,
                                        color: Color(0xff389ffd),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.025),

                    /// MACHINE DROPDOWN
                     Text(
                      "Machine",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Noto'
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: selectedMachine,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items:  [
                        DropdownMenuItem(
                          value: "Machine 1",
                          child: Text("Machine 1", style: TextStyle(fontFamily: 'Noto', fontWeight: FontWeight.w600, fontSize: 14),),
                        ),
                        DropdownMenuItem(
                          value: "Machine 2",
                          child: Text("Machine 2", style: TextStyle(fontFamily: 'Noto', fontWeight: FontWeight.w600, fontSize: 14)),
                        ),
                        DropdownMenuItem(
                          value: "Machine 3",
                          child: Text("Machine 3", style: TextStyle(fontFamily: 'Noto', fontWeight: FontWeight.w600, fontSize: 14)),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedMachine = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.01),

              /// DOWNLOAD CARD
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(width * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
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
                    const Text(
                      "Download Report",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Noto',
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    Text(
                      "File Format",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Noto'
                      ),
                    ),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: selectedFormat,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(value: "PDF", child: Text("PDF", style: TextStyle(fontFamily: 'Noto', fontWeight: FontWeight.w600, fontSize: 14))),
                        DropdownMenuItem(value: "CSV", child: Text("CSV", style: TextStyle(fontFamily: 'Noto', fontWeight: FontWeight.w600, fontSize: 14))),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedFormat = value!;
                        });
                      },
                    ),

                    SizedBox(height: height * 0.03),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Download Logic
                        },
                        icon: const Icon(Icons.download),
                        label: const Text(
                          "Download",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Noto'
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff389ffd),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
