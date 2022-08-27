import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task/viewModels/provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(pagesProvider);
    return Scaffold(
        body: data.when(
      data: (value) {
        return Center(
          child: Column(
            children: [
              
              ...value.map(
                (e) => ListView(shrinkWrap: true, children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: ((context) {
                          return AlertDialog(
                            title: Column(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(e.avatar),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('Name: ${e.firstName}, (ID:${e.id})'),
                              ],
                            ),
                            content: Text('Email: ${e.email}'),
                          );
                        }),
                      );
                    },
                    child: ListTile(
                      title: Text(e.firstName),
                      subtitle: Text(e.lastName),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(e.avatar),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
      error: ((error, stackTrace) => Text(error.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    ));
  }
}
