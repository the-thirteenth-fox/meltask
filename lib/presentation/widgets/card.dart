import 'package:flutter/material.dart';
import 'package:meltask/models/news.dart';
import 'package:intl/intl.dart';

import 'chip.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    Key? key,
    required this.news,
    this.onTap,
  }) : super(key: key);

  final News news;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            ListTile(
              leading: Hero(
                tag: news.urlToImage,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).hintColor,
                    image: DecorationImage(
                        image: NetworkImage(news.urlToImage),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              title: Text(
                news.title,
                maxLines: 2,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                news.author,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const ChipComponent(
                    'Technology',
                    color: Color(0xffa5f89b),
                  ),
                  const SizedBox(width: 10),
                  const ChipComponent(
                    'IT',
                    color: Color(0xffffe975),
                  ),
                  const SizedBox(width: 10),
                  const ChipComponent(
                    'Industry',
                    color: Color(0xffadf3ff),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('yyyy-MM-dd').format(news.publishedAt),
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 12,
                      fontFamily: "Quicksand",
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
