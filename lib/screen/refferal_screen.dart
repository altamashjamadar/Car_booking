import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/UI/custom_Card.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const referralCode = 'KANGAROO643';
      Size size = MediaQuery.of(context).size;
  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Refer Friend'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: 

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
             Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC107),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/mic2.png',
                      width: size.width * 0.35,
                      height: size.width * 0.35,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12),
         
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Invite your friends\nto try Kangaroo',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          
                          GestureDetector(
                           
                            onTap: () {
                              Get.snackbar("Code Copied","Refferal code copied");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    referralCode,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Icon(Icons.copy, size: 18),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24,),
              // SizedBox(
              // width: doubl/e.infinity,
              // child:
              // ElevatedButton.icon(
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color(0xFFFFC107),
              //     padding: const EdgeInsets.symmetric(horizontal: 4),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //     elevation: 0,
              //   ),
              //   icon: const Icon(Icons.card_giftcard, color: Colors.black,size: 34,),
              //   label: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: const [
              //       Text(
              //         'Invite Friends to Kangaroo',
              //         style: TextStyle(color: Colors.black),
              //       ),
              //       Text(
              //         'INVITE',
              //         style: TextStyle(
              //           color: Colors.redAccent,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //     ],
              //   ),
              //   // onPressed: () {
               
              //   // },
              // ),
            // ),
            const SizedBox(height: 10,),
            GradientTopCard(
              leading: Icon(Icons.card_giftcard),
              title: Text("Invite Friends to Kangaroo"),
              trailing: Text("INVITE",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            ),
            const SizedBox(height: 10,),
             Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HOW TO REFER FRIENDS?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ]
              )
             ),
             const SizedBox(
              height: 20,
             ),
            // Container(padding: EdgeInsets.all(8),
            //    decoration: BoxDecoration(
            //       color: const Color(0xFFFFC107),
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //   child: Column(
            //     children: [
            //       Container(
            //     height: 30,
            //     width: double.infinity,
            //     child: Text("Share Your Referral Code",
            //     style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            //     ),
            //   Text("Invite your friends via  Whatsapp or a text\n message.",)
            GradientTopCard(
              title: Text("Share Your Referral Code",style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("Invite your friends via  Whatsapp or a text\n message."),
            ),
                // ],
              // ),
            // ),
                const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    onPressed: () {
                      Get.snackbar("title", "message");
                    },
                    child: const Text('Find Friends to Refer'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                    Get.snackbar("Refer now", 
                    "refferd now");
                    },
                    child: const Text(
                      'Refer Now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
      
    );
  }
}
