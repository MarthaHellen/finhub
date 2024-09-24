import 'package:flutter/material.dart';

class SavingsDetails extends StatefulWidget {
  const SavingsDetails({super.key});

  @override
  State<SavingsDetails> createState() => _SavingsDetailsState();
}

class _SavingsDetailsState extends State<SavingsDetails> {
  String selectedValue = 'Plan name 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9EEF9),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Text(
                          "Savings Details",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF2B5BBA),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 130,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                                .pushReplacementNamed('/choose_plan');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B5BBA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.add_box_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Martha',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF433D3D)),
                      ),
                      const Divider(
                        color: Color(0xFF433D3D), // Set the color of the line
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Available balance",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Interest per annum",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "UGX 800,000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "3.0%",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF433D3D),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Next Saving Date",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFB1ADAD),
                          fontFamily: 'Questrial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        "14/07/2023",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF2B5BBA),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('/previous_savings');
                          },
                          child: Text(
                            "Previous Savings",
                            style: TextStyle(
                              fontSize: 18,
                              color: const Color(0xFF2B5BBA).withOpacity(0.57),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 317,
                          height: 35,
                          child: Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(10),
                            child: OutlinedButton(
                              onPressed: () {
                                //
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: const BorderSide(
                                  color: Color(0xFF2B5BBA),
                                ),
                              ),
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Request Withdraw',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF2B5BBA),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Color(0xFF2B5BBA),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Plan's Details",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF433D3D),
                        ),
                      ),
                      const Divider(
                        color: Color(0xFF433D3D), // Set the color of the line
                        thickness: 1.0,
                      ),
                      Container(
                        width: 158,
                        height: 29,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedValue,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down,
                                color: Color(0xFFEBEBEB)),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFB1ADAD),
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Plan name 1',
                              'Plan name 2',
                              'Plan name 3',
                              'Plan name 4',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Periodic Amount",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Frequency",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "UGX 20,000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Monthly",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Lock Status",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Withdraw date",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Locked",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "14/07/2026",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Interest",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "Status",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Locked",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Active",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Accumulated amount",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFFB1ADAD),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "UGX 200,000",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF2B5BBA),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 118,
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () {
                                //;
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2B5BBA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Edit Plan',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 118,
                            height: 35,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/new_saving_plan');
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: const BorderSide(
                                  color: Color(0xFF2B5BBA),
                                ),
                              ),
                              child: const Text(
                                'New Plan',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF2B5BBA),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
