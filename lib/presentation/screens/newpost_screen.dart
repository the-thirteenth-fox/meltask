import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meltask/presentation/widgets/button.dart';
import 'package:meltask/presentation/widgets/chip.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  CupertinoAlertDialog dialog(BuildContext context) => CupertinoAlertDialog(
        title: const Text('Submitted'),
        content: const Text('Your post has been sent to moderation.'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: ButtonComponent(
                label: 'Submit',
                onTap: () => showCupertinoDialog(
                    context: context, builder: (context) => dialog(context))),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: Text(
                    'Create New Post',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const TextFieldBloc(hintText: 'Title'),
                const TextFieldBloc(hintText: 'Author'),
                const SizedBox(height: 12),
                const TextFieldBloc(hintText: 'Post', expands: true),
                const SizedBox(height: 12),
                const TextFieldBloc(hintText: 'Image URL'),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Tags",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          ChipComponent(
                            'Technology',
                            color: Color(0xffa5f89b),
                            wide: true,
                            selectable: true,
                          ),
                          SizedBox(width: 20),
                          ChipComponent(
                            'IT',
                            color: Color(0xffffe975),
                            wide: true,
                            selectable: true,
                          ),
                          SizedBox(width: 20),
                          ChipComponent(
                            'Industry',
                            color: Color(0xffadf3ff),
                            wide: true,
                            selectable: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 22),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldBloc extends StatelessWidget {
  const TextFieldBloc({
    Key? key,
    required this.hintText,
    this.expands = false,
  }) : super(key: key);

  final String hintText;
  final bool expands;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: expands ? 171 : 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.maxFinite,
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          TextField(
            maxLines: expands ? 7 : 1,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
              height: expands ? null : 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
