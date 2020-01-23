import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// runApp() 啟動整個FlutterApp
void main() => runApp(MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Application(),
    ));

class Application extends StatefulWidget {
  @override
  ApplicationState createState() {
    return new ApplicationState();
  }
}

class ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCAC7D7),
      appBar: AppBar(
        title: Text(
          "FlutterListViewDemo",
          style: new TextStyle(
            color: Color(0xFFF4ED71),
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF04030C),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            CardView(
              title: "絕對無敵",
              content:
                  "絕對無敵，是由日昇動畫所製作的藍光人系列第一部作品，於1991年4月3日至1992年3月25日間，在東京電視台所播映的動畫，播畢後並有發行四部OVA，分別為電視版總集篇《5年3組的回憶》與描述主角群在事情結束之後，昇上六年級的故事的《初戀大作戰!》、《陽昇城機關夢日記》、《大家是地球防衛組》三作。",
              url:
                  "http://i0.hdslb.com/bfs/archive/91e7d999d7ca6e6a8b72eca9033dc67cda28099a.png",
              clickListener: () {
                log("main, ApplicationState, build, CardView, 絕對無敵");
                showToast("Click 絕對無敵");
              },
            ),
            CardView(
              title: "七龍珠",
              content:
                  "七龍珠是日本漫畫家鳥山明的格鬥冒險漫畫，該作品於1984年到1995年間在集英社《週刊少年Jump》週刊上連載。單行本是由集英社發售42冊，2002年至2004年期間發售34冊完全版，2013年開始發售全彩版。後來陸續發售動畫、電影、電子遊戲、CD、設定集等相關作品。",
              url: "https://cdn2.ettoday.net/images/1503/1503614.jpg",
              clickListener: () {
                log("main, ApplicationState, build, CardView, 七龍珠");
                showToast("Click 七龍珠");
              },
            ),
            CardView(
              title: "聖鬥士星矢",
              content:
                  "聖鬥士星矢是日本漫畫家車田正美的代表作，1985年12月起在集英社《週刊少年Jump》上連載，至1990年11月在《V Jump》上發表完結篇。單行本全28卷。1986年推出動畫。",
              url:
                  "https://i1.wp.com/gameplayplay.com/wp-content/uploads/sites/188/2019/05/Saint-Seiya-logo.jpg?fit=1280%2C720&ssl=1",
              clickListener: () {
                log("main, ApplicationState, build, CardView, 聖鬥士星矢");
                showToast("Click 聖鬥士星矢");
              },
            ),
            CardView(
              title: "鬼神童子ZENKI",
              content:
                  "鬼神童子ZENKI是谷菊秀原作、黑岩善宏負責繪製的日本漫畫，起初於集英社《月刊少年Jump》1992年8月號以短篇的方式發表，但與連載版的設定不同。之後從同雜誌的12月號開始連載，至1996年9月增刊號完結，單行本全12冊。",
              url:
                  "https://c.share.photo.xuite.net/yoketsu/1ce9f34/19924882/1166437538_o.jpg",
              clickListener: () {
                log("main, ApplicationState, build, CardView, 鬼神童子ZENKI");
                showToast("Click 鬼神童子ZENKI");
              },
            ),
          ],
          padding: EdgeInsets.only(bottom: 16),
        ),
      ),
    );
  }
}

class CardView extends StatelessWidget {
  final String title;
  final String content;
  final String url;
  final VoidCallback clickListener;

  CardView({this.title, this.content, this.url, this.clickListener});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Card(
        /// 設置圓角
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        color: Color(0xFF383140),
        child: InkWell(
          onTap: () => clickListener(),
          child: Column(
            /// 填滿至父布局
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                /// 設置左上與右上為圓角
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),

                /// 讀取網路資源來顯示圖片
                child: Image.network(url, height: 130, fit: BoxFit.cover),
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 6),
                title: Text(
                  title,
                  style: new TextStyle(
                    color: Color(0xFFF4ED71),
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: new TextStyle(
                    color: Color(0xFFCAC7D7),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Color(0xCC4F4F4F),
      textColor: Color(0xFFFFFFFF),
      fontSize: 16);
}

void log(String text) {
  debugPrint(text);
}
