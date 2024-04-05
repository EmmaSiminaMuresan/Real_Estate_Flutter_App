class House {
  String label;
  String name;
  String price;
  String location;
  String sqm;
  String review;
  String description;
  String frontImage;
  String ownerImage;
  List<String> images;
  String nb_rooms;
  String nb_bathrooms;
  bool isFavorite;

  House(this.label, this.name, this.price, this.location, this.sqm, this.review, this.description, this.frontImage, this.ownerImage, this.images, this.nb_rooms, this.nb_bathrooms,this.isFavorite);

}

List<House> getHouseList(){
  return <House>[
    House(
      "SALE",
      "Clinton Villa",
      "3,500.00",
      "Los Angeles",
      "2,456",
      "4.4",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_1.PNG",
      "assets/images/owner.PNG",
      [
        "assets/images/kitchen.PNG",
        "assets/images/bath_room.PNG",
         "assets/images/bedroom_1.PNG",
        "assets/images/bedroom_2.PNG",
        "assets/images/living.PNG",
      ],
      "3",
        "1",
      false

    ),
    House(
      "RENT",
      "Salu House",
      "3,500.00",
      "Miami",
      "3,300",
      "4.6",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_4.PNG",
      "assets/images/owner.PNG",
      [
        "assets/images/kitchen.PNG",
        "assets/images/bath_room.PNG",
        "assets/images/bath_room2.PNG",
         "assets/images/bedroom_1.PNG",
        "assets/images/bedroom_2.PNG",
        "assets/images/living.PNG",
      ],
      "3",
        "2",
        false
    ),
    House(
      "RENT",
      "Hilton House",
      "3,100.00",
      "California",
      "2,100",
      "4.1",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_2.PNG",
      "assets/images/owner.PNG",
      [
        "assets/images/kitchen.PNG",
        "assets/images/bath_room.PNG",
         "assets/images/bedroom_1.PNG",
      ],
      "1",
        "1",
        false
    ),
    House(
      "SALE",
      "Ibe House",
      "4,500.00",
      "Florida",
      "4,100",
      "4.5",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_3.PNG",
      "assets/images/owner.PNG",
      [
        "assets/images/kitchen.PNG",
        "assets/images/bath_room.PNG",
        "assets/images/bath_room2.PNG",
         "assets/images/bedroom_2.PNG",
        "assets/images/living.PNG",
      ],
      "2",
      "2",
        false
    ),
    House(
      "SALE",
      "Aventura",
      "5,200.00",
      "New York",
      "3,100",
      "4.2",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_5.PNG",
      "assets/images/owner.PNG",
      [
        "assets/images/kitchen.PNG",
        "assets/images/bath_room.PNG",
        "assets/images/bath_room2.PNG",
         "assets/images/bedroom_2.PNG",
        "assets/images/living.PNG",
      ],
      "2",
      "2",
        false
    ),
    House(
      "SALE",
      "North House",
      "3,500.00",
      "Florida",
      "3,700",
      "4.0",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_6.PNG",
      "assets/images/owner.PNG",
      [
        "assets/images/kitchen.PNG",
        "assets/images/bath_room.PNG",
         "assets/images/bedroom_2.PNG",
        "assets/images/bedroom_1.PNG",
        "assets/images/living.PNG",
      ],
      "3",
      "1",
        false
    ),
    House(
      "RENT",
      "Rasmus Resident",
      "2,900.00",
      "Detroit",
      "2,700",
      "4.3",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_7.PNG",
      "assets/images/owner.PNG",
      [
        "assets/images/kitchen.PNG",
        "assets/images/bath_room.PNG",
         "assets/images/bedroom_1.PNG",
        "assets/images/living.PNG",
      ],
      "2",
      "1",
        false
    ),
    House(
      "RENT",
      "Simone House",
      "3,900.00",
      "Florida",
      "3,700",
      "4.4",
      "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      "assets/images/house_8.PNG",
      "assets/images/owner.PNG",
      [
        "assets/images/kitchen.PNG",
        "assets/images/bath_room.PNG",
        "assets/images/bedroom_2.PNG",
        "assets/images/living.PNG",
      ],
      "2",
      "1",
        false
    ),
  ];
}