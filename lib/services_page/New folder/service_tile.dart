import 'package:flutter/material.dart';
import 'package:healing_haven/services_page/services_construc.dart';

class ServiceTile extends StatelessWidget {
  final Services services;

  const ServiceTile({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 31),
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // shoe pic
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 270, // you can adjust this
              child: Image.asset(services.imagePath, fit: BoxFit.cover),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          services.serviceName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //description
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 15, bottom: 15),
            child: Text(
              services.description,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),
          ),

          //price and details
        ],
      ),
    );
  }
}
