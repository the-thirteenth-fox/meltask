import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meltask/logic/blocs/news/news.dart';
import 'package:meltask/presentation/widgets/card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/icon.svg'),
                  const SizedBox(width: 8),
                  Text(
                    'Meltask News',
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              CupertinoSearchTextField(
                onSubmitted: (value) {
                  context.read<NewsBloc>().add(NewsRequsted(value));
                },
              ),
              const SizedBox(height: 12),
              Builder(builder: (context) {
                if (state is NewsLoadSucces) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          return CardComponent(
                            news: state.news[index],
                            onTap: () {
                              Navigator.pushNamed(context, '/detailed',
                                  arguments: state.news[index]);
                            },
                          );
                        }),
                  );
                }
                if (state is NewsLoadInProgress) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (state is NewsLoadFailure) {
                  return Center(
                    child: Text(
                      'Smth going wrong.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).hintColor.withOpacity(0.5),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                }
                return const SizedBox();
              }),
            ],
          );
        },
      ),
    ));
  }
}
