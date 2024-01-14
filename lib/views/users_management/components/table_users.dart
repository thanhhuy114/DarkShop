import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/users_management/users_management_presenter.dart';
import 'package:flutter/material.dart';

class TableUsers extends StatefulWidget {
  const TableUsers({super.key, required this.presenter});
  final UsersManagementPresenter presenter;

  @override
  State<TableUsers> createState() => _TableUsersState();
}

class _TableUsersState extends State<TableUsers> {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(Constants.listUser,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            Table(
              border: TableBorder.all(),
              children:  [const
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey),
                  children: [
                    TableCell(
                      child: Center(
                          child: Text(Constants.fullname)),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(Constants.email)),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(Constants.phone)),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(Constants.address)),
                    ),
                    TableCell(
                      child: Center(
                          child: Text(Constants.blocked)),
                    ),
                  ],
                ),
                for (int i = 0; i < widget.presenter.users.length; i++)
                    TableRow(
                      decoration: BoxDecoration(
                        color: widget.presenter.users[i] == widget.presenter.userSeleted ? MyColors.backgoundRowSeleted : null,
                      ),
                      children: [
                        TableCell(
                            child: InkWell(
                          onTap: () {
                            widget.presenter.updateUserSeleted(widget.presenter.users[i]);
                          },
                          child: Center(child: Text(widget.presenter.users[i].fullname)),
                        )),
                        TableCell(
                            child: InkWell(
                          onTap: () {
                            widget.presenter.updateUserSeleted(widget.presenter.users[i]);
                          },
                          child: Center(child: Text(widget.presenter.users[i].email)),
                        )),
                        TableCell(
                            child: InkWell(
                          onTap: () {
                            widget.presenter.updateUserSeleted(widget.presenter.users[i]);
                          },
                          child: Center(child: Text(widget.presenter.users[i].phone)),
                        )),
                        TableCell(
                            child: InkWell(
                          onTap: () {
                            widget.presenter.updateUserSeleted(widget.presenter.users[i]);
                          },
                          child: Center(child: Text(widget.presenter.users[i].recentAddress)),
                        )),
                        TableCell(
                            child: InkWell(
                          onTap: () {
                            widget.presenter.updateUserSeleted(widget.presenter.users[i]);
                          },
                          child: Center(
                              child: Checkbox(
                                  onChanged: (valua) {
                                    Center(child: Text(widget.presenter.users[i].fullname));
                                  },
                                  value: widget.presenter.users[i].blocked),),
                        )),
                      ],
                    ),
              ],
            ),
          ],
        ));
  }
}