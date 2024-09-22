import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/home/home_form.dart';
import 'package:test/home/home_state.dart';
import 'package:test/loading_module/loading_screen.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final state = Provider.of<HomeState>(context, listen: false);
    state.pageCount = 1;
    print(state.pageCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Consumer<HomeState>(
          builder: (context, value, child) {
            print(value.pageCount);
            return value.isLoading == true
                ? const Center(
                    child: LoadingScreen(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: value.scrollController,
                          itemCount: value.productModule.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return HomeForm();
                                  },
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Text(
                                    value.productModule.data?[index].name ??
                                        "na"),
                              ),
                            );
                          },
                        ),
                      ),
                      value.isMoreLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Container(),
                    ],
                  );
          },
        ));
  }
}
