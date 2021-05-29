import 'package:flutter/material.dart';
import 'package:olx_clone/components/custom_drawer/page_tile.dart';

class PageSection extends StatelessWidget {
  // const PageSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            print('Anúncios');
          },
          highlighted: true // highlighted indica se o item está selecionado
        ),
        PageTile(
            label: 'Inserir Anúncio',
            iconData: Icons.edit_outlined,
            onTap: () {
              print('Inserir Anúncio');
            },
            highlighted: false // highlighted indica se o item está selecionado
        ),
        PageTile(
            label: 'Chat',
            iconData: Icons.message_outlined,
            onTap: () {
              print('Chat');
            },
            highlighted: false // highlighted indica se o item está selecionado
        ),
        PageTile(
            label: 'Favoritos',
            iconData: Icons.favorite_border_outlined,
            onTap: () {
              print('Favoritos');
            },
            highlighted: false // highlighted indica se o item está selecionado
        ),
        PageTile(
            label: 'Minha Conta',
            iconData: Icons.person_outline,
            onTap: () {
              print('Minha Conta');
            },
            highlighted: false // highlighted indica se o item está selecionado
        )
      ],
    );
  }
}
