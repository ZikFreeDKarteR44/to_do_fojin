import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_fojin/bloc/tasks_cubit/tasks_cubit.dart';
import 'package:to_do_fojin/consts/colors.dart';
import 'package:to_do_fojin/consts/strings.dart';
import 'package:to_do_fojin/consts/styles.dart';
import 'package:to_do_fojin/screens/create_task_screen.dart';
import 'package:to_do_fojin/widgets/task_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MainColors.kWhiteColor1,
          appBar: AppBar(
            elevation: 2,
            backgroundColor: MainColors.kWhiteColor1,
            title: Text(
              Strings.allTasks,
              style: MainStyles.kBlackColor1W700(26.0),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateTaskScreen()));
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 40.0,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: BlocProvider.of<TasksCubit>(context).tasksList.isNotEmpty
                ? ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
              itemCount: BlocProvider.of<TasksCubit>(context).tasksList.length,
              itemBuilder: (context, index) {
                List<String> tasksList = BlocProvider.of<TasksCubit>(context).tasksList;
                return TaskItemWidget(
                  text: tasksList[index],
                );
              },
            )
                : Center(
              child: Text(
                Strings.noTasks,
                style: MainStyles.kGreyColor1W700(40.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
