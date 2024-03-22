import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:do_it/Bloc/Tasks%20Cubit/do_it_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class buildTaskItem extends StatefulWidget {
  Map model;
  bool isChecked;
  BuildContext context;

  buildTaskItem({
    required this.model,
    required this.isChecked,
    required this.context,
  });

  @override
  State<buildTaskItem> createState() => _buildTaskItemState();
}

class _buildTaskItemState extends State<buildTaskItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.model['id'].toString()),
      onDismissed: (direction) {
        DoItCubit.get(context).deleteData(
          id: widget.model['id'],
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    elevation: 0.0,
                    title: const Center(
                      child: Text(
                        'Task Details',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Your Task Name :',
                                maxLines: 1,
                                //overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: Text(
                                '${widget.model['title']}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Your Task Date :',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${widget.model['date']}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Your Task Time :',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              '${widget.model['time']}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Ok',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                    alignment: Alignment.center,
                    actionsAlignment: MainAxisAlignment.center,
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  );
                });
          },
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 1,
            height: MediaQuery
                .of(context)
                .size
                .height / 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.teal,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.teal.shade700,
                  radius: 40.0,
                  child: Text(
                    '${widget.model['time']}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.model['title']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children:
                        [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${widget.model['date']}',
                            style:  TextStyle(
                              color: Colors.white,
                              fontSize: 17.0.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                ConditionalBuilder(
                  condition: widget.model['status'] == 'new',
                  builder: (context) =>
                      Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.teal.shade700,
                            value: widget.isChecked,
                            onChanged: (value) {
                              setState(() {
                                widget.isChecked = value!;
                              });
                              if(widget.isChecked==true) {
                                DoItCubit.get(context).updateDataBase(
                                  status: 'done',
                                  id: widget.model['id'],
                                );
                              }
                            },
                            side: const BorderSide(
                              width: 2.0,
                              color: Colors.white,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                  fallback: (ctx) =>
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 35.0,
                      ),
                ),
                const SizedBox(
                  width: 20.0,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget taskBuilder({
  required List<Map> tasks,
  required List<bool> isDone,
}) =>
    ConditionalBuilder(
      condition: tasks.isNotEmpty,
      builder: (context) =>
          ListView.builder(
            itemBuilder: (context, index) =>
                buildTaskItem(
                  model: tasks[index],
                  isChecked: isDone[index],
                  context: context,
                ),
            itemCount: tasks.length,
          ),
      fallback: (context) =>
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children:
          [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.teal,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'No Tasks Yet, Add Some Tasks',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
          ],
        ),
      ),
    );

