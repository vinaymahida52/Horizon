import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/shared/constraints/common_padding.dart';
import 'package:horizon/core/shared/widgets/appbar/common_appbar.dart';
import 'package:horizon/core/shared/widgets/button/common_button.dart';
import 'package:mind_map/mind_map.dart';
import 'package:single_child_two_dimensional_scroll_view/single_child_two_dimensional_scroll_view.dart';

@RoutePage()
class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key, required this.projectId});
  final String projectId;

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  final double mindMapWidth = 2000; // Total width of your mind map
  final double mindMapHeight = 1500; // Total height of your mind map

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        isLeading: true,
        centerTitle: false,
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: CommonPadding.kCommonPadding,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Project Detail",
                    style: context.bodyLarge.copyWith(),
                  ),
                  Container(
                    height: context.h * 0.2,
                    padding: CommonPadding.kCommonPadding,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(50),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Project Name"),
                            Text(
                              "Castle",
                              style: context.bodyMedium
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                        ),
                        Column(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Deadline"),
                            Text("12/12/2021",
                                style: context.bodyMedium
                                    .copyWith(fontWeight: FontWeight.bold))
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                        ),
                        Column(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Short Term"),
                            Text("12 Days",
                                style: context.bodyMedium
                                    .copyWith(fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: double.infinity, child: Divider()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 250,
                        height: 40,
                        child: CommonButton.buildElevatedButton(
                            onPressed: () {}, text: 'Create Task'),
                      ),
                      DropdownButton(
                        alignment: Alignment.center,
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
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                        crossAxisSpacing: context.w * 0.02,
                        mainAxisSpacing: 30,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: Column(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Task $index',
                                style: context.bodySmall,
                              ),
                              Text(
                                'DD/MM/YYYY',
                                style: context.bodySmall,
                              ),
                              Text(
                                'Team name',
                                style: context.bodySmall,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          VerticalDivider(
            thickness: 1,
            width: 3,
            color: Colors.grey,
          ),
          Expanded(
            child: SingleChildTwoDimensionalScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10)
                          .copyWith(right: 0),
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text('Parent MindMap'),
                    ),
                    MindMap(
                      padding: const EdgeInsets.only(left: 50),
                      dotRadius: 4,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10)
                                  .copyWith(right: 0),
                              child: const Text('Component 1'),
                            ),
                            MindMap(
                              dotRadius: 4,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: const Text('Component 2'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: const Text('Component 3'),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      margin: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10)
                                          .copyWith(right: 0),
                                      child: const Text('Component 4'),
                                    ),
                                    MindMap(dotRadius: 4, children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: const Text('Component 5'),
                                      ),
                                    ]),
                                    MindMap(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: const Text('Component 6'),
                                      ),
                                    ]),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            debugPrint('12313');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: const Text('Component 2'),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: const Text('Component 5'),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: const Text('Component 5'),
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10)
                                  .copyWith(right: 0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: const Text('Component 5121212121'),
                            ),
                            MindMap(
                              dotRadius: 4,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: const Text('Component 5121212121'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: const Text('Component 5121212121'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: const Text('Component 5121212121'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: const Text('Component 5121212121'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: const Text('Component 5121212121'),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
