import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}


class _EditProfileScreenState extends State<EditProfileScreen> {
   final ImagePicker _picker = ImagePicker();
  File? _profileImage;

  Future<void> _pickImage(ImageSource src) async {
    final picked = await _picker.pickImage(source: src, imageQuality: 80);
    if (picked != null) {
      setState(() => _profileImage = File(picked.path));
    }
  }
  @override
  Widget build(BuildContext context) {
     String _gender = 'Male';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                   
                    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Change Profile Picture'),
        content: Column(
          
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                // _pickImage(ImageSource.gallery);
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take a Photo'),
              onTap: () {
                // _pickImage(ImageSource.camera);
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text('Cancel'),
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
                  },

              child:  
              Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _profileImage != null
                      ? FileImage(_profileImage!)
                      : const AssetImage('assets/user_image.jpeg')
                          as ImageProvider,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Icon(Icons.edit, size: 20, color: Colors.grey[700]),
                ),
              ],
            ),
              
              )
                
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text("NAME"),
                      const SizedBox(height: 25),
                      Text(
                        "Enter your first name",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Divider(thickness: 0.2),
                      const SizedBox(height: 10),
                      Text("DISPLAY NAME"),
                      const SizedBox(height: 25),
                      Text(
                        "Enter your display name",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Divider(thickness: 0.2),
                      const SizedBox(height: 10),
                      Text("Phone Number"),
                      const SizedBox(height: 25),
                      Text(
                        "+1 987XXXX321",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Divider(thickness: 0.2),
                      const SizedBox(height: 10),
                      Text("EMAIL ID"),
                      const SizedBox(height: 25),
                      Text(
                        "john@exmpl.com",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Divider(thickness: 0.2),
                      const SizedBox(height: 10),
                      Text("BUSINESS EMAIL sddress"),
                      const SizedBox(height: 25),
                      Text(
                        "Enter your business email",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Divider(thickness: 0.2),
                      const SizedBox(height: 10),
                      Align(alignment: Alignment.centerLeft, child: Text('Gender',  )),
                const SizedBox(height: 8),
                ToggleButtons(
                  isSelected: ['Male','Female','Other'].map((g) => g == _gender).toList(),
                  onPressed: (i) {
                    setState(() => _gender = ['Male','Female','Other'][i]);
                  },
                  borderRadius: BorderRadius.circular(8),
                  selectedColor: Colors.black,
                  fillColor: Colors.amber,
                  color: Colors.black,
                  children: const [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Male')),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Female')),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('Other')),
                  ],
                ),
                      // Text("Gender"),
                      // const SizedBox(height: 25),

                      // Row(
                      //   children: [
                      //     ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.amber,
                      //         padding: const EdgeInsets.symmetric(
                      //           horizontal: 24,
                      //           vertical: 14,
                      //         ),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //       ),
                      //       child: const Text(
                      //         'Male',
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 20),
                      //     ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.amber,
                      //         padding: const EdgeInsets.symmetric(
                      //           horizontal: 24,
                      //           vertical: 14,
                      //         ),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //       ),
                      //       child: const Text(
                      //         'Female',
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 20),
                      //     ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.amber,
                      //         padding: const EdgeInsets.symmetric(
                      //           horizontal: 24,
                      //           vertical: 14,
                      //         ),
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //       ),
                      //       child: const Text(
                      //         'Other',
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: 14,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Divider(thickness: 0.2),

                      const SizedBox(height: 10),
                      Text("Date of Birth"),
                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date of Birth",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                          Icon(Icons.calendar_month),
                        ],
                      ),
                      Divider(thickness: 0.2),

                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Update Profile',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

