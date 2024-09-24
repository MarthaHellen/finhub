import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class ProfileInfo extends StatefulWidget {
  ProfileInfo({Key? key});

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  File? _image;
  Uint8List? webImage;
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final courseController = TextEditingController();
  final collegeController = TextEditingController();
  final universityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

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
          _image = null; // Clear the mobile image if any
        });
      } else {
        print("No image has been picked");
      }
    } else {
      print("Something went wrong");
    }
  }

  ImageProvider<Object>? _getProfileImage() {
    if (_image != null) {
      return FileImage(_image!);
    } else if (webImage != null) {
      return MemoryImage(webImage!);
    }
    return AssetImage('images/avatar@3x.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF2B5BBA).withOpacity(0.29),
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const Text(
                          'Personal Info',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF050901),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "images/edit2.png",
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 30, left: 30, top: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 86,
                        height: 86,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                          image: DecorationImage(
                            image: _getProfileImage()!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: Image.asset(
                              'images/camera.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          children: [
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Full Name",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              // Adjust the horizontal margin as desired
                              child: TextFormField(
                                cursorColor: Color(0xFF2B5BBA),
                                controller: fullNameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    //
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "John doe",
                                  hintStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF828282),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(20),
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email Address",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF433D3D),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              child: TextFormField(
                                cursorColor: Color(0xFF2B5BBA),
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "johndoe@example.com",
                                  hintStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF828282),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "OTHER INFO",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF2B5BBA),
                                fontFamily: 'Questrial',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Please endeavor to provide this information",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF9C9D9E),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              // Adjust the horizontal margin as desired
                              child: TextFormField(
                                cursorColor: Color(0xFF2B5BBA),
                                controller: phoneController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Phone",
                                  hintStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF828282),
                                    fontFamily: 'Questrial',
                                    fontWeight: FontWeight.w400,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD9D9D9)),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFCDCDCD)),
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(20),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              cursorColor: Color(0xFF2B5BBA),
                              keyboardType: TextInputType.text,
                              controller: universityController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "University",
                                hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF828282),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFD9D9D9)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFCDCDCD)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.all(20),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              cursorColor: Color(0xFF2B5BBA),
                              keyboardType: TextInputType.text,
                              controller: collegeController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "College",
                                hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF828282),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFD9D9D9)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFCDCDCD)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.all(20),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            TextFormField(
                              cursorColor: Color(0xFF2B5BBA),
                              keyboardType: TextInputType.text,
                              controller: courseController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "Course",
                                hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF828282),
                                  fontFamily: 'Questrial',
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFD9D9D9)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFCDCDCD)),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.all(20),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
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
                                'Save',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
