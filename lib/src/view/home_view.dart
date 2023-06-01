import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/view_model/character_list_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marvel_universe_app/src/view_model/comic_vm.dart';
import '../data/remote/response/status.dart';

final charactersProvider = ChangeNotifierProvider<CharacterListVM>((ref) {
  CharacterListVM characterListVM = CharacterListVM();
  return characterListVM;
});

final comicProvider = Provider<ComicVM>((ref) {
  return ComicVM();
});

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charProv = ref.watch(charactersProvider);
    final comicProv = ref.watch(comicProvider);
    return Scaffold(
      body: charProv.characters.status == Status.loading
          ? const Center(
              child: GFShimmer(
              child: Text("loading..."),
            ))
          : charProv.characters.status == Status.error
              ? Center(child: Text(charProv.characters.message!))
              : CustomScrollView(slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.blueGrey[900],
                    centerTitle: true,
                    pinned: true,
                    expandedHeight: 200,
                    flexibleSpace: Container(
                      color: Colors.black,
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: FlexibleSpaceBar(
                          centerTitle: true,
                          background: Image.asset(
                            'assets/images/bkg1.jpg',
                            fit: BoxFit.cover,
                          ),
                          title: Container(
                            margin: const EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            width: 100,
                            height: 150,
                            child: Image.asset(
                              'assets/images/Marvel_Logo_1.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          // color: Colors.grey[900],
                          height: 150,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                charProv.characters.data!.results!.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GFAvatar(
                                radius: 50,
                                backgroundColor: Colors.blueGrey[900],
                                backgroundImage: NetworkImage(
                                  '${charProv.characters.data!.results![index].thumbnail!.path!}.${charProv.characters.data!.results![index].thumbnail!.extension!}',
                                ),
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: charProv.characters.data!.results!.length,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 16 / 9,
                              child: RoundedCardWidget(
                                  imageUrl:
                                      "${charProv.characters.data!.results![index].thumbnail!.path!}.${charProv.characters.data!.results![index].thumbnail!.extension!}",
                                  title: charProv
                                      .characters.data!.results![index].name!),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // charProv.loadCharacters();
            await comicProv.fetchComics(limit: 59, offset: 0);
            // debugPrint("${comicProv.comics.data!.results!.length}");
          },
          child: const Icon(Icons.refresh)),
    );
  }
}

class RoundedCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;

  const RoundedCardWidget(
      {super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              // height: double.infinity,
              width: double.infinity,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
