// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:lesson_1/src/common/constants/color_constants.dart';
import '../../common/widgets/mall-card.dart';
import '../../services/mall-service.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final mallItems =
      MallService.mallData.where((element) => element.hasLike).toList();
  List<Mall?> items = <Mall?>[].toList();

  @override
  void initState() {
    mallItems.isNotEmpty ? items.addAll(mallItems) : null;
    super.initState();
  }

  void filterSearchResults(String query) {
    List<Mall> searchList = <Mall>[];
    searchList.addAll(MallService.mallData);
    if (query.isNotEmpty) {
      List<Mall> requestList = <Mall>[];
      String lowerCaseQuery = query.toLowerCase();
      for (var element in searchList) {
        if (element.address.toLowerCase().contains(lowerCaseQuery) ||
            element.description.toLowerCase().contains(lowerCaseQuery) ||
            element.title.toLowerCase().contains(lowerCaseQuery)) {
          requestList.add(element);
        }
      }
      setState(() {
        items.clear();
        items.addAll(requestList);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(MallService.mallData);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColors.scaffoldBackground,
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: CupertinoSearchTextField(
            placeholder: 'Поиск',
            onChanged: ((value) {
              filterSearchResults(value);
            }),
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFE0E6ED),
              ),
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: items.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return MallCard(
                            title: items[index]!.title,
                            description: items[index]!.description,
                            imgPath: items[index]!.imgPath,
                            address: items[index]!.address,
                            hasLike: items[index]!.hasLike,
                            onChanged: items[index]!.setHasLike,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 20),
                        itemCount: items.length,
                      )
                    : Center(
                        child: Text('Пусто'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
