import 'package:flutter/material.dart';
import 'package:practica2/model/task.dart';


final lista = List.generate(20, (index) => 
  Task('Tarea numero $index', 'Descripción de la tarea número $index')
);
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListScreen(tasks: lista),
    );
  }
}

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key, required this.tasks});
  
  final List<Task> tasks;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de tareas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(tasks: tasks[index])));
            },
          );
        },
      ),

    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen ({super.key, required this.tasks});

  final Task tasks;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(tasks.title),
      ),
      body: Center(
        child: Text(tasks.description)),
    );
  }
}
