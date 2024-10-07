import 'package:flutter/material.dart';
import 'package:heritage_conservative/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const FlightSearchScreen(),
    // Center(child: Text('Booking', style: TextStyle(fontSize: 24))),
    const BookingScreen(),
    const Center(child: Text('Notifications', style: TextStyle(fontSize: 24))),
    // Center(child: Text('Setting', style: TextStyle(fontSize: 24))),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  String fromCity = 'ADD\nAddis Ababa Bole International Airport';
  String toCity = 'Select Destination';

  void _selectAirport(String field) async {
    // Navigate to SelectAirportScreen and wait for the selected airport
    final selectedAirport = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectAirportScreen(),
      ),
    );

    // Update the selected airport in the relevant field
    if (selectedAirport != null) {
      setState(() {
        if (field == 'from') {
          fromCity = selectedAirport;
        } else if (field == 'to') {
          toCity = selectedAirport;
        }
      });
    }
  }

  String tripType = 'Return';
  int adults = 1;
  int children = 0;
  int infants = 0;
  String cabinClass = 'Economy';
  String selectedClass = "Economy";

  DateTime departureDate = DateTime.now();
  DateTime returnDate = DateTime.now().add(const Duration(days: 15));
  // void showCabinClassPicker() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           ListTile(
  //             title: const Text('Economy'),
  //             onTap: () {
  //               setState(() {
  //                 selectedClass = 'Economy';
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //           ListTile(
  //             title: const Text('Business'),
  //             onTap: () {
  //               setState(() {
  //                 selectedClass = 'Business';
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //           ListTile(
  //             title: const Text('First'),
  //             onTap: () {
  //               setState(() {
  //                 selectedClass = 'First';
  //               });
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );

  // }
  void showCabinClassPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cabin Class',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Economy'),
              trailing:
                  selectedClass == 'Economy' ? const Icon(Icons.check) : null,
              onTap: () {
                setState(() {
                  selectedClass = 'Economy';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              trailing:
                  selectedClass == 'Business' ? const Icon(Icons.check) : null,
              onTap: () {
                setState(() {
                  selectedClass = 'Business';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('First'),
              trailing:
                  selectedClass == 'First' ? const Icon(Icons.check) : null,
              onTap: () {
                setState(() {
                  selectedClass = 'First';
                });
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  // void showPassengerPicker() {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               const Text("Adult"),
  //               Row(
  //                 children: [
  //                   IconButton(
  //                     icon: const Icon(Icons.remove),
  //                     onPressed: () {
  //                       if (adults > 1) {
  //                         setState(() {
  //                           adults--;
  //                         });
  //                       }
  //                     },
  //                   ),
  //                   Text(adults.toString()),
  //                   IconButton(
  //                     icon: const Icon(Icons.add),
  //                     onPressed: () {
  //                       setState(() {
  //                         adults++;
  //                       });
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               const Text("Children (2-12 years)"),
  //               Row(
  //                 children: [
  //                   IconButton(
  //                     icon: const Icon(Icons.remove),
  //                     onPressed: () {
  //                       if (children > 0) {
  //                         setState(() {
  //                           children--;
  //                         });
  //                       }
  //                     },
  //                   ),
  //                   Text(children.toString()),
  //                   IconButton(
  //                     icon: const Icon(Icons.add),
  //                     onPressed: () {
  //                       setState(() {
  //                         children++;
  //                       });
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               const Text("Infant (<2 years)"),
  //               Row(
  //                 children: [
  //                   IconButton(
  //                     icon: const Icon(Icons.remove),
  //                     onPressed: () {
  //                       if (infants > 0) {
  //                         setState(() {
  //                           infants--;
  //                         });
  //                       }
  //                     },
  //                   ),
  //                   Text(infants.toString()),
  //                   IconButton(
  //                     icon: const Icon(Icons.add),
  //                     onPressed: () {
  //                       setState(() {
  //                         infants++;
  //                       });
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void showPassengerPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Passengers',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildPassengerRow('Adult', adults, (value) {
              setState(() {
                adults = value;
              });
            }),
            buildPassengerRow('Children (2-12 Years)', children, (value) {
              setState(() {
                children = value;
              });
            }),
            buildPassengerRow('Infant (<2 Years)', infants, (value) {
              setState(() {
                infants = value;
              });
            }),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  Widget buildPassengerRow(String label, int count, Function(int) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  if (count > (label == 'Adult' ? 1 : 0)) {
                    onChanged(count - 1);
                  }
                },
              ),
              Text(
                count.toString(),
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  onChanged(count + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            SizedBox(
              height: 315,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/planeFour.jpg',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 100),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ToggleButtons(
                              isSelected: [
                                tripType == 'Return',
                                tripType == 'One-Way'
                              ],
                              onPressed: (index) {
                                setState(() {
                                  tripType = index == 0 ? 'Return' : 'One-Way';
                                });
                              },
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: tripType == 'Return'
                                          ? Colors.white
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Return',
                                        style: TextStyle(
                                          color: tripType == 'Return'
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Container(
                                    width: 100,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: tripType == 'One-Way'
                                          ? Colors.white
                                          : Colors.black,
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'One-Way',
                                        style: TextStyle(
                                          color: tripType == 'One-Way'
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              // Select from airport
                              onTap: () => _selectAirport('from'),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 50,
                                      ),
                                      child: Text(
                                        'From',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          fromCity,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                children: [
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 10,
                                  ),
                                  Icon(
                                    Icons.arrow_back,
                                    size: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              // Select to airport
                              onTap: () => _selectAirport('to'),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 50,
                                      ),
                                      child: Text(
                                        'To',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 20,
                                        ),
                                        child: Text(
                                          toCity,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 200,
                    child: Image.asset(
                      width: 60,
                      height: 60,
                      'assets/guzo_go.png',
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 5,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(9, 12, 30, 1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                              style: BorderStyle.solid,
                            )),
                        child: const Icon(
                          Icons.notifications_active,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Column(
                    children: [
                      // First section (Departure and Return Date)
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Departure Date',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate: departureDate,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2025),
                                    );
                                    if (picked != null &&
                                        picked != departureDate) {
                                      setState(() {
                                        departureDate = picked;
                                      });
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${departureDate.day}',
                                          style: const TextStyle(
                                            fontSize: 30,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${getMonth(departureDate.month)} ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              getWeekday(departureDate.weekday),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Return Date',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (tripType == 'Return') {
                                      DateTime? picked = await showDatePicker(
                                        context: context,
                                        initialDate: returnDate,
                                        firstDate: DateTime(2020),
                                        lastDate: DateTime(2025),
                                      );
                                      if (picked != null &&
                                          picked != returnDate) {
                                        setState(() {
                                          returnDate = picked;
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: tripType == 'Return'
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${returnDate.day}',
                                                style: const TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${getMonth(returnDate.month)} ',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    getWeekday(
                                                        returnDate.weekday),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Divider section
                      const Divider(
                        height: 2,
                        color: Colors.grey,
                        thickness: 1,
                      ),

                      // Second section (Cabin Class and Passengers)
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: showCabinClassPicker,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Cabin Class",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      selectedClass,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: showPassengerPicker,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Passengers",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            size: 30,
                                          ),
                                          Text('$adults'),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            size: 20,
                                          ),
                                          Text('$children'),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            size: 15,
                                          ),
                                          Text('$infants'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Divider section
                      const Divider(
                        height: 2,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                  // Adjust the Positioned widget
                  const Positioned(
                    top: -10,
                    left: 200,
                    child: SizedBox(
                      height: 178,
                      child: VerticalDivider(
                        width: 2,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectAirportScreen(),
                  ),
                );
              },
              child: Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(221, 193, 95, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Search Flights',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getMonth(int month) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  String getWeekday(int weekday) {
    List<String> weekdays = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];
    return weekdays[weekday - 1];
  }
}

// Reusable OptionTile widget for list items
class OptionTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const OptionTile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade700),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {
        // Handle tap action here
      },
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              // Top Section with the Plane Image
              Stack(
                children: [
                  Image.asset(
                    'assets/planeProfile.png',
                    height: 200,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  const Positioned(
                    top: 40,
                    left: 10,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 10,
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Sign-In Button

              // Options List
              const OptionTile(icon: Icons.money, title: 'Currency'),
              const OptionTile(icon: Icons.language, title: 'Language'),
              const OptionTile(
                  icon: Icons.attach_file, title: 'Attach Document'),
              const OptionTile(icon: Icons.phone, title: 'Customer service'),
              const OptionTile(icon: Icons.book, title: 'Terms and Conditions'),
              const OptionTile(
                  icon: Icons.privacy_tip, title: 'Privacy Policy'),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            height: 200,
            fit: BoxFit.cover,
            'assets/my_bookings.png',
          ),
        ),

        const SizedBox(height: 40),

        // 'Refresh' Button

        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              "Refresh",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 100),

        // Message when no bookings are found
        Text(
          "You don't have any bookings yet",
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue[900],
          ),
        ),
      ],
    );
  }
}
