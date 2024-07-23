import 'package:quiz_master/librearies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeChangerViewModel themeChangerViewModel;

  List<Category> categories = [
    Category(icon: Icon(Icons.beach_access), title: 'Destination'),
    Category(icon: Icon(Icons.hotel), title: 'Hotels'),
    Category(icon: Icon(Icons.restaurant), title: 'Culinary'),
    Category(icon: Icon(Icons.flight), title: 'Flights'),
    Category(icon: Icon(Icons.event), title: 'Event'),
  ];
  void initState() {
    // TODO: implement initState
    super.initState();
    themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
        navigatorKey.currentContext!,
        listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      appBar: AppBar(
        backgroundColor: themeChangerViewModel.getWhiteColor,
        title: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Headings.greyTextStyle(title: 'Hi, Noelle!'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on, color: Colors.black),
                    Headings.blackTextStyle(title: 'Jakarta, Indonesia'),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.notifications,
                    color: Colors.grey,
                    size: 30,
                  ),
                  Positioned(
                    top: 2,
                    right: 5,
                    child: Icon(Icons.brightness_1, color: Colors.red, size: 8),
                  ),
                ],
              ),
              MasterSpacer.w.ten(),
              MasterSpacer.w.ten(),
              MasterSpacer.w.ten(),
              Stack(
                children: [
                  CircleAvatar(backgroundColor: Colors.grey, radius: 20),
                  Positioned(
                      right: 5,
                      child: Icon(Icons.brightness_1,
                          color: Colors.blue, size: 8)),
                ],
              )
            ],
          ),
          MasterSpacer.w.ten(),
          MasterSpacer.w.ten(),
        ],
      ),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MasterSpacer.h.ten(),
          MasterSpacer.h.ten(),
          search(),
          MasterSpacer.h.ten(),
          MasterSpacer.h.ten(),
          Headings.blackTextStyle(
            title: "Categories",
            enumFontSize: EnumFontSize.extraLarge,
          ),
          GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),children: [CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey[200],
                          child: categories[index].icon,
                        ),
                        SizedBox(height: 8),
                        Text(
                          categories[index].title,
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,],),

          // Expanded(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //     child: GridView.count(
          //       crossAxisCount: 5,
          //       children: List.generate(categories.length, (index) {
          //         return Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             CircleAvatar(
          //               radius: 30,
          //               backgroundColor: Colors.grey[200],
          //               child: categories[index].icon,
          //             ),
          //             SizedBox(height: 8),
          //             Text(
          //               categories[index].title,
          //               style: TextStyle(fontSize: 12),
          //               textAlign: TextAlign.center,
          //             ),
          //           ],
          //         );
          //       }),
          //     ),
          //   ),
          // ),
        ],
      )),
    );
  }

  search() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Destination, Hotels",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.circular(15),
            ),
            child: IconButton(
              icon: Icon(Icons.tune, color: Colors.white),
              onPressed: () {
                // Handle the filter button press
              },
            ),
          ),
        ],
      ),
    );
  }
}
