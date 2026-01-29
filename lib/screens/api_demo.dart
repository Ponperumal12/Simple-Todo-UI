import 'package:flutter/material.dart';
import 'package:todo_ui/servives/api_ser.dart';

import '../models/post_model.dart';
import '../widgets/post_card.dart';

class ApiDemoWithModel extends StatefulWidget {
  @override
  _ApiDemoWithModelState createState() => _ApiDemoWithModelState();
}

class _ApiDemoWithModelState extends State<ApiDemoWithModel> {
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      posts = await ApiService().fetchPosts();
    } catch (e) {
      print("Error: $e");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts from API")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(post: posts[index]);
              },
            ),
    );
  }
}