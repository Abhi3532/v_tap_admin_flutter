import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:v_tap_admin_flutter/core/navigator/app_router.gr.dart';
import 'package:v_tap_admin_flutter/core/theme/app_colors.dart';
import 'package:v_tap_admin_flutter/models/user_data_model.dart';
import 'package:data_table_2/data_table_2.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isProcess = false;
  TextEditingController searchController = TextEditingController();
  int selectedIndex = 0;

  List<UserDataModel> userList = [];
  List<UserDataModel> searchUsersList = [];
  late AppLocalizations appLocalizations;
  List<String> params = [
    "Total Users",
    "Total Downloads",
    "Total Revenue",
    "Card Purchased",
    "Total Products"
  ];
  List<String> ans = ["23", "20", "560", "18", "3"];

  @override
  void initState() {
    userList = [
      UserDataModel(
          id: "dfgdfgd",
          name: "test user 1",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "rtetert",
          name: "test user 2",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "nmbcvcv",
          name: "test user 3",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
      UserDataModel(
          id: "ertrrry",
          name: "test user 4",
          phone: "123456790",
          isDisable: false),
    ];
    searchUsersList.addAll(userList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 50,
                child: Text('Logo'),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SizedBox(
                  width: 150,
                  child: SidebarX(
                    controller:
                        SidebarXController(selectedIndex: selectedIndex, extended: true),
                    showToggleButton: false,
                    theme: const SidebarXTheme(
                        selectedIconTheme:
                            IconThemeData(color: ColorConstants.yellow1),
                        selectedTextStyle:
                            TextStyle(color: ColorConstants.yellow1)),
                    items: [
                      SidebarXItem(
                          icon: Icons.dashboard,
                          label: 'Dashboard',
                          onTap: () {
                            selectedIndex = 0;
                            setState(() {});
                          }),
                      SidebarXItem(
                          icon: Icons.supervised_user_circle,
                          label: 'Users',
                          onTap: () {
                            selectedIndex = 1;
                            setState(() {});
                          }),
                    ],
                    footerItems: [
                      SidebarXItem(
                          icon: Icons.logout,
                          label: 'Logout',
                          onTap: () {
                            context.router.replace(const LoginRoute());
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
          Container(
            width: 1,
            color: Colors.black,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  color: ColorConstants.yellow1,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Welcome beck, admin!",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: ColorConstants.white1,
                        ),
                      ),
                      Text("admin@vtap.com")
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 29),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Expanded(
                              child: (selectedIndex == 1)
                                  ? usersListTable()
                                  : dashBoard(),
                            ),
                          ],
                        ),
                      ),
                      if (isProcess)
                        Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(
                            color: ColorConstants.white1,
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget usersListTable() {
    return Container(
        margin: const EdgeInsets.only(bottom: 29),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorConstants.blue1,
                ColorConstants.blue1.withOpacity(0.5)
              ]),
          color: ColorConstants.blue1,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1.5,
            color: ColorConstants.grey2,
          ),
        ),
        child: DataTable2(
            showCheckboxColumn: false,
            dividerThickness: 0,
            bottomMargin: 40,
            columns: [
              DataColumn2(label: tableLabel("Sr. No."), fixedWidth: 100),
              DataColumn2(label: tableLabel("ID"), fixedWidth: 200),
              DataColumn2(label: tableLabel("Name"), fixedWidth: 200),
              DataColumn2(label: tableLabel("Phone"), fixedWidth: 200),
              DataColumn2(
                  label: Center(child: tableLabel("Disable")), fixedWidth: 140),
            ],
            rows: List<DataRow>.generate(
                searchUsersList.length,
                (index) => DataRow2(
                        onTap: () {
                          context.router.push(UserDetailRoute(
                              userId: searchUsersList[index].id));
                        },
                        cells: [
                          DataCell(Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: dataColumn(
                                data: (index + 1).toString(), index: index),
                          )),
                          DataCell(dataColumn(
                              data: searchUsersList[index].id, index: index)),
                          DataCell(nameColumn(index: index)),
                          DataCell(dataColumn(
                              data: searchUsersList[index].phone,
                              index: index)),
                          DataCell(_buildForDeleteSwitch(
                              index, searchUsersList[index])),
                        ]))));
  }

  Widget dashBoard() {
    return Wrap(
      children: List.generate(
          params.length,
          (index) => Container(
                width: 250,
                height: 150,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorConstants.blue1,
                        ColorConstants.blue1.withOpacity(0.5)
                      ]),
                  color: ColorConstants.blue1,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 1.5,
                    color: ColorConstants.yellow1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      params[index],
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(ans[index],
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
              )),
    );
  }

  tableLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: ColorConstants.white1),
    );
  }

  Widget nameColumn({required int index}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 15,
          backgroundColor: ColorConstants.white1,
          // backgroundImage: (searchUsersList[index].image != null)
          //     ? NetworkImage(searchUsersList[index].image!)
          //     : null,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            searchUsersList[index].name,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorConstants.white1),
          ),
        ),
      ],
    );
  }

  Widget dataColumn({required String data, required int index}) {
    return Text(
      data,
      style: const TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorConstants.white1),
    );
  }

  Widget _buildForDeleteSwitch(int index, UserDataModel userDataModel) {
    return FlutterSwitch(
      width: 50,
      height: 25,
      padding: 0,
      toggleSize: 30,
      activeColor: ColorConstants.white1,
      activeToggleColor: ColorConstants.yellow1,
      inactiveColor: ColorConstants.grey2,
      inactiveToggleColor: ColorConstants.white1,
      value: searchUsersList[index].isDisable,
      onToggle: (value) {
        searchUsersList[index].isDisable = !searchUsersList[index].isDisable;
        setState(() {});
      },
    );
  }

  void _searchUsers(String text) {
    searchUsersList = userList.where((userName) {
      final titleLower = userName.name.toLowerCase();
      final searchLower = text.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();
    setState(() {});
  }
}
