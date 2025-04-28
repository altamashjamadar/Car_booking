import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/screen/car_home_page.dart';


class LinkDevice extends StatefulWidget {
  const LinkDevice({Key? key}) : super(key: key);

  @override
  State<LinkDevice> createState() => _LinkDeviceState();
}

class _LinkDeviceState extends State<LinkDevice> {
  final List<TextEditingController> _otpCtrls =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  bool get _isOtpComplete =>
      _otpCtrls.every((c) => c.text.trim().isNotEmpty);
@override
  void dispose() {
    for (final c in _otpCtrls) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      // move to next
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      // back to previous
      _focusNodes[index - 1].requestFocus();
    }
    setState(() {}); // to refresh the Verify button
  }

   Widget _buildOtpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (i) {
        return SizedBox(
          width: 50,
          child: TextField(
            controller: _otpCtrls[i],
            focusNode: _focusNodes[i],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            onChanged: (val) => _onOtpChanged(val, i),
          ),
        );
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
     // Size size = MediaQuery.of(context).size;
  

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Link Device'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text("""To get your code : Go to Kangaroo
      on the web or on another device,
      then click Link with Phone Number"""),
        Text("Know More",style: TextStyle(color: Colors.blue),),
            const SizedBox(height: 20,),
            _buildOtpRow(),
             const SizedBox(height: 400),
             Column(
         children: [
          // const Spacer(),
          //  ElevatedButton(
          //                 onPressed: _isOtpComplete
          //                     ? () {
          //                         // TODO: verify the OTP here
          //                         Get.to(() => const CarHomePage());
          //                       }
          //                     : null,
          //                 style: ElevatedButton.styleFrom(
          //                   backgroundColor: Colors.orange,
          //                   padding: const EdgeInsets.symmetric(vertical: 14),
          //                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          //                 ),
                          
          //                 child: const Text('Submit',
          //                     style: TextStyle(fontSize: 16, color: Colors.amber)),
          //               ),
          ElevatedButton(
               onPressed: _isOtpComplete
                              ? () {
                                  // TODO: verify the OTP here
                                  Get.to(() => const CarHomePage());
                                  Get.snackbar("Success", "Linked Successfully ");
                                }
                              : null,
                style: ElevatedButton.styleFrom(
                   backgroundColor: Colors.amber,
                  
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
                child: const Text('Submit',
                              style: TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                // icon: const Icon(Icons.call,color: Colors.black,),
                // label: const Text("Call Driver",style: TextStyle(color: Colors.black,),),
             
              // ),
         ],
             ),
        
          ],
        ),
      )
    );
  }
}

