import 'package:aruna_test/feature/aruna_test/controller/homeController.dart';
import 'package:aruna_test/route/route.dart';
import 'package:aruna_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aruna Test"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller.textEditingController,
                      onChanged: controller.onChangeText,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 14.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            ),
                          ),
                          hintText: "Search"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  separatorBuilder: (context, index) => Divider(height: 1),
                  controller: controller.scrollController,
                  itemBuilder: (ctx, index) {
                    // if (controller.isToLoadMore &&
                    //     controller.donors.length - 1 == index)
                    //   return Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    return InkWell(
                      onTap: () {
                        Utils.navigateTo(
                            name: AppRoutes.DETAILPAGE,
                            args: {"data": controller.listPosts[index]});
                      },
                      child: ListTile(
                        title: Text(controller.listPosts[index].title),
                        subtitle: Text(controller.listPosts[index].body),
                      ),
                    );
                  },
                  itemCount: controller.listPosts.length,
                ),
              ),
            ),
          ],
        ));
  }
}
