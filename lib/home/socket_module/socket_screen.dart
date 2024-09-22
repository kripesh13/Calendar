import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/home/socket_module/socket_provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class SocketScreen extends StatefulWidget {
  const SocketScreen({
    super.key,
  });

  @override
  State<SocketScreen> createState() => _SocketScreenState();
}

class _SocketScreenState extends State<SocketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<SocketProvider>(builder: (context, state, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: state.messageController,
                    onChanged: (value) {
                      // state.sendMessage(value);
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      state.sendMessage(state.messageController.text);
                    },
                    icon: const Icon(Icons.send)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: state.channel!.stream,
              builder: (context, snapshot) {
                if (state.messageList == []) {
                  return Text(
                      snapshot.hasData ? "${snapshot.data}" : "No Data found");
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                              snapshot.data ?? "No data found"),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ]),
        );
      }),
      // floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.send),
      //     onPressed: () {
      //       state.sendMessage();
      //     }),
    );
  }
}
