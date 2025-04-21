import 'package:flutter/material.dart';

class CrimeReportScreen extends StatefulWidget {
  const CrimeReportScreen({super.key});

  @override
  State<CrimeReportScreen> createState() => _CrimeReportScreenState();
}

class _CrimeReportScreenState extends State<CrimeReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report a Crime',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF2E5C8F),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          child: ListView(
            children: [
              Text(
                'Personal Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3051),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Contact Info (Phone/Email)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact information';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Incident Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B3051),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Crime Type',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the type of crime';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date and Time',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date and time of the incident';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location of the incident';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the incident';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2E5C8F), // Blue background color
                  padding: EdgeInsets.symmetric(vertical: 15), // Button padding
                ),
                child: Text(
                  'Submit Report',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white, // White text color
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
