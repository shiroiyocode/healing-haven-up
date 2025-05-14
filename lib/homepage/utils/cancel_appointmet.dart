import 'package:flutter/material.dart';

class CancelReasonDialog extends StatefulWidget {
  final Function(String reason) onSend;

  const CancelReasonDialog({Key? key, required this.onSend}) : super(key: key);

  @override
  State<CancelReasonDialog> createState() => _CancelReasonDialogState();
}

class _CancelReasonDialogState extends State<CancelReasonDialog> {
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[300],
      title: Text("Cancel Appointment"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Please provide a reason for cancellation:"),
          SizedBox(height: 10),
          TextField(
            controller: _reasonController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Type your reason here...",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text("Cancel", style: TextStyle(color: Colors.grey[700])),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text(
            "Send",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            final reason = _reasonController.text.trim();
            if (reason.isNotEmpty) {
              widget.onSend(reason);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
