import 'package:carros_flutter/drawer_list.dart';
import 'package:carros_flutter/pages/carros/carros_api.dart';
import 'package:carros_flutter/pages/carros/carros_listview.dart';
import 'package:carros_flutter/pages/carros/carros_page.dart';
import 'package:carros_flutter/utils/prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _initTabs();
  }

  _initTabs() async {
    int index = await Prefs.getInt("tabIdx");
    _tabController = TabController(length: 3, vsync: this);

    setState(() {
      _tabController.index = index;
    });

    _tabController.addListener(() {
      Prefs.setInt("tabIdx", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carros"),
          bottom: _tabController == null
              ? null
              : TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Clássicos"),
                    Tab(text: "Esportivos"),
                    Tab(text: "Luxo"),
                  ],
                ),
        ),
        body: _tabController == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(
                controller: _tabController,
                children: [
                  CarrosPage(TipoCarro.classicos),
                  CarrosPage(TipoCarro.esportivos),
                  CarrosPage(TipoCarro.luxo),
                ],
              ),
        drawer: DrawerList(),
      ),
    );
  }
}
