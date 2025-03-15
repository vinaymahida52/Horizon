import 'package:date_time_picker_plus/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';
import 'package:horizon/core/shared/widgets/textfield/common_textfield.dart';
import 'package:horizon/core/shared/widgets/upload/upload_widget.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  int _selectedSegment = 0;
  final Map<int, String> _options = {
    0: "Short Term",
    1: "Mid Term",
    2: "Long Term"
  };

  TextEditingController projectNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: context.w * 0.5,
      child: Column(
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create Project',
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
          CupertinoSegmentedControl<int>(
            children: _options.map((key, value) => MapEntry(
                key,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(value),
                ))),
            onValueChanged: (int newValue) {
              setState(() {
                _selectedSegment = newValue;
              });
            },
            groupValue: _selectedSegment,
          ),
          CommonTextField(
            isLabel: true,
            labelText: "Project Name",
            hintText: "Project Name",
            controller: projectNameController,
          ),
          CommonTextField(
            maxLines: 5,
            minLines: 1,
            controller: descriptionController,
            isLabel: true,
            labelText: "Description",
            hintText: "Description",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Project Attachments",
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          UploadWidget(
            data: 'Upload Files',
          ),
          DateTimePicker(
            type: DateTimePickerType.date,
            use24HourFormat: false,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            dateLabelText: 'Due Date',
            onChanged: (val) => print(val),
            validator: (val) {
              print(val);
              return null;
            },
            onSaved: (val) => print(val),
          ),
          CommonButton.buildElevatedButton(
              onPressed: () {}, text: 'Create Task'),
        ],
      ),
    );
  }
}

// class CupertinoSegmentedExample extends StatefulWidget {
//   @override
//   _CupertinoSegmentedExampleState createState() =>
//       _CupertinoSegmentedExampleState();
// }

// class _CupertinoSegmentedExampleState extends State<CupertinoSegmentedExample> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Cupertino Segmented Control")),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(height: 20),
//           Text(
//             "Selected: ${_options[_selectedSegment]}",
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
// }
