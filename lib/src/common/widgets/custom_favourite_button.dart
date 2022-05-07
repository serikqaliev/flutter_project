import 'package:flutter/cupertino.dart';

class CustomFavouriteButton extends StatefulWidget {
  const CustomFavouriteButton({
    Key? key,
    required this.liked,
    required this.onChanged,
  }) : super(key: key);

  final bool liked;
  final Function onChanged;

  @override
  State<CustomFavouriteButton> createState() => _CustomFavouriteButtonState();
}

class _CustomFavouriteButtonState extends State<CustomFavouriteButton> {
  late bool liked;
  late IconData likeIcon;

  @override
  void initState() {
    liked = widget.liked;
    likeIcon = widget.liked ? CupertinoIcons.heart_fill : CupertinoIcons.heart;
    super.initState();
  }

  void changeLike() {
    setState(() {
      widget.onChanged();
      liked = !liked;
      likeIcon = liked ? CupertinoIcons.heart_fill : CupertinoIcons.heart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoButton(
        onPressed: changeLike,
        child: Icon(
          likeIcon,
          size: 18,
          color: const Color(0xFFEC3A4D),
        ),
      ),
    );
  }
}
