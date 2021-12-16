import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meltask/logic/blocs/favoritesnews/favoritesnews.dart';
import 'package:meltask/presentation/widgets/card.dart';

enum FavState { firstInit, empty, full }

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavState favState = FavState.firstInit;
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: BlocBuilder<FavoritesNewsBloc, FavoritesNewsState>(
        builder: (context, state) {
          if (state is FavoritesNewsLoadInProgress) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (state is FavoritesNewsLoadSucces) {
            if (state.news.isEmpty && favState == FavState.firstInit) {
              favState = FavState.empty;
            } else {
              favState = FavState.full;
            }
          }

          return Column(
            children: [
              Row(
                children: [
                  favState != FavState.full
                      ? const SizedBox()
                      : SvgPicture.asset('assets/icons/icon.svg'),
                  SizedBox(width: favState != FavState.full ? 0 : 8),
                  Text(
                    'Favorites',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              favState != FavState.full
                  ? const SizedBox()
                  : CupertinoSearchTextField(
                      onChanged: (value) {
                        context
                            .read<FavoritesNewsBloc>()
                            .add(FavoritesNewsRequsted(value));
                      },
                    ),
              const SizedBox(height: 12),
              favState != FavState.full
                  ? const HintComponent()
                  : Expanded(
                      child: ListView.builder(
                          itemCount:
                              (state as FavoritesNewsLoadSucces).news.length,
                          itemBuilder: (context, index) {
                            return CardComponent(
                              news: state.news[index],
                              onTap: () {
                                Navigator.pushNamed(context, '/detailed',
                                    arguments: state.news[index]);
                              },
                            );
                          }),
                    ),
            ],
          );
        },
      ),
    ));
  }
}

class HintComponent extends StatelessWidget {
  const HintComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset('assets/icons/bill.svg'),
          const SizedBox(height: 20),
          Text(
            "You don’t have any\nfavorites yet.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).hintColor.withOpacity(0.5),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
