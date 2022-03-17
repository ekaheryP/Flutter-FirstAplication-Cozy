import 'package:flutter/material.dart';
import 'package:flutter_bwa_cozy/Widgets/city_card.dart';
import 'package:flutter_bwa_cozy/models/city.dart';
import 'package:provider/provider.dart';

import '../Widgets/bottom_navbar_item.dart';
import '../Widgets/space_card.dart';
import '../Widgets/tips_card.dart';
import '../models/space.dart';
import '../models/tips.dart';
import '../providers/space_provider.dart';
import '../theme.dart';

class JakartaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          // NOTE: TITLE/HEADER
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back_city.png',
                      width: 40,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 75,
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Jakarta',
                            style: blackTextStyle.copyWith(
                              fontSize: 24,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40,
                right: 30,
              ),
              child: Text(
                'Mencari kosan yang cozy di daerah DKI Jakarta',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Jakarta, Indonesia',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Container(
                    width: 320,
                    height: 130,
                    color: whiteColor,
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/jakarta_splash.jpg',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
              // NOTE : RECOMMENDED SPACE
            ),
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecomendedSpace(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data as List<Space>;
                    int index = 0;

                    return Column(
                        children: data.map((item) {
                      index++;
                      return Container(
                          margin: EdgeInsets.only(top: (index == 1) ? 0 : 30),
                          child: SpaceCard(item));
                    }).toList()

                        // [
                        //   SpaceCard(
                        //     Space(
                        //       id: 1,
                        //       name: 'Kuretakeso Hott',
                        //       imageUrl: 'assets/space1.png',
                        //       price: 52,
                        //       city: 'Bandung',
                        //       country: 'Germany',
                        //       rating: 4,
                        //     ),
                        //   ),
                        //   SizedBox(
                        //     height: 30,
                        //   ),
                        //   SpaceCard(
                        //     Space(
                        //       id: 2,
                        //       name: 'Roemah Nenek',
                        //       imageUrl: 'assets/space2.png',
                        //       price: 11,
                        //       city: 'Seattle',
                        //       country: 'Bogor',
                        //       rating: 5,
                        //     ),
                        //   ),
                        //   SizedBox(
                        //     height: 30,
                        //   ),
                        //   SpaceCard(
                        //     Space(
                        //       id: 3,
                        //       name: 'Darrling How',
                        //       imageUrl: 'assets/space3.png',
                        //       price: 20,
                        //       city: 'Jakarta',
                        //       country: 'Indonesia',
                        //       rating: 3,
                        //     ),
                        //   ),
                        // ],
                        );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(
                left: edge,
              ),
              child: Text(
                'Tips & Guidance',
                style: regularTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(Tips(
                    id: 1,
                    title: 'City Guidelines',
                    imageUrl: 'assets/tips1.png',
                    UpdateAt: '20 Apr',
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 2,
                      title: 'Jakarta Friendship',
                      imageUrl: 'assets/tips2.png',
                      UpdateAt: '11 Dec',
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 60 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
