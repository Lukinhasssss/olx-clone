import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/components/custom_drawer/page_tile.dart';
import 'package:olx_clone/stores/page_store.dart';

class PageSection extends StatelessWidget {
  // const PageSection({Key key}) : super(key: key);

  final PageStore? pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            pageStore!.setPage(0);
          },
          highlighted: pageStore!.page == 0 && true // highlighted indica se o item está selecionado
        ),
        PageTile(
            label: 'Inserir Anúncio',
            iconData: Icons.edit_outlined,
            onTap: () {
              pageStore!.setPage(1);
            },
            highlighted: pageStore!.page == 1 && true
        ),
        PageTile(
            label: 'Chat',
            iconData: Icons.message_outlined,
            onTap: () {
              pageStore!.setPage(2);
            },
            highlighted: pageStore!.page == 2 && true
        ),
        PageTile(
            label: 'Favoritos',
            iconData: Icons.favorite_border_outlined,
            onTap: () {
              pageStore!.setPage(3);
            },
            highlighted: pageStore!.page == 3 && true
        ),
        PageTile(
            label: 'Minha Conta',
            iconData: Icons.person_outline,
            onTap: () {
              pageStore!.setPage(4);
            },
            highlighted: pageStore!.page == 4 && true
        )
      ],
    );
  }
}
