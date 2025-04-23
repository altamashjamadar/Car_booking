import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Safety Hub"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Text(
                "At Kangaroo, your safety comes first.Here are some measures and provisions to ensure your safety.",
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("Know More", style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Image.asset("assets/24:7.png",
                    //   height: 306,
                    //   width: 291,),

                    //   SizedBox(width: 20,),
                    //   Image.asset("assets/tracking.jpeg",
                    //   height: 306,
                    //   width: 291,),
                    //   SizedBox(width: 10,),
                    //   Image.asset("assets/contact.png",
                    //   height: 306,
                    //   width: 291,)
                    Column(
                      children: [
                        Image.asset("assets/24:7.png", height: 306, width: 291),
                        Text(
                          "24/7 support assistance",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Image.asset(
                          "assets/tracking.jpeg",
                          height: 306,
                          width: 291,
                        ),
                        Text(
                          "Share live location",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Image.asset(
                          "assets/contact.png",
                          height: 306,
                          width: 291,
                        ),
                        Text(
                          "Add trusted contacts",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              Row(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Card(
                // color: Colors.amber,
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  title: Text("New trusted contacts"),
                  subtitle: Text("share ride trip details with your loved ones in a single tap"),
                  trailing: const Icon(Icons.chevron_right),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
