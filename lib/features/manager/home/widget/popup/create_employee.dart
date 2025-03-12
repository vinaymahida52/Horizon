import 'package:date_time_picker_plus/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';
import 'package:horizon/core/shared/widgets/dropdown/k_dropdown.dart';
import 'package:horizon/core/shared/widgets/textfield/common_textfield.dart';
import 'package:horizon/core/shared/widgets/upload/upload_widget.dart';
import 'package:horizon/features/manager/home/widget/popup/k_create_task_popup.dart';

class CreateEmployee extends StatefulWidget {
  const CreateEmployee({super.key});

  @override
  State<CreateEmployee> createState() => _CreateEmployeeState();
}

class _CreateEmployeeState extends State<CreateEmployee>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  late TabController tabController1;

  // Text controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _userName = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _dateController = TextEditingController();
  final _designationController = TextEditingController();

  String? selectedDept = 'Department 1';

  List<String> deptList = [
    'Department 1',
    'Department 2',
    'Department 3',
    'Department 4',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _userName.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _dateController.dispose();
    _designationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 400,
        minHeight: 500,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create Employee',
                style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
          CommonTab(
              tabController1: tabController1, tabList: ['Manually', 'CSV']),
          Expanded(
            // height: 700,
            child: TabBarView(controller: tabController1, children: [
              SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    CommonTextField(
                        labelText: "Name",
                        isLabel: true,
                        hintText: "Name",
                        controller: _nameController),
                    CommonTextField(
                      hintText: "Id",
                      controller: _emailController,
                      labelText: "Id",
                      isLabel: true,
                    ),
                    CommonTextField(
                      hintText: "UserName",
                      controller: _userName,
                      labelText: "Phone",
                      isLabel: true,
                    ),
                    CommonTextField(
                      hintText: "Password",
                      controller: _password,
                      labelText: "Password",
                      isLabel: true,
                    ),
                    CommonTextField(
                      hintText: "Conform Password",
                      controller: _confirmPassword,
                      labelText: "Conform Password",
                      isLabel: true,
                    ),
                    DateTimePicker(
                      controller: _dateController,
                      type: DateTimePickerType.date,
                      use24HourFormat: false,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      dateLabelText: 'Due Date',
                      onChanged: (val) => debugPrint(val),
                      validator: (val) {
                        debugPrint(val);
                        return null;
                      },
                      onSaved: (val) => debugPrint(val),
                    ),
                    CommonDropDown(
                      selectedValue: selectedDept,
                      onChanged: (val) {
                        setState(() {
                          selectedDept = val;
                        });
                      },
                      dropdownList: deptList,
                    ),
                    CommonTextField(
                      hintText: "Designation",
                      controller: _designationController,
                      labelText: "Conform Password",
                      isLabel: true,
                    ),
                    CommonButton.buildElevatedButton(
                        onPressed: () {}, text: "Create"),
                  ],
                ),
              ),
              Column(
                spacing: 20,
                children: [
                  UploadWidget(
                    data: "Upload CSV file",
                  ),
                  CommonButton.buildElevatedButton(
                      onPressed: () {}, text: "Create"),
                ],
              )
            ]),
          ),
        ],
      ),
    );
  }
}
