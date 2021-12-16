import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:meltask/logic/blocs/favoritesnews/favoritesnews.dart';
import 'package:meltask/models/news.dart';
import 'package:meltask/presentation/widgets/chip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)?.settings.arguments as News?;
    return Scaffold(
      appBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.zero,
        border: const Border.fromBorderSide(BorderSide.none),
        backgroundColor: Theme.of(context).canvasColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                size: 24,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                'Back',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 17,
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: news != null
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Hero(
                        tag: news.urlToImage,
                        child: Image.network(news.urlToImage)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            news.title,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).disabledColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                news.author,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Spacer(),
                              BlocBuilder<FavoritesNewsBloc,
                                  FavoritesNewsState>(
                                builder: (context, state) {
                                  bool isAcive = false;
                                  if (state is FavoritesNewsLoadSucces) {
                                    isAcive = state.news
                                        .where((element) =>
                                            element.url == news.url)
                                        .toList()
                                        .isNotEmpty;
                                  }
                                  return GestureDetector(
                                    onTap: () {
                                      isAcive
                                          ? context
                                              .read<FavoritesNewsBloc>()
                                              .add(FavoritesNewsDeleted(news))
                                          : context
                                              .read<FavoritesNewsBloc>()
                                              .add(FavoritesNewsAdded(news));
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/fav_star.svg',
                                      color: isAcive
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).hintColor,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Text(
                            news.description,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              ChipComponent(
                                'Technology',
                                color: Color(0xffa5f89b),
                              ),
                              SizedBox(width: 10),
                              ChipComponent(
                                'IT',
                                color: Color(0xffffe975),
                              ),
                              SizedBox(width: 10),
                              ChipComponent(
                                'Industry',
                                color: Color(0xffadf3ff),
                              ),
                              SizedBox(width: 24),
                            ],
                          ),
                          const SizedBox(height: 24),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                  fontSize: 12,
                                ),
                                children: [
                                  const TextSpan(
                                      text: 'Date: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      )),
                                  TextSpan(
                                    text: DateFormat('yyyy-MM-dd')
                                        .format(news.publishedAt),
                                  ),
                                ]),
                          ),
                          Text(
                            'Time: ${DateFormat('HH:mm:ss').format(news.publishedAt)}',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
