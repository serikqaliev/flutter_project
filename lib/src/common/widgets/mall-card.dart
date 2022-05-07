// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import '../constants/color_constants.dart';
import '../constants/padding_constants.dart';
import 'custom_favourite_button.dart';

class MallCard extends StatelessWidget {
  const MallCard({
    Key? key,
    required this.title,
    required this.description,
    required this.imgPath,
    required this.address,
    required this.hasLike,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final String description;
  final String imgPath;
  final String address;
  final bool hasLike;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPaddings.horizontal,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: AppPaddings.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          description,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF929292),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          address,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF929292),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomFavouriteButton(
                    liked: hasLike,
                    onChanged: onChanged,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12)
          ],
        ),
      ),
    );
  }
}
