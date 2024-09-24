import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';

bool _isLoading = false;

class Inquiries extends StatefulWidget {
  const Inquiries({super.key});

  @override
  State<Inquiries> createState() => _InquiriesState();
}

class _InquiriesState extends State<Inquiries> {
  File? _image;
  Uint8List webImage = Uint8List(8);

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      try {
        final ImagePicker picker = ImagePicker();
        final XFile? pickedFile =
            await picker.pickImage(source: ImageSource.gallery);

        setState(() {
          _image = pickedFile != null ? File(pickedFile.path) : null;
        });
      } on PlatformException catch (e) {
        print("Failed to pick image: $e");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        var f = await pickedFile.readAsBytes();
        setState(() {
          webImage = f;
          _image = File('a');
        });
      } else {
        print("No image has been picked");
      }
    } else {
      print("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Make an Inquiry",
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF2B5BBA),
              fontFamily: 'Questrial',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Form(
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    //
                  }
                  return null;
                },
                cursorColor: const Color(0xFF2B5BBA),
                decoration: InputDecoration(
                  hintText: "Subject",
                  hintStyle: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFFBCBBBB),
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.all(20),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _pickImage();
                },
                child: DottedBorder(
                  color: const Color(0xFFCDCDCD),
                  radius: const Radius.circular(10),
                  borderType: BorderType.RRect,
                  strokeWidth: 1.0,
                  dashPattern: const [10, 5],
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      height: 140,
                      width: 349,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _image == null
                              ? Image.asset(
                                  'images/image.png',
                                  height: 60,
                                  width: 60,
                                )
                              : kIsWeb
                                  ? Image.memory(
                                      webImage,
                                      fit: BoxFit.fill,
                                      height: 100,
                                      width: 100,
                                    )
                                  : Image.file(
                                      _image!,
                                      height: 100,
                                      width: 100,
                                    ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Images (Optional)',
                            style: TextStyle(
                              color: Color(0xFFBCBBBB),
                              fontFamily: 'Questrial',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                constraints: const BoxConstraints(
                  maxHeight: 140,
                  maxWidth: 349,
                ),
                child: TextFormField(
                  maxLines: 140,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // Your validation logic here
                    }
                    return null;
                  },
                  cursorColor: const Color(0xFF2B5BBA),
                  decoration: InputDecoration(
                    hintText: "Describe how you want us to help you",
                    hintStyle: const TextStyle(
                      color: Color(0xFFBCBBBB),
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFD9D9D9),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFCDCDCD),
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: 349,
          height: 54,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _isLoading = true;
              });
              // Simulating verification process
              Future.delayed(const Duration(seconds: 2), () {
                setState(() {
                  _isLoading = false;
                });
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2B5BBA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: _isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : const Text(
                    'Send',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Previous inquiries",
            style: TextStyle(
              fontSize: 25,
              color: Color(0xFF2B5BBA),
              fontFamily: 'Questrial',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE7E7E8),
            ),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "images/card1.jpg",
                    height: 61,
                    width: 66,
                  ),
                  const Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "+2",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Questrial',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Transaction Error?',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          'Not replied',
                          style: TextStyle(
                            color: Color(0xFFF43A3A),
                            fontFamily: 'Questrial',
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "I always get this error whenever I am trying to initiate a transaction. It has been happening a lot.",
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
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
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
                  Stack(
                    children: [
                      Image.asset(
                        "images/card1.jpg",
                        height: 61,
                        width: 66,
                      ),
                      const Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Text(
                            "+2",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Questrial',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Transaction Error?',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'Replied',
                              style: TextStyle(
                                color: Color(0xFF02AF71),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "I always get this error whenever I am trying to initiate a transaction. It has been happening a lot.",
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
                ],
              ),
              const Divider(
                color: Color(0xFFEDEDED),
                thickness: 1.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reply",
                  style: TextStyle(
                    color: Color(0xFF2B5BBA),
                    fontFamily: 'Questrial',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              const Text(
                "Hey! Thanks for reaching us, we are resolving the issue!",
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
      ],
    );
  }
}
