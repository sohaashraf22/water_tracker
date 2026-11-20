import 'package:flutter/material.dart';
import '../utils/water_calculator.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String? selectedGender;

  double activityHours = 1;

  int weight = 60;

  int age = 20;

  void calculateWater() {
    // Make sure the user selected a gender.
    if (selectedGender == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your gender first.'),
        ),
      );
      return;
    }

    // Calculate daily water intake.
    final double litres = WaterCalculator.calculate(
      weightKg: weight,
      activityHours: activityHours,
    );

    // Open the result screen.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          litres: litres,
          weight: weight,
          age: age,
          activityHours: activityHours,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Daily Water',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const Text(
                'Hydration Tracker',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF00E5FF),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Gender',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _genderCard(
                      icon: Icons.male,
                      title: 'Male',
                      value: 'Male',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _genderCard(
                      icon: Icons.female,
                      title: 'Female',
                      value: 'Female',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Daily Activity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              Slider(
                value: activityHours,
                min: 0,
                max: 8,
                divisions: 8,
                activeColor: const Color(0xFF00E5FF),
                inactiveColor: const Color(0xFF1D1E33),
                label: '${activityHours.round()} hours',
                onChanged: (value) {
                  setState(() {
                    activityHours = value;
                  });
                },
              ),

              Center(
                child: Text(
                  '${activityHours.round()} hours / day',
                  style: const TextStyle(
                    color: Color(0xFFB0BEC5),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              _counterCard(
                title: 'Weight',
                value: weight,
                unit: 'kg',
                min: 30,
                max: 200,
                onChanged: (newValue) {
                  setState(() {
                    weight = newValue;
                  });
                },
              ),

              const SizedBox(height: 15),

              _counterCard(
                title: 'Age',
                value: age,
                unit: 'years',
                min: 10,
                max: 100,
                onChanged: (newValue) {
                  setState(() {
                    age = newValue;
                  });
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: calculateWater,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E5FF),
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Calculate Water Intake',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genderCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    final bool isSelected = selectedGender == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 130,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF1D1E33)
              : const Color(0xFF111328),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF00E5FF)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: isSelected
                  ? const Color(0xFF00E5FF)
                  : const Color(0xFFB0BEC5),
            ),

            const SizedBox(height: 8),

            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _counterCard({
    required String title,
    required int value,
    required String unit,
    required int min,
    required int max,
    required Function(int) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF111328),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  '$value $unit',
                  style: const TextStyle(
                    color: Color(0xFFB0BEC5),
                  ),
                ),
              ],
            ),
          ),

          IconButton(
            onPressed: value > min
                ? () => onChanged(value - 1)
                : null,
            icon: const Icon(Icons.remove),
            color: const Color(0xFF00E5FF),
          ),

          Text(
            '$value',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          IconButton(
            onPressed: value < max
                ? () => onChanged(value + 1)
                : null,
            icon: const Icon(Icons.add),
            color: const Color(0xFF00E5FF),
          ),
        ],
      ),
    );
  }
}