import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../models/house_model.dart';
import '../../../../utils/common/constants.dart';
import 'item_detail_page_d.dart';

class HouseAdWidget extends StatefulWidget {
  final House house;
  final int imgPathIndex;

  const HouseAdWidget({Key? key, required this.house, required this.imgPathIndex}) : super(key: key);

  @override
  State<HouseAdWidget> createState() => _HouseAdWidgetState();
}

class _HouseAdWidgetState extends State<HouseAdWidget> {
  late House house;

  @override
  void initState() {
    house = widget.house;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formatedPrice = NumberFormat("##,###,###", "en_INR");
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () async {
        House received = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(
              house: house,
              imgPathIndex: widget.imgPathIndex,
            ),
          ),
        );
        setState(() {
          house = received;
        });
      },
      child: Container(
        alignment: Alignment.centerRight, // Align the Row to the right
        child: Padding(
          padding: const EdgeInsets.only(left: 100, right: 12, top: 8, bottom: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Image Container on the Left
            Container(
            height: 160,
            width: screenWidth * 0.4, // Adjust this value as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  Constants.imageList[widget.imgPathIndex],
                ),
              ),
            ),
            child: GestureDetector(
              onTap: (){
                HapticFeedback.mediumImpact(); //<uses-permission android:name="android.permission.VIBRATE" />
                setState(() {
                  house.isFavorite = !house.isFavorite;
                });
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: const EdgeInsets.only(top: 12, right: 8), // Adjust right margin here
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: ColorConstant.kWhiteColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(
                    house.isFavorite ? Icons.favorite : Icons.favorite_border, color: house.isFavorite ? Colors.redAccent : Colors.black,
                  ),
                ),
              ),
            ),

              ),
              SizedBox(width: 12), // Add some space between image and details
              // Details Container on the Right
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\$${formatedPrice.format(house.price)}",
                      style: GoogleFonts.notoSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      house.address,
                      style: GoogleFonts.notoSans(
                        fontSize: 15,
                        color: ColorConstant.kGreyColor,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${house.bedrooms} bedroom${house.bedrooms > 1 ? 's':''} / ${house.bathrooms} bathrooms / ${house.squareMeters} ft\u00B2",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
