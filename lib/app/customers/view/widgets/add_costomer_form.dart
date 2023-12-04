import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technaureus/app/customers/view_model/customer_bloc.dart';
import 'package:technaureus/core/utils/app_colors.dart';
import 'package:technaureus/core/utils/size_extenstion.dart';
import 'package:technaureus/core/utils/widgets/app_text_field.dart';

class AddCustomerForm extends StatelessWidget {
  const AddCustomerForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController streetOneController = TextEditingController();
    TextEditingController streetTwoController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController pincodeConroller = TextEditingController();
    TextEditingController contryController = TextEditingController();
    TextEditingController stateController = TextEditingController();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Costomer Name',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            AppTextField(
                validator: (value) {
                  return value == null || value.isEmpty ? 'Required' : null;
                },
                borderRadius: 5,
                hintText: '',
                controller: nameController),
            UnderLinedTextField(
              title: 'Phone Number',
              controller: phoneController,
            ),
            UnderLinedTextField(
              title: 'E mail',
              controller: emailController,
            ),
            10.height,
            const Text(
              'Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                    child: UnderLinedTextField(
                  title: 'Street 1',
                  controller: streetOneController,
                )),
                10.width,
                Expanded(
                    child: UnderLinedTextField(
                  title: 'Street 2',
                  controller: streetTwoController,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: UnderLinedTextField(
                  title: 'City',
                  controller: cityController,
                )),
                10.width,
                Expanded(
                    child: UnderLinedTextField(
                  type: TextInputType.number,
                  title: 'Pincode',
                  controller: pincodeConroller,
                ))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: UnderLinedTextField(
                  title: 'Country',
                  controller: contryController,
                )),
                10.width,
                Expanded(
                    child: UnderLinedTextField(
                  title: 'State',
                  controller: stateController,
                ))
              ],
            ),
            20.height,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    print(pincodeConroller.text);
                    final Map<String, dynamic> person = {
                      "name": nameController.text,
                      "profile_pic": "avathar",
                      "mobile_number": phoneController.text,
                      "email": emailController.text,
                      "street": streetOneController.text,
                      "street_two": streetTwoController.text,
                      "city": cityController.text,
                      "pincode": int.parse(pincodeConroller.text),
                      "country": contryController.text,
                      "state": stateController.text
                    };

                    BlocProvider.of<CustomerBloc>(context)
                        .add(AddCustomer(customer: person));
                  }
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 10)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.appBlue)),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            100.height
          ],
        ),
      ),
    );
  }
}

class UnderLinedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String title;
  const UnderLinedTextField({
    super.key,
    this.controller,
    required this.title,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return value == null || value.isEmpty ? 'Required' : null;
      },
      keyboardType: type,
      decoration: InputDecoration(
        label: Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
