import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/core/config/router/app_router.gr.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/interop/js_interop_service.dart';
import 'package:horizon/core/shared/constraints/common_padding.dart';
import 'package:horizon/core/shared/widgets/appbar/common_appbar.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';

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
      // appBar: AppBar(
      //   title: Text('Project List'),
      // ),
      body: Padding(
        padding: CommonPadding.kCommonPadding,
        child: Column(
          spacing: 30,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: context.w * 0.5,
                  child: CommonButton.buildElevatedButton(
                      onPressed: () {
                        final interopService = JsInteropService();
                        interopService.showAlert('Hello world');
                      },
                      text: 'Create Project'),
                ),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: 'All',
                      child: Text('All'),
                    ),
                    DropdownMenuItem(
                      value: 'Completed',
                      child: Text('Completed'),
                    ),
                    DropdownMenuItem(
                      value: 'In Progress',
                      child: Text('In Progress'),
                    ),
                    DropdownMenuItem(
                      value: 'Pending',
                      child: Text('Pending'),
                    ),
                  ],
                  onChanged: (value) {},
                  hint: Text('Filter'),
                ),
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 9,

                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //   crossAxisCount: 3,
                //   crossAxisSpacing: 10,
                //   mainAxisSpacing: 5,
                //   childAspectRatio: 0.9,
                // ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: context.w * 0.05,
                  mainAxisSpacing: 30,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.router.push(ProjectDetailRoute(projectId: ""));
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Project $index'),
                          Text('DD/MM/YYYY'),
                          Text('Team name'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
