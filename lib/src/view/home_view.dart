import 'package:flutter/material.dart';
import 'package:marvel_universe_app/src/data/remote/response/api_response.dart';
import 'package:marvel_universe_app/src/view_model/character_list_vm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marvel_universe_app/src/view_model/comic_vm.dart';
import '../data/remote/response/status.dart';
import '../widgets/oval_card.dart';
import '../widgets/rounded_card_widget.dart';

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
                  comicProv.comics.status == Status.loading
                      ? const SliverToBoxAdapter(
                          child: Center(
                            child: GFShimmer(
                              child: Text("loading..."),
                            ),
                          ),
                        )
                      : comicProv.comics.status == Status.error
                          ? SliverToBoxAdapter(
                              child: Center(
                                child: Text(comicProv.comics.message!),
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildListDelegate(
                                [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    child: const Text(
                                      "Popular Characters",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.grey[900],
                                    height: 150,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: charProv
                                          .characters.data!.results!.length,
                                      itemBuilder: (context, index) => SizedBox(
                                        // width: 100,
                                        // height: 100,
                                        child: OvalCardWidget(
                                          title: charProv.characters.data!
                                              .results![index].name!,
                                          imageUrl:
                                              '${charProv.characters.data!.results![index].thumbnail!.path!}.${charProv.characters.data!.results![index].thumbnail!.extension!}',
                                          price: 0.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: const Text(
                                      "Popular Comics",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 0.7,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10),
                                    itemCount:
                                        comicProv.comics.data!.results!.length,
                                    itemBuilder: (context, index) {
                                      return RoundedCardWidget(
                                          imageUrl:
                                              "${comicProv.comics.data!.results![index].thumbnail!.path!}.${comicProv.comics.data!.results![index].thumbnail!.extension!}",
                                          title: comicProv.comics.data!
                                              .results![index].title!,
                                          price: comicProv
                                              .comics
                                              .data!
                                              .results![index]
                                              .prices![0]
                                              .price!);
                                    },
                                  ),
                                ],
                              ),
                            ),
                ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            charProv.setLoading();
            await charProv.loadCharacters();
            await comicProv.fetchComics(limit: 50, offset: 10);
            // await comicProv.fetchComicById(25857);
            // debugPrint("${comicProv.comics.data!.results!.length}");
          },
          child: const Icon(Icons.refresh)),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Comics"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "Characters"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Settings"),
      ]),
    );
  }
}
