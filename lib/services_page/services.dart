import 'package:flutter/material.dart';
import 'package:healing_haven/homepage/utils/text_tile.dart';
import 'package:healing_haven/services_page/New%20folder/service_tile.dart';
import 'package:healing_haven/services_page/services_construc.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  PageController _pageController = PageController();
  int _selectedPage = 0;

  void _onTabTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextTile(
          txtAlign: TextAlign.start,
          Texttile: "Services",
          colorWhat: Colors.brown.shade800,
          fontweightWhat: FontWeight.bold,
        ),
        backgroundColor: Colors.grey[300],
      ),
      body: Column(
        children: [
          // Tab bar
          Container(
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _TabButton(
                  label: "Available Services",
                  isSelected: _selectedPage == 0,
                  onTap: () => _onTabTapped(0),
                ),
                _TabButton(
                  label: "Consultations",
                  isSelected: _selectedPage == 1,
                  onTap: () => _onTabTapped(1),
                ),
              ],
            ),
          ),

          // PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) => setState(() => _selectedPage = index),
              children: [_AvailableServicesPage(), _ConsultationsPage()],
            ),
          ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.brown.shade800 : Colors.grey,
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: 3,
            width: 40,
            color: isSelected ? Colors.brown.shade800 : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

class _ConsultationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> upcomingConsultations = [
    {
      'title': 'Consultation for Kenneth Reyes',
      'date': 'April 21, 2025',
      'status': 'Pending',
    },
    {
      'title': 'Consultation for Kenneth Reyes',
      'date': 'April 23, 2025',
      'status': 'Approved',
    },
    {
      'title': 'Consultation for Kenneth Reyes',
      'date': 'April 25, 2025',
      'status': 'Declined',
    },
  ];

  final List<Map<String, dynamic>> pastConsultations = [
    {'title': 'Consultation with Dr. Wong', 'date': 'March 14, 2025'},
    {'title': 'Consultation with Dr. Wong', 'date': 'February 20, 2025'},
  ];

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green;
      case 'Declined':
        return Colors.red;
      case 'Pending':
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Upcoming
          Text(
            "Upcoming Consultations",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...upcomingConsultations.map((consultation) {
            return Card(
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(Icons.schedule, color: Colors.brown),
                title: Text(consultation['title']),
                subtitle: Text("Date: ${consultation['date']}"),
                trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(
                      consultation['status'],
                    ).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    consultation['status'],
                    style: TextStyle(
                      color: _getStatusColor(consultation['status']),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),

          SizedBox(height: 20),
          // Past
          Text(
            "Past Consultations",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...pastConsultations.map((consultation) {
            return Card(
              margin: EdgeInsets.only(bottom: 12),
              child: ListTile(
                leading: Icon(Icons.history, color: Colors.brown),
                title: Text(consultation['title']),
                subtitle: Text("Date: ${consultation['date']}"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class _AvailableServicesPage extends StatelessWidget {
  final List<Services> serviceList = [
    Services(
      serviceName: 'Hair Restoration',
      imagePath: 'lib/images/50.png',
      description:
          'Restore your hair’s natural growth and thickness with Autologous Micro-grafting hair restoration in Manila.',
    ),
    Services(
      serviceName: 'Dermapathology',
      imagePath: 'lib/images/51.png',
      description:
          'Get accurate and timely diagnosis for your difficult cases with dermpathology consultation in Manila.',
    ),
    Services(
      serviceName: 'Wound Care',
      imagePath: 'lib/images/52.png',
      description:
          'Manage non-healing & abnormal wounds with expert Wound Care in Manila.',
    ),
    Services(
      serviceName: 'Management of Complications',
      imagePath: 'lib/images/53.png',
      description:
          'Even with the most skilled surgeon & doctor, chances are complications can still happen after a procedure. At our clinic, we are equipped & ready to manage them as they happen, along with taking the necessary steps to prevent further complications.',
    ),
    Services(
      serviceName: 'Incision & Drainage',
      imagePath: 'lib/images/54.png',
      description:
          'Relieve discomfort from fluidy skin growths & promote healing with an Incision and Drainage procedure.',
    ),
    Services(
      serviceName: 'Skin Biopsy',
      imagePath: 'lib/images/55.png',
      description:
          'Unsure what’s going on in your skin? Finally find out what’s going on with a Skin Biopsy in Manila.',
    ),
    Services(
      serviceName: 'Benign Growth Removal',
      imagePath: 'lib/images/56.png',
      description:
          'Remove unwanted skin growths, such as warts, moles, or skin tags, with our Electrosurgery procedure in Manila',
    ),
    Services(
      serviceName: 'Nail Procedures',
      imagePath: 'lib/images/57.png',
      description:
          'Finally have the confidence to flaunt heathy, painless, normal, & beautiful nails by fixing them with Nail Procedures in Manila.',
    ),
    Services(
      serviceName: 'Immunotherapy',
      imagePath: 'lib/images/58.png',
      description: 'Treat viral skin infection with Immunotherapy in Manila.',
    ),
    Services(
      serviceName: 'Cryo Surgery',
      imagePath: 'lib/images/59.png',
      description:
          'Remove recurrent skin issues, like skin tags, bumps, & benign growths, with Cryosurgery in Manila.',
    ),
    Services(
      serviceName: 'Electro Surgery',
      imagePath: 'lib/images/60.png',
      description:
          'Remove unwanted skin growths, such as warts, moles, or skin tags, with our Electrosurgery procedure in Manila',
    ),
    Services(
      serviceName: 'Tattoo Removal',
      imagePath: 'lib/images/61.png',
      description:
          'Say goodbye to unwanted tattoos with Tattoo Removal in Manila.',
    ),
    Services(
      serviceName: 'Wrinkle Reduction with Non-ablative Lasers',
      imagePath: 'lib/images/62.png',
      description:
          'Reduce the appearance of wrinkles, brown spots, and minor scars with Non-ablative Lasers in Manila.',
    ),
    Services(
      serviceName: 'Derma Fillers',
      imagePath: 'lib/images/63.png',
      description:
          'Achieve a more youthful & fuller face with Dermal Fillers in Manila.',
    ),
    Services(
      serviceName: 'Vein Reduction',
      imagePath: 'lib/images/64.png',
      description:
          'Eliminate unsightly varicose & spider veins in a few days with non-surgical vein reduction in Manila.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, right: 30, top: 25),
        child: SizedBox(
          height: 440,
          width: 800,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: serviceList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: (ServiceTile(services: serviceList[index])),
              );
            },
          ),
        ),
      ),
    );
  }
}
