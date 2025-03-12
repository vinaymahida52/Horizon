import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:date_time_picker_plus/date_time_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';
import 'package:horizon/core/shared/widgets/dropdown/k_dropdown.dart';
import 'package:horizon/core/shared/widgets/textfield/common_textfield.dart';
import 'package:horizon/core/shared/widgets/upload/upload_widget.dart';
import 'package:uuid/uuid.dart';

class KCreateTaskPopup extends StatefulWidget {
  const KCreateTaskPopup({super.key});

  @override
  State<KCreateTaskPopup> createState() => _KCreateTaskPopupState();
}

class _KCreateTaskPopupState extends State<KCreateTaskPopup>
    with TickerProviderStateMixin {
  late TabController tabController1;
  late TabController tabController2;

  final names = [
    "John Smith",
    "Emma Johnson",
    "Michael Brown",
    "Sarah Davis",
    "David Wilson",
    "Lisa Anderson",
    "James Taylor"
  ];

  List<String> selectedEmps = [];

  bool isDepartment = false;

  double _currentSliderValue = 0;

  String? selectedDept = 'Department 1';

  List<String> deptList = [
    'Department 1',
    'Department 2',
    'Department 3',
    'Department 4',
  ];

  void onChangedDept(bool value) {
    setState(() {
      isDepartment = value;
    });
  }

  //regular task
  TextEditingController taskIDController =
      TextEditingController(text: Uuid().v4());
  TextEditingController taskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  //project task

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController1 = TabController(length: 2, vsync: this);
    tabController2 = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController1.dispose();
    taskIDController.dispose();
    taskNameController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: context.w * 0.6,
      child: Column(
        spacing: 20,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create New',
                style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          // TabBar(
          //   indicatorSize: TabBarIndicatorSize.tab,
          //   controller: tabController1,
          //   tabs: [
          //     Tab(
          //       text: 'Regular Task',
          //     ),
          //     Tab(
          //       text: 'Add to Project',
          //     ),
          //   ],
          // ),

          CommonTab(
              tabController1: tabController1,
              tabList: ['Regular Task', 'Add to Project']),
          Expanded(
            child: TabBarView(controller: tabController1, children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Row(
                        spacing: 20,
                        children: [
                          Expanded(
                            child: CommonTextField(
                                isLabel: true,
                                hintText: "Task Id",
                                labelText: "Task Id",
                                controller: taskIDController),
                          ),
                          Expanded(
                            child: CommonTextField(
                              isLabel: true,
                              labelText: "Task Name",
                              hintText: "Task Name",
                              controller: taskNameController,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CommonTextField(
                      maxLines: 5,
                      minLines: 1,
                      controller: descriptionController,
                      isLabel: true,
                      labelText: "Description",
                      hintText: "Description",
                    ),
                    UploadWidget(
                      data: 'Upload Files',
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isDepartment,
                      onChanged: (val) => onChangedDept(val!),
                      title: Text('Assign to Department'),
                    ),
                    if (isDepartment)
                      CommonDropDown(
                        selectedValue: selectedDept,
                        onChanged: (val) {
                          setState(() {
                            selectedDept = val;
                          });
                        },
                        dropdownList: deptList,
                      ),
                    DropdownSearch<String>.multiSelection(
                      popupProps: PopupPropsMultiSelection.menu(
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          decoration: InputDecoration(
                            hintText: "Search days",
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        showSelectedItems: true,
                      ),
                      items: (a, b) => names,
                      onChanged: (values) {
                        // Handle selected days here
                        selectedEmps = values;
                        setState(() {});
                      },
                      selectedItems: selectedEmps,
                      decoratorProps: selectedEmps.isEmpty
                          ? DropDownDecoratorProps(
                              decoration: InputDecoration(
                                labelText: "Assign Employees",
                                hintStyle: context.bodyMedium
                                    .copyWith(fontWeight: FontWeight.w500),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                              ),
                            )
                          : null,
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
                    Text(
                      "Priority",
                      style: context.bodyLarge,
                    ),
                    Slider(
                        divisions: 3,
                        label: _currentSliderValue.round().toString() == '0'
                            ? 'Low'
                            : _currentSliderValue.round().toString() == '1'
                                ? 'Medium'
                                : _currentSliderValue.round().toString() == '2'
                                    ? 'High'
                                    : 'Urgent',
                        min: 0,
                        max: 3,
                        mouseCursor: MouseCursor.defer,
                        thumbColor: _currentSliderValue.round() == 0
                            ? Colors.green
                            : _currentSliderValue.round() == 1
                                ? Colors.yellow
                                : _currentSliderValue.round() == 2
                                    ? Colors.orange
                                    : Colors.red,
                        activeColor: _currentSliderValue.round() == 0
                            ? Colors.green
                            : _currentSliderValue.round() == 1
                                ? Colors.yellow
                                : _currentSliderValue.round() == 2
                                    ? Colors.orange
                                    : Colors.red,
                        value: _currentSliderValue,
                        onChanged: (value) {
                          setState(() {
                            _currentSliderValue = value;
                          });
                        }),
                    CommonButton.buildElevatedButton(
                        onPressed: () {}, text: 'Create Task'),
                  ],
                ),
              ),
              Column(
                children: [],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CommonTab extends StatelessWidget {
  const CommonTab({
    super.key,
    required this.tabController1,
    required this.tabList,
  });
  final List<String> tabList;
  final TabController tabController1;

  @override
  Widget build(BuildContext context) {
    return SegmentedTabControl(
      tabTextColor: ColorPalette.blackColor,
      controller: tabController1,
      tabs: tabList
          .map(
            (e) => SegmentTab(
                backgroundColor: ColorPalette.greyColor.withAlpha(50),
                color: ColorPalette.primaryColor,
                label: e),
          )
          .toList(),
    );
  }
}
