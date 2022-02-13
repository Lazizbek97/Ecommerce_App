import 'package:ecommerce/core/model/foods_model.dart';
import 'package:ecommerce/core/service/food_service.dart';
import 'package:ecommerce/core/utils/constants.dart';
import 'package:ecommerce/core/utils/size_config.dart';
import 'package:ecommerce/screens/presentations/search_page.dart';
import 'package:ecommerce/screens/provider/hive_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/widgets/product_card.dart';
import 'components/search_input.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<FoodsModel> foodsList = FoodsService.fetchData();
  List popUpMenuItems = ["Favorites", "Recommended"];
  String? name;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HiveProvider>();

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SvgPicture.asset(Constants.menu_image),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: InkWell(
              onTap: () {
                context.read<HiveProvider>().totalSum();                Navigator.pushNamed(context, "/basket");
              },
              child: Column(
                children: [
                  SvgPicture.asset(Constants.bracket_image),
                  const Text(
                    "My basket",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getHeight(60),
                width: getWidth(280),
                child: FutureBuilder(
                  future: SharedPreferences.getInstance(),
                  builder:
                      (context, AsyncSnapshot<SharedPreferences> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      name = snapshot.data!.getString("user");
                      return RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                          children: [
                            TextSpan(
                              text: "Hello $name ",
                            ),
                            const TextSpan(
                              text:
                                  " What fruit salad combo do you want today?",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: getHeight(10)),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showSearch(context: context, delegate: SearchPage());
                        },
                        child: const TextInputField(),
                      ),
                    ),
                    PopupMenuButton(
                      child: const Icon(Icons.menu),
                      onSelected: (int i) {
                        print(i);
                      },
                      itemBuilder: (context) {
                        return List.generate(
                          popUpMenuItems.length,
                          (index) => PopupMenuItem(
                            value: index,
                            child: Text(popUpMenuItems[index].toString()),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: getHeight(10)),
                child: SizedBox(
                  height: getHeight(40),
                  child: const Text(
                    "Recommended Combo",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(200),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => ProcductCard(
                      color: Constants.product_back_color, foodIndex: index)),
                  itemCount: provider.foodsList.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicatorColor: Constants.orange_background,
                  onTap: (v) => _tabController.index = v,
                  unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 16),
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                  isScrollable: true,
                  tabs: const [
                    Tab(
                      text: "Hottest",
                    ),
                    Tab(
                      text: "Popular",
                    ),
                    Tab(
                      text: "New combo",
                    ),
                    Tab(
                      text: "Top",
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(200),
                child: ListView.builder(
                  itemCount: provider.foodsList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProcductCard(
                    color: Constants.quinoa_color,
                    foodIndex: index,
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
