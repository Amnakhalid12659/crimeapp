import 'package:flutter/material.dart';
import 'package:project/utils/constants/colors.dart';
import 'package:get/get.dart';

class EmergencyContactsScreen extends StatelessWidget {
  EmergencyContactsScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 236),
      body: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: MyColors.pinkGradient,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 16, left: 19),
              child: Text(
                "Emergency Contacts",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'My Safety Network',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () => _showAddContactSheet(),
                    child: Row(
                      children: [
                        const Text(
                          '\u2295',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF2E5C8F),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Add your Connections',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Emergency Services',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildEmgContactRow('\u260E', 'Ambulance: 112'),
                  const SizedBox(height: 5),
                  _buildEmgContactRow('\u260E', 'Police: 110'),
                  const SizedBox(height: 5),
                  _buildEmgContactRow('\u260E', 'Fire Brigade: 112'),
                  const SizedBox(height: 5),
                  _buildEmgContactRow(
                      '\u260E', 'Community Forum: (239) 555-0108'),
                  const SizedBox(height: 20),
                  const Text(
                    'The emergency page of the app offers users essential safety resources and access to emergency services. Users can create and manage their safety network.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 136, 142, 150),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddContactSheet() {
    Get.bottomSheet(
      Container(
        height: 400,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: MyColors.blueVioletGradient,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(
          children: [
            Text(
              "Add Emergency Contact",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: "Enter contact name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2))),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: "Enter phone number",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2))),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFCE87FF),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _numberController.text.isNotEmpty) {
                  Get.back();
                  Get.snackbar(
                    "Success",
                    "Contact ${_nameController.text} added ",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: MyColors.success,
                    colorText: Colors.white,
                  );
                  _nameController.clear();
                  _numberController.clear();
                } else {
                  Get.snackbar(
                    "Error",
                    "Please fill all fields",
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: MyColors.error,
                    colorText: Colors.white,
                  );
                }
              },
              child: const Text(
                "Save Contact",
                style: TextStyle(color: Color.fromARGB(255, 236, 232, 232)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmgContactRow(String icon, String text) {
    return Row(
      children: [
        Text(
          icon,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF2E5C8F),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }
}
