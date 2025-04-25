import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  int _overallRating = 0;
  int _professionalRating = 0;
  int _inRideRating = 0;
  String? _vehicleComfort;
  String? _routeEfficient;
  String? _feltSafe;
  String? _rideAgain;
  final TextEditingController _commentsController = TextEditingController();

  final List<String> _comfortOptions = [
    'Very Uncomfortable',
    'Uncomfortable',
    'Neutral',
    'Comfortable',
    'Very Comfortable',
  ];

  final List<String> _yesNoOptions = ['Yes', 'No'];
  final List<String> _rideAgainOptions = [
    'Definitely Not',
    'Probably Not',
    'Not sure',
    'Probably Yes',
    'Definitely Yes',
  ];

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    print('Overall rating: $_overallRating');
    print('Professional rating: $_professionalRating');
    print('In-ride rating: $_inRideRating');
    print('Vehicle comfort: $_vehicleComfort');
    print('Route efficient: $_routeEfficient');
    print('Felt safe: $_feltSafe');
    print('Ride again: $_rideAgain');
    print('Comments: ${_commentsController.text}');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Thank you for your feedback!')),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.offAllNamed('/home'); 
    });
  
  }

  Widget _buildStarRating({
    required int currentRating,
    required ValueChanged<int> onRatingSelected,
  }) {
    return Row(
      children: List.generate(5, (index) {
        return IconButton(
          icon: Icon(
            index < currentRating ? Icons.star : Icons.star_border,
            color: Colors.orange,
            size: 28,
          ),
          onPressed: () => onRatingSelected(index + 1),
        );
      }),
    );
  }

  Widget _buildRadioList<T>({
    required String title,
    required List<T> options,
    required T? groupValue,
    required ValueChanged<T?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        ...options.map((option) {
          return RadioListTile<T>(
            contentPadding: EdgeInsets.zero,
            title: Text(option.toString()),
            value: option,
            groupValue: groupValue,
            onChanged: onChanged,
          );
        }).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Feedback Form',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'How would you rate your overall ride experience?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Text(
              '(1 = Poor, 5 = Excellent)',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
            ),
            _buildStarRating(
              currentRating: _overallRating,
              onRatingSelected: (r) => setState(() => _overallRating = r),
            ),
            const Divider(height: 32),
           const Text(
              'How professional and courteous was your driver?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            _buildStarRating(
              currentRating: _professionalRating,
              onRatingSelected: (r) => setState(() => _professionalRating = r),
            ),
            const Divider(height: 32),

            _buildRadioList<String>(
              title: 'Was the vehicle clean and comfortable?',
              options: _comfortOptions,
              groupValue: _vehicleComfort,
              onChanged: (v) => setState(() => _vehicleComfort = v),
            ),
            const Divider(height: 32),

            _buildRadioList<String>(
              title: 'Did the driver take an efficient route and arrive on time?',
              options: _yesNoOptions,
              groupValue: _routeEfficient,
              onChanged: (v) => setState(() => _routeEfficient = v),
            ),
            const Divider(height: 32),

            _buildRadioList<String>(
              title: 'Did you feel safe throughout the ride?',
              options: _yesNoOptions,
              groupValue: _feltSafe,
              onChanged: (v) => setState(() => _feltSafe = v),
            ),
            const Divider(height: 32),

            const Text(
              'How was the in-ride experience (music, phone etiquette)?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            _buildStarRating(
              currentRating: _inRideRating,
              onRatingSelected: (r) => setState(() => _inRideRating = r),
            ),
            const Divider(height: 32),

            _buildRadioList<String>(
              title: 'Would you choose this driver again?',
              options: _rideAgainOptions,
              groupValue: _rideAgain,
              onChanged: (v) => setState(() => _rideAgain = v),
            ),
            const Divider(height: 32),

            const Text(
              'Any other feedback or suggestions to improve your experience?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _commentsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _submitFeedback,
              
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Submit Feedback',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
