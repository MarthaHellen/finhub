import 'package:flutter/material.dart';

class FAQS extends StatelessWidget {
  const FAQS({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 106,
              height: 27,
              child: ElevatedButton(
                onPressed: () {
                  //;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B5BBA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'General',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 106,
              height: 27,
              child: OutlinedButton(
                onPressed: () {
                  //
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(
                    color: Color(0xFF2B5BBA),
                  ),
                ),
                child: const Text(
                  'Savings',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2B5BBA),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 106,
              height: 27,
              child: OutlinedButton(
                onPressed: () {
                  //
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: const BorderSide(
                    color: Color(0xFF2B5BBA),
                  ),
                ),
                child: const Text(
                  'Loans',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2B5BBA),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFCDCDCD).withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xFF979797),
                  size: 24,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF979797),
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE7E7E8),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'What is FinHub?',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 1.6,
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF2B5BBA),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Color(0xFFEDEDED),
                thickness: 1.0,
              ),
              const Text(
                "FinHub is a Fintech company that aims at providing financial services to students in universities across the country. It's main purpose..",
                style: TextStyle(
                  color: Color(0xFFA0A0A0),
                  fontFamily: 'Questrial',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE7E7E8),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "What are it's main objectives?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 1.6,
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF2B5BBA),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE7E7E8),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    child: Text(
                      "How is it different from other Fintech companies?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Questrial',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: 1.6,
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF2B5BBA),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE7E7E8),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "When was it founded?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 1.6,
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF2B5BBA),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE7E7E8),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Who are the founders?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Transform.scale(
                    scale: 1.6,
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF2B5BBA),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
