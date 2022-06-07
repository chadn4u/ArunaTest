import 'package:aruna_test/base/baseController.dart';
import 'package:aruna_test/core/network/rest_client.dart';
import 'package:aruna_test/feature/aruna_test/model/posts.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeController extends BaseController {
  final listPosts = <Posts>[].obs;

  final tempPosts = <Posts>[].obs;

  final ScrollController scrollController = ScrollController();

  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  onChangeText(String text) {
    if (text.isNotEmpty) {
      List<Posts> temp = tempPosts
          .where((p0) => p0.title.toLowerCase().contains(text.toLowerCase()))
          .toList();
      // print("$text");
      listPosts.clear();
      listPosts.addAll(temp);
    } else {
      listPosts.clear();
      listPosts.addAll(tempPosts);
    }
  }

  loadData() async {
    try {
      final result = await restClient.request("", Method.GET, {});

      if (result != null) {
        if (result is Response) {
          var data = PostList.fromJson(result.data);

          listPosts.addAll(data.postList);
          tempPosts.addAll(data.postList);
          //   if (data != null) {
          //     listPosts.addAll(data);
          //     isToLoadMore = true;
          //     change(donors, status: RxStatus.success());
          //   } else {
          //     isToLoadMore = false;
          //   }
          // }
        }
      } else {
        // isToLoadMore = false;
      }
    } on Exception catch (e) {
      // Get.showSnackbar(GetBar(
      //   message: "$e",
      //   duration: Duration(milliseconds: 3000),
      // ));
    }
  }
}
