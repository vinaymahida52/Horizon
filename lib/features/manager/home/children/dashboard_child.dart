import 'package:flutter/material.dart';
import 'package:horizon/core/constraints/common_padding.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/extension/num_extension.dart';
import 'package:horizon/features/manager/home/widget/dash_card1.dart';
import 'package:horizon/features/manager/home/widget/dash_card2.dart';

class DashboardChild extends StatefulWidget {
  const DashboardChild({super.key});

  @override
  State<DashboardChild> createState() => _DashboardChildState();
}

class _DashboardChildState extends State<DashboardChild> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppPadding.horizontalSmall,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard',
            style: context.bodyLarge.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            spacing: 20,
            children: [
              DashCard1(
                text1: 'Projects',
                count: 100,
                icon: Icons.people,
                text2: 'View all projects',
              ),
              DashCard1(
                text1: 'Message',
                icon: Icons.chat,
                count: 100,
                text2: 'View all messages',
              ),
              DashCard1(
                count: 100,
                text1: 'Department',
                icon: Icons.account_tree_rounded,
                text2: 'View all department',
              ),
            ],
          ),
          20.hBox,
          Row(
            spacing: 20,
            children: [
              DashCard2(
                onTap: () {},
                text1: 'Active employee',
                icon: Icons.task,
                text2: 'Current workforce status',
                totalCount: 100,
                completedCount: 50,
              ),
              DashCard2(
                onTap: () {},
                text1: 'Task complete',
                icon: Icons.task,
                text2: 'Monthly Project',
                totalCount: 100,
                completedCount: 50,
              ),
              DashCard2(
                onTap: () {},
                text1: 'Project on Track',
                icon: Icons.task,
                text2: 'Delivery Status',
                totalCount: 100,
                completedCount: 50,
              ),
            ],
          ),
          20.hBox,
          SizedBox(
            width: context.w * 0.75,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Placeholder(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      spacing: 20,
                      children: [
                        Expanded(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: AppPadding.small,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Projects',
                                    style: context.bodyMedium.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  10.hBox,
                                  Expanded(
                                    child: ListView.separated(
                                      itemCount: 10,
                                      separatorBuilder: (_, __) =>
                                          const Divider(
                                        thickness: 1,
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                      itemBuilder: (_, index) => Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Project ',
                                              style: context.bodyMedium),
                                          Text('$index %',
                                              style: context.bodyMedium),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Expanded(child: Placeholder()),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
