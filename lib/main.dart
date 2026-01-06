import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController textcontrol = TextEditingController();
  List<String>tasks =[];

  void addTask(){
    if(textcontrol.text.isNotEmpty){
       setState(() {
      tasks.add(textcontrol.text);
      textcontrol.clear();
    });
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Todo App"), centerTitle: true),
        
        body: Padding(padding:EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child:
                  TextField(
                    controller: textcontrol,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Add Task"
                    ),
                  )
                  ),
                  SizedBox(width: 10 ),
                  ElevatedButton(onPressed: addTask, child: Text("Add"))
                ],
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(tasks[index]),
                      trailing: IconButton( icon: Icon(Icons.delete),
                      onPressed: (){
                        setState(() {
                          tasks.removeAt(index);
                        });
                      },),
                    ),
                  );
                }),
              ),
            ],
          ),
        
        ),
        
        ),
    );
  }
}
