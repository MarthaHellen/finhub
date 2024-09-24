import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  bool _isBoxVisible = false; // State for visibility of additional options box

  void _toggleBoxVisibility() {
    setState(() {
      _isBoxVisible = !_isBoxVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (_isBoxVisible) {
                setState(() {
                  _isBoxVisible = false;
                });
              }
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
                  height: 133,
                  color: const Color(0xff2B5BBA),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.chevron_left),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                          width:
                              10), // Add some space between the back button and the title
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset('images/face.png'),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Josephine',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Text(
                            'online',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffE0E0E0),
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const Spacer(), // Use Spacer to push the actions to the right side
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: _toggleBoxVisibility,
                          child: const Icon(
                            Icons.more_vert,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: _messages.length,
                    reverse:
                        true, // To display the latest message at the bottom
                    itemBuilder: (context, index) {
                      //_buildMessageBubble(_messages[index]);
                      return MessageBubble(message: _messages[index]);
                    },
                  ),
                ),
                // Message Input Box
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.emoji_emotions,
                                  color: Color(0xff2B5BBA),
                                ),
                                onPressed: () {
                                  // Add emoji functionality
                                },
                              ),
                              const Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Type a message...',
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Questrial',
                                      color: Color(0xFFA0A0A0),
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.attach_file,
                                  color: Color(0xff2B5BBA),
                                ),
                                onPressed: () {
                                  // Add attachment functionality
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Color(0xff2B5BBA),
                                ),
                                onPressed: () {
                                  // Add camera functionality
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // Implement send message functionality
                        },
                        child: const CircleAvatar(
                          backgroundColor: Color(0xff2B5BBA),
                          radius: 24,
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Additional Options Box
          Visibility(
            visible: _isBoxVisible,
            child: Positioned(
              top: 90, // Adjust the position as needed
              right: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _buildMenuItem("Clear chat", () {
                      // Implement clear chat functionality
                    }),
                    _buildMenuItem("Block User", () {
                      // Implement block user functionality
                    }),
                    _buildMenuItem("View Profile", () {
                      Navigator.of(context).pushNamed('/chats_profile');
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: 'Questrial',
            color: Color(0xff828282),
          ),
        ),
      ),
    );
  }
}

enum MessageType { Receiver, Sender }

class MessageBubble extends StatelessWidget {
  final Message message;

  MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.type == MessageType.Receiver
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildMessageBubble(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: message.type == MessageType.Receiver
            ? const Color(0xFFF1F5FB)
            : const Color(0xff2B5BBA),
        borderRadius: message.type == MessageType.Receiver
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
      ),
      child: Column(
        crossAxisAlignment: message.type == MessageType.Receiver
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            message.text,
            style: TextStyle(
              color: message.type == MessageType.Receiver
                  ? const Color(0xFF433D3D)
                  : Colors.white,
              fontFamily: 'Questrial',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          Text(
            message.timestamp,
            style: TextStyle(
              color: message.type == MessageType.Receiver
                  ? const Color(0xFF433D3D)
                  : Colors.white,
              fontSize: 12,
              fontFamily: 'Questrial',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final MessageType type;
  final String timestamp;

  Message({
    required this.text,
    required this.type,
    required this.timestamp,
  });
}

List<Message> _messages = [
  Message(text: "Hey there!", type: MessageType.Sender, timestamp: "10:35 AM"),
  Message(
      text: "Hello! How are you?",
      type: MessageType.Receiver,
      timestamp: "10:35 AM"),
  Message(
      text: "I'm doing great, thanks!",
      type: MessageType.Sender,
      timestamp: "10:35 AM"),
  Message(
      text: "That's awesome!",
      type: MessageType.Receiver,
      timestamp: "10:35 AM"),
  Message(text: "Yeah! 😄", type: MessageType.Receiver, timestamp: "10:35 AM"),
  Message(
      text: "Bye for now!", type: MessageType.Receiver, timestamp: "10:35 AM"),
];
