import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/view_model/character_list_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/remote/response/status.dart';

final charactersProvider = ChangeNotifierProvider<CharacterListVM>((ref) {
  CharacterListVM characterListVM = CharacterListVM();
  return characterListVM;
});

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(charactersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("MCU")),
      body: value.characters.status == Status.loading
          ? const Center(child: CircularProgressIndicator())
          : value.characters.status == Status.error
              ? Center(child: Text(value.characters.message!))
              : ListView.builder(
                  itemCount: value.characters.data!.results!.length,
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Text(value.characters.data!.results![index].name
                          .toString()),
                      subtitle: Text(
                          value.characters.data!.results![index].id.toString()),
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              debugPrint(
                                  "${value.characters.data!.results![index].thumbnail!.path!}.${value.characters.data!.results![index].thumbnail!.extension!}");
                            },
                            child: const Icon(Icons.add)),
                        Image.network(
                            "${value.characters.data!.results![index].thumbnail!.path!}.${value.characters.data!.results![index].thumbnail!.extension!}"),
                      ],
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            value.loadCharacters();
          },
          child: const Icon(Icons.refresh)),
    );
  }
}
