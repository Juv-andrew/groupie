import 'package:flutter/material.dart';

class Schedule {
  final List<String> days;
  final String timeSlot;
  final String workoutType;

  Schedule({
    required this.days,
    required this.timeSlot,
    required this.workoutType,
  });

  @override
  String toString() => "${days.join(', ')} • $workoutType • $timeSlot";
}

Future<Schedule?> showScheduleDialog(BuildContext context) async {
  final List<String> allDays = [
    "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"
  ];
  final List<String> timeSlots = [
    "08.00-10.00", "14.00-16.00", "18.00-20.00"
  ];
  final List<String> workoutTypes = [
    "Weight Training", "Fat Burn", "Yoga"
  ];

  List<String> selectedDays = [];
  String selectedTimeSlot = timeSlots[0];
  String selectedWorkoutType = workoutTypes[0];

  return await showModalBottomSheet<Schedule>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (ctx, setState) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Pilih Jadwal Sesi",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),

                    const Text("Pilih hingga 3 hari:"),
                    Wrap(
                      spacing: 8,
                      children: allDays.map((day) {
                        return FilterChip(
                          label: Text(day),
                          selected: selectedDays.contains(day),
                          onSelected: (isSelected) {
                            setState(() {
                              if (isSelected) {
                                if (selectedDays.length < 3) {
                                  selectedDays.add(day);
                                }
                              } else {
                                selectedDays.remove(day);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      value: selectedTimeSlot,
                      decoration: const InputDecoration(
                        labelText: "Pilih Waktu",
                        border: OutlineInputBorder(),
                      ),
                      items: timeSlots.map((slot) {
                        return DropdownMenuItem(
                          value: slot,
                          child: Text(slot),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedTimeSlot = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 16),

                    DropdownButtonFormField<String>(
                      value: selectedWorkoutType,
                      decoration: const InputDecoration(
                        labelText: "Pilih Jenis Latihan",
                        border: OutlineInputBorder(),
                      ),
                      items: workoutTypes.map((type) {
                        return DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedWorkoutType = value!;
                        });
                      },
                    ),

                    const Spacer(),

                    Center(
                      child: ElevatedButton(
                        onPressed: selectedDays.isEmpty
                            ? null
                            : () {
                                Navigator.pop(
                                  context,
                                  Schedule(
                                    days: selectedDays,
                                    timeSlot: selectedTimeSlot,
                                    workoutType: selectedWorkoutType,
                                  ),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0D273D),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        ),
                        child: const Text(
                          "Confirm Jadwal",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
