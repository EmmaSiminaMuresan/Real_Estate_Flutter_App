import 'dart:math';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:workshopflutter/utils/widgets/custom_button.dart';
import '../../../../models/house_model.dart';
import '../../../../utils/common/constants.dart';
import 'house_property_widget_d.dart';

class ItemDetailScreen extends StatefulWidget {
  final House house;
  final int imgPathIndex;

  const ItemDetailScreen({Key? key, required this.house, required this.imgPathIndex}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  late var propertiesMap = {}; // set or map
  late var keys = []; // array

  @override
  void initState() {
    propertiesMap = {
      "Square meters": widget.house.squareMeters,
      "Bedroom": widget.house.bedrooms,
      "Bathroom": widget.house.bathrooms,
      "Garage": widget.house.garages,
      "Kitchen": widget.house.kitchens,
    };
    keys = propertiesMap.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    final oCcy = NumberFormat("##,###,###", "en_INR");
    return Scaffold(
      backgroundColor: ColorConstant.kWhiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 25, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(),
                items: Constants.imageList.map((item) => Center(child: Image.asset(item, fit: BoxFit.cover, width: screenWidth))).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${oCcy.format(widget.house.price)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          widget.house.address,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 45,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Colors.white24,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "${Random().nextInt(24)} hours ago",
                          style: Theme.of(context).textTheme.caption?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "House Information",
                      style: GoogleFonts.notoSans(
                        fontSize: 20,
                        color: ColorConstant.kBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(
                        keys.length,
                            (index) => HousePropertyWidget(value: '${propertiesMap[keys[index]]}',),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Flawless 2 story on a family friendly cul-de-sac in the heart of Blue Valley! Walk in to an open floor plan flooded w daylightm, formal dining private office, screened-in lanai w fireplace, TV hookup & custom heaters that overlooks the lit basketball court.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    color: ColorConstant.kGreyColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
