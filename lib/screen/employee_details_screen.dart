import 'package:flutter/material.dart';

import 'employee_list_screen.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  // const EmployeeDetailsScreen({super.key});

  final Model? empList;
  EmployeeDetailsScreen({Key? key, @required this.empList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Align(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: const BorderRadius.all(Radius.circular(80))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: (empList!.img!.isNotEmpty)
                      ? Image.network(
                          empList!.img.toString(),
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        )
                      : Image.asset("assets/images/person.png")),
            )),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Text(
                  "Name :",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 100),
                Text(
                  empList!.name!.isNotEmpty
                      ? empList!.name.toString() + empList!.lastName.toString()
                      : "",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Email :",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 100),
                Text(
                  empList!.email!.isNotEmpty ? empList!.email! : "",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Phone :",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 90),
                Text(
                  empList!.contactNum!.isNotEmpty ? empList!.contactNum! : "",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Age   :",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 100),
                Text(
                  empList!.age!.toString().isNotEmpty
                      ? empList!.age!.toString()
                      : "",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Dob   :",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 100),
                Text(
                  empList!.dob!.toString().isNotEmpty
                      ? empList!.dob!.toString()
                      : "",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Salary :",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 100),
                Text(
                  empList!.salary!.toString().isNotEmpty
                      ? empList!.salary!.toString()
                      : "",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Address :",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 80),
                Text(
                  empList!.address!.toString().isNotEmpty
                      ? empList!.address!.toString()
                      : "",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
