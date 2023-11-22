import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/constants/colors.dart';

class VerificationRequest extends StatefulWidget {
  const VerificationRequest({super.key});

  @override
  State<VerificationRequest> createState() => _VerificationRequestState();
}

String dropdownValue = 'Physics';

class _VerificationRequestState extends State<VerificationRequest> {
  void dropdownCallback(String? selectedValue) {
    setState(() {
      dropdownValue = selectedValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Center(
                  child: Text(
                    'Want to be Verified?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Choose Subject',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              DropdownButton(
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Physics',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    value: 'Physics',
                  ),
                  DropdownMenuItem(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Chemistry',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    value: 'Chemistry',
                  ),
                  DropdownMenuItem(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Biology',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    value: 'Biology',
                  ),
                  DropdownMenuItem(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Math',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    value: 'Math',
                  ),
                ],
                value: dropdownValue,
                onChanged: dropdownCallback,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Tell Us About You',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.multiline,
                    cursorWidth: 2,
                    cursorColor: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  padding: const EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      // color: Colors.amber,
                      child: Center(
                        child: Text(
                          'Add Relevant Certificate Image',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
