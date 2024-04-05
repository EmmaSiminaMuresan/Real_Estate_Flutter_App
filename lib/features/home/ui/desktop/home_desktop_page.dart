import 'package:flutter/material.dart';
import '../../../../models/house_model_d.dart';
import 'item_detail_page_d.dart';

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({Key? key}) : super(key: key);

  @override
  _HomeDesktopPageState createState() => _HomeDesktopPageState();
}

class _HomeDesktopPageState extends State<HomeDesktopPage> {
  List<House> properties = getHouseList();
  List<House> filteredProperties = [];
  TextEditingController _searchController = TextEditingController();
  String? selectedBedroomsFilter;
  String? selectedBathroomsFilter;
  bool showFavoritesOnly = false;
  int resultsCount = 0; // Track the number of results

  @override
  void initState() {
    super.initState();
    filteredProperties.addAll(properties);
    updateResultsCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 1000,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24),
              Center(
                child: Text(
                  'Explore Properties',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    filterProperties();
                    updateResultsCount(); // Update results count when filtering
                  });
                },
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Search by location',
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[400],
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _showFilters();
                },
                child: Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                '$resultsCount Results found', // Display the dynamic count
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    return buildProperty(filteredProperties[index], (isFavorite) {
                      setState(() {
                        filteredProperties[index].isFavorite = isFavorite;
                      });
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProperty(House property, Function(bool) onFavoriteChanged) {
    if (showFavoritesOnly && !property.isFavorite) {
      return SizedBox.shrink(); // Hide non-favorite houses if showFavoritesOnly is true
    }
    return GestureDetector(
      onTap: () async {
        final updatedProperty = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail_desktop(property: property, isFavorite: property.isFavorite, onFavoriteChanged: onFavoriteChanged),
          ),
        );
        // Update property if changed
        if (updatedProperty != null) {
          setState(() {
            property.isFavorite = updatedProperty.isFavorite;
          });
        }
        updateResultsCount(); // Update results count when returning from detail page
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 16),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(property.frontImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.purple[300],
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: Text(
                        'FOR ' + property.label,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          property.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              property.location,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.zoom_out_map,
                              color: Colors.white,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(
                              property.sqm + ' sq/m',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              '\$' + property.price,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 16),
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 14,
                            ),
                            SizedBox(width: 4),
                            Text(
                              property.review + ' Reviews',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    bool newFavorite = !property.isFavorite;
                    setState(() {
                      property.isFavorite = newFavorite;
                    });
                    onFavoriteChanged(newFavorite); // Notify parent widget of favorite status change
                  },
                  child: Icon(
                    property.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: property.isFavorite ? Colors.red : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Wrap(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Rooms',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildFilterButton('1 room', '1', true, setState),
                    _buildFilterButton('2 rooms', '2', true, setState),
                    _buildFilterButton('3 rooms', '3', true, setState),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Bathrooms',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildFilterButton('1 bathroom', '1', false, setState),
                    _buildFilterButton('2 bathrooms', '2', false, setState),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: showFavoritesOnly,
                            onChanged: (value) {
                              setState(() {
                                showFavoritesOnly = value!;
                                filterProperties();
                                updateResultsCount(); // Update results count when toggling favorites filter
                              });
                            },
                          ),
                          Text(
                            'Favorites Only',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildFilterButton(String label, String value, bool isRoomFilter, StateSetter setState) {
    bool isActive;
    if (isRoomFilter) {
      isActive = selectedBedroomsFilter == value;
    } else {
      isActive = selectedBathroomsFilter == value;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (isRoomFilter) {
              if (selectedBedroomsFilter != value) {
                selectedBedroomsFilter = value;
                selectedBathroomsFilter = null;
              } else {
                selectedBedroomsFilter = null;
              }
            } else {
              if (selectedBathroomsFilter != value) {
                selectedBathroomsFilter = value;
                selectedBedroomsFilter = null;
              } else {
                selectedBathroomsFilter = null;
              }
            }
            filterProperties();
            updateResultsCount(); // Update results count when applying filter
          });
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) {
              if (states.contains(MaterialState.pressed) || isActive) {
                return Colors.purple[200]; // Change to purple when active or pressed
              }
              return null; // If not active or pressed, return null for default background color
            },
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child: Text(label),
      ),
    );
  }

  void filterProperties() {
    setState(() {
      filteredProperties = properties.where((house) {
        if (showFavoritesOnly && !house.isFavorite) {
          return false;
        }
        if (_searchController.text.isNotEmpty &&
            !house.location.toLowerCase().contains(_searchController.text.toLowerCase())) {
          return false;
        }
        if (selectedBedroomsFilter != null && house.nb_rooms != selectedBedroomsFilter) {
          return false;
        }
        if (selectedBathroomsFilter != null && house.nb_bathrooms != selectedBathroomsFilter) {
          return false;
        }
        // Check if all filters are null, if true, display all houses
        if (selectedBedroomsFilter == null && selectedBathroomsFilter == null && !showFavoritesOnly) {
          return true;
        }
        return true;
      }).toList();
    });
  }

  void updateResultsCount() {
    setState(() {
      resultsCount = filteredProperties.length;
    });
  }
}
