import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/core/shared/widgets/appbar/common_appbar.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';
import 'package:horizon/features/manager/home/widget/popup/create_project_popup.dart';

@RoutePage()
class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        centerTitle: false,
        elevation: 100,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_2_outlined),
          ),
        ],
      ),
      body: Column(
        spacing: 30,
        children: [
          Row(
            children: [
              CommonButton.buildElevatedButton(
                  onPressed: () {
                    CreateProject();
                  },
                  text: 'Create Project'),
            ],
          )
        ],
      ),
    );
  }
}
