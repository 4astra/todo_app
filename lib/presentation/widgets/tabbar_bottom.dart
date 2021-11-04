///
/// Created by brian.ha289 on 2/Nov/2021
///
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/models/models.dart';
import 'package:todo_app/presentation/blocs/blocs.dart';
import 'package:todo_app/presentation/pages/pages.dart';

class TabBarBottom extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const TabBarBottom());
  }

  const TabBarBottom({Key? key}) : super(key: key);

  @override
  State<TabBarBottom> createState() => _TabBarBottomState();
}

class _TabBarBottomState extends State<TabBarBottom> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const TodoHomePage(
      visibilityFilter: VisibilityFilter.all,
    ),
    const TodoHomePage(
      visibilityFilter: VisibilityFilter.active,
    ),
    const TodoHomePage(
      visibilityFilter: VisibilityFilter.completed,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoFormBloc, TodoFormState>(
        listener: (BuildContext context, TodoFormState todoFromState) {
          if (todoFromState is TodoFormAddSuccessState || todoFromState is TodoFormUpdateSuccessState) {
            context.read<TodoBloc>().add(GetTodoListEvent());
          }
        },
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'All',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.checklist),
                label: 'Incomplete',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check),
                label: 'Completed',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: const Color.fromRGBO(92, 172, 15, 1.0),
            unselectedItemColor: const Color.fromRGBO(135, 135, 135, 1.0),
            selectedLabelStyle: const TextStyle(fontSize: 13),
            onTap: _onItemTapped,
          ),
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add_circle),
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddEditScreen(isEditing: false);
                    },
                  ),
                );
                context.read<TodoBloc>().add(GetTodoListEvent());
              }),
        ));
  }
}
