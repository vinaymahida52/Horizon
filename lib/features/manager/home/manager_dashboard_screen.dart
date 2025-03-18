import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/shared/widgets/appbar/common_appbar.dart';
import 'package:horizon/features/manager/home/children/dashboard_child.dart';
import 'package:horizon/features/manager/home/nav_model/nav_mdoel.dart';
import 'package:horizon/features/manager/home/widget/popup/create_department.dart';
import 'package:horizon/features/manager/home/widget/popup/create_employee.dart';
import 'package:horizon/features/manager/home/widget/popup/create_project_popup.dart';
import 'package:horizon/features/manager/home/widget/popup/k_create_task_popup.dart';

@RoutePage()
class ManagerDashboardScreen extends StatefulWidget {
  const ManagerDashboardScreen({super.key});

  @override
  State<ManagerDashboardScreen> createState() => _ManagerDashboardScreenState();
}

int selectedIndex = 0;

List<Widget> childrenItems = [
  DashboardChild(),
  Center(child: Text('Tasks')),
  Center(child: Text('Inbox')),
  Center(child: Text('Leaderboard')),
  Center(child: Text('Calendar')),
];

class _ManagerDashboardScreenState extends State<ManagerDashboardScreen> {
  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.whiteColor,
      appBar: CommonAppbar(
        centerTitle: false,
        elevation: 100,
        isLeading: true,
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
      body: Row(
        children: [
          SizedBox(
            height: context.h,
            width: 270,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          height: 1,
                        ),
                    itemCount: navItems.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final nav = navItems[index];
                      return ListTile(
                        selected: selectedIndex == index,
                        selectedTileColor: ColorPalette.disabledSecondaryColor,
                        selectedColor: ColorPalette.blackColor,
                        onTap: () {
                          changeIndex(index);
                        },
                        title: Text(nav.title),
                        leading: Icon(nav.icon),
                      );
                    }),
              ],
            ),
          ),
          VerticalDivider(
            thickness: 1,
            width: 3,
            color: ColorPalette.dividerColor,
          ),
          IndexedStack(
            index: selectedIndex,
            children: childrenItems,
          )
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        distance: 65,
        initialOpen: true,
        childrenAnimation: ExpandableFabAnimation.rotate,
        type: ExpandableFabType.up,
        pos: ExpandableFabPos.left,
        children: [
          FloatingActionButton.extended(
            backgroundColor: ColorPalette.primaryColor,
            heroTag: 'fab',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(child: CreateEmployee());
                  });
            },
            label: const Text('New Employee'),
          ),
          FloatingActionButton.extended(
            backgroundColor: ColorPalette.primaryColor,
            heroTag: 'fab1',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(child: CreateDepartment());
                  });
            },
            label: const Text('New Department'),
          ),
          FloatingActionButton.extended(
            backgroundColor: ColorPalette.primaryColor,
            heroTag: 'fab2',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(child: KCreateTaskPopup());
                  });
            },
            label: const Text('New Task'),
          ),
          FloatingActionButton.extended(
            backgroundColor: ColorPalette.primaryColor,
            heroTag: 'fab2',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(child: CreateProject());
                  });
            },
            label: const Text('New Project'),
          ),
        ],
      ),
    );
  }

  NavigationRailDestination naviItem(String title, IconData icon) {
    return NavigationRailDestination(
      padding: const EdgeInsets.only(bottom: 8),
      selectedIcon: Icon(icon, color: Colors.white),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      icon: Icon(icon),
      label: Text(title),
    );
  }
}
