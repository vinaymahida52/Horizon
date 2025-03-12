import 'package:flutter/material.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';
import 'package:horizon/core/shared/widgets/textfield/common_textfield.dart';
import 'package:horizon/core/shared/widgets/upload/upload_widget.dart';

class CreateDepartment extends StatefulWidget {
  const CreateDepartment({super.key});

  @override
  State<CreateDepartment> createState() => _CreateDepartmentState();
}

class _CreateDepartmentState extends State<CreateDepartment> {
  TextEditingController deptName = TextEditingController();
  TextEditingController deptWork = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    deptName.dispose();
    deptWork.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 500),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Create Department',
                    style: context.bodyMedium.copyWith(fontSize: 20)),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                )
              ],
            ),
            CommonTextField(
                labelText: "Department Name",
                isLabel: true,
                hintText: "Department Name",
                controller: deptName),
            CommonTextField(
              hintText: "Work",
              controller: deptWork,
              labelText: "Work",
              isLabel: true,
            ),
            Text(
              "Upload CSV file",
              style: context.bodyLarge,
            ),
            UploadWidget(
              data: "Upload CSV file",
            ),
            CommonButton.buildElevatedButton(onPressed: () {}, text: "Create"),
          ],
        ));
  }
}
