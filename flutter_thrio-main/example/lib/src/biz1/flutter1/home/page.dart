import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:thrio/thrio.dart';
import 'package:thrio_example/src/biz1/flutter3/flutter3_page.dart';
import 'package:thrio_example/src/biz2/flutter2/flutter2_page.dart';

import '../../../models/people.dart';

class Page extends StatefulWidget {
  const Page({
    Key key,
    this.moduleContext,
    this.index,
    this.params,
  }) : super(key: key);

  final int index;

  final ModuleContext moduleContext;

  final dynamic params;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  TextEditingController _inputController;
  @override
  void initState() {
    super.initState();

    if (mounted) {
      _inputController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  // === 0420 修改 start ====
  
  /// 当前选中的 tabItem 索引
  int _currentIndex = 0;

  /// 定义底部的 tabItem 数组
  final List<BottomNavigationBarItem> bottomTabs = [    
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '首页'),    
    BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: '我的'),
  ];

  /// 定义页面数组
  final List<Widget> _pageList = [
    Flutter3Page(),
    Flutter2Page(), 
  ];

  /// tabItem 点击事件
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
 
    return DefaultTabController(
      length: _pageList.length,
      child: Scaffold(        
        body: _pageList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(items: bottomTabs,
          currentIndex: _currentIndex, 
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Colors.white,
          onTap: (value) => onTabTapped(value),        
        ),                 
      ),
    );
  }

  // === 0420 修改 end ====
}
