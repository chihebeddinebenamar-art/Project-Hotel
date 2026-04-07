import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../../models/room.dart';
import '../../services/room_catalog.dart';

/// Conversation de démonstration avec carte chambre en tête de fil.
class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Room room = RoomCatalog.byId('3') ?? RoomCatalog.rooms.last;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Chatbot'),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _HotelChatCard(room: room),
                const SizedBox(height: 16),
                _Bubble(
                  alignRight: true,
                  text:
                      'hi for this hotel with a king sweet room are there still any vacancies?',
                  time: '10:15 AM',
                  read: true,
                ),
                const SizedBox(height: 12),
                _Bubble(alignRight: false, text: 'Hi Hadir', time: '10:30 AM'),
                const SizedBox(height: 8),
                _Bubble(
                  alignRight: false,
                  text: 'Yes the room is available, so you can make an order.',
                  time: '10:31 AM',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Write a reply',
                      filled: true,
                      fillColor: AppColors.inputFill,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.chat_bubble_outline, color: Colors.grey.shade600),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Material(
                  color: AppColors.chatBlue,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.send, color: Colors.white, size: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HotelChatCard extends StatelessWidget {
  const _HotelChatCard({required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(room.imagePath, width: 72, height: 72, fit: BoxFit.cover),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          room.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      Text(
                        room.rating.toStringAsFixed(1),
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    room.capacityLabel,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  Text(
                    '${room.pricePerNight} / night',
                    style: const TextStyle(
                      color: AppColors.chatBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  const _Bubble({
    required this.alignRight,
    required this.text,
    required this.time,
    this.read = false,
  });

  final bool alignRight;
  final String text;
  final String time;
  final bool read;

  @override
  Widget build(BuildContext context) {
    final bg = alignRight ? AppColors.chatBlue : AppColors.botBubble;
    final fg = alignRight ? Colors.white : Colors.black87;
    return Align(
      alignment: alignRight ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(14),
                topRight: const Radius.circular(14),
                bottomLeft: Radius.circular(alignRight ? 14 : 4),
                bottomRight: Radius.circular(alignRight ? 4 : 14),
              ),
            ),
            child: Text(text, style: TextStyle(color: fg, height: 1.35)),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(time, style: TextStyle(color: Colors.grey.shade500, fontSize: 11)),
              if (read) ...[
                const SizedBox(width: 4),
                Icon(Icons.done_all, size: 14, color: Colors.grey.shade500),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
