import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/Providers/connection_provider.dart';
import 'package:provider/provider.dart';

import 'browsers.dart';

class HomePage extends StatefulWidget {
  final String url;

  HomePage({super.key, required this.url});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? _appWebViewController;
  PullToRefreshController? pullToRefreshController;
  TextEditingController search = TextEditingController();
  double progress = 0;

  @override
  void initState() {
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        _appWebViewController?.reload();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 10,
          backgroundColor: Colors.white,
          elevation: 2,
          centerTitle: true,
          title: Text(
            'Victory Browse',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 35,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: search,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: 'Manual Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      suffix: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  browsers(url: '"https://www.google.com/",'),
                            ),
                          );
                        },
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  // child:
                  child: TextFormField(
                    controller: search,
                    autofillHints: ['browse in Google'],
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          _appWebViewController?.goBack();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          searchOnWebView();
                        },
                        icon: Icon(Icons.send),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      searchOnWebView();
                    },
                  ),
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Icon(Icons.apple, size: 45),
                  title: Text('Apple '),
                  subtitle: Text('Buy Products From Apple Store'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return browsers(
                            url: "https://www.apple.com/in/",
                          );
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Container(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'images/yahho.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text('yahoo'),
                  subtitle: Text('Tap to Browse With Yahoo '),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return browsers(
                            url: "https://in.search.yahoo.com/?",
                          );
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Image.asset(
                      'images/operra.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text('opera'),
                  subtitle: Text('Tap to Browse In opera'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return browsers(
                            url: "https://www.opera.com/",
                          );
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      'images/mc.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text('Microsoft Edge'),
                  subtitle: Text('Tap to Browse in Microsoft '),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return browsers(
                            url: "https://www.microsoft.com/",
                          );
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  tileColor: Colors.white,
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      'images/firef.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text('Firefox Browser'),
                  subtitle: Text('Browse With Firefox'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return browsers(
                            url: "https://www.mozilla.org/",
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      width: 130,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurpleAccent.shade100,
                            Colors.lightBlue.shade100,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Book Marks'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void searchOnWebView() {
    String searchText = "https://www.google.com/search?=${search.text}";
    _appWebViewController?.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(searchText),
      ),
    );
  }
}
