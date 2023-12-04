import 'package:flutter/material.dart';
import 'package:technaureus/app/home_page/view/widgets/home_box.dart';
import 'package:technaureus/app/main_page/model/home_model.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 80,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.corporatephotographerslondon.com/wp-content/uploads/2021/07/LinkedIn_profile_photo_sample_1-300x300.jpg'),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.menu,
              size: 35,
              color: AppColors.appBlue,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.3, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: HomeBox(
                    icon: homeItems[index].icon,
                    title: homeItems[index].label,
                    onTap: homeItems[index].onTap),
              );
            }),
      ),
    );
  }
}
