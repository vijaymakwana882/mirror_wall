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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
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
                    'images/yahoo.png',
                    fit: BoxFit.fill,
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
                    'images/opr.jpeg',
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
                    'images/microsoft.jpeg',
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
                    'images/firefox.jpeg',
                    fit: BoxFit.contain,
                  ),
                ),
                title: Text('Firefox Browser'),
                subtitle: Text('Browse With Firef ox'),
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
