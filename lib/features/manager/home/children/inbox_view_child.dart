import 'package:flutter/material.dart';
import 'package:flutter_chatflow/chatflow.dart';
import 'package:flutter_chatflow/models.dart';
import 'package:flutter_chatflow/utils/types.dart';
import 'package:horizon/core/config/theme/color_palette.dart';
import 'package:horizon/core/extension/context_ext.dart';
import 'package:horizon/core/extension/num_extension.dart';
import 'package:horizon/core/shared/widgets/textfield/common_textfield.dart';

class InboxViewChild extends StatefulWidget {
  const InboxViewChild({super.key});

  @override
  State<InboxViewChild> createState() => _InboxViewChildState();
}

class _InboxViewChildState extends State<InboxViewChild> {
  final List<String> _dropdownItems = [
    'Admin',
    'Completed',
    'In Progress',
    'Pending',
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w * 0.8,
      child: Row(
        children: [
          ChatRoomList(searchController: _searchController),
          ChatDetails(),
        ],
      ),
    );
  }
}

class ChatRoomList extends StatelessWidget {
  ChatRoomList({super.key, required this.searchController});
  TextEditingController searchController;

  final List<String> _dropdownItems = [
    'Admin',
    'Completed',
    'In Progress',
    'Pending',
  ];

  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: ColorPalette.darkenScaffoldColor,
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inbox",
                style: context.bodyMedium,
              ),
              20.hBox,
              Row(
                children: [
                  DropdownButton(
                    value: _selectedItem,
                    alignment: Alignment.center,
                    items: _dropdownItems
                        .map((e) => DropdownMenuItem(
                              value: e.toLowerCase(),
                              child: Text(
                                e,
                                style: context.bodyMedium,
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value.toString();
                      });
                    },
                    hint: Text('Filter'),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorPalette.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorPalette.dividerColor,
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CommonTextField(
                          prefixWidget: Icon(Icons.search),
                          radius: 20,
                          hintText: "Search",
                          controller: searchController),
                      10.hBox,
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            color: Colors.black,
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.account_box_outlined),
                              title: Text("Chat room"),
                              trailing: Text("Date"),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class ChatDetails extends StatelessWidget {
  ChatDetails({super.key});

  List<Message> _messages = [];
  ChatUser author = ChatUser(userID: '');

  void _addMessage(Message message) {
    /// Handle sending message to server

    ///Sending to local collection below [OPTIONAL if sent to server and listened correctly]

    _messages.insert(0, message);
  }

  void _handleSendPressed(String message, {Message? repliedTo}) {
    int createdAt = DateTime.now().millisecondsSinceEpoch;

    final textMessage = TextMessage(
        author: author,
        createdAt: createdAt,
        text: message,
        status: DeliveryStatus.sending);

    _addMessage(textMessage);
  }

  Future _handleOnAttachmentPressed({Message? repliedTo}) async {
    /// logic for adding image to chat.
    /// You could use a dialog to choose between different media types
    /// And rename the function accordingly
    ///
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Expanded(
        child: ChatFlow(
          messages: _messages,
          chatUser: author,
          onSendPressed: _handleSendPressed,
          onAttachmentPressed: _handleOnAttachmentPressed,
        ),
      );
    });
  }
}
