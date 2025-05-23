import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustFindRideController extends GetxController {
  var selectedSeat = ''.obs;
  var selectedDate = ''.obs;

  var selectedSeats =
      <String>[
        '1 Seat',
        '2 Seats',
        '3 Seats',
        '4 Seats',
        '5 Seats',
        '6 Seats',
        '7 Seats',
        '8 Seats',
      ].obs;

  Future<void> pickDateTime(BuildContext context) async {
    DateTime today = DateTime.now();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Select Date & Time',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Colors.black, // selected circle color
                        onPrimary: Color.fromARGB(
                          255,
                          0,
                          34,
                          255,
                        ), // selected date text color
                        onSurface: Colors.black, // default date color
                      ),
                    ),
                    child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: today,
                      lastDate: DateTime(2101),
                      onDateChanged: (date) {
                        // Update logic
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.access_time, size: 20),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: const ColorScheme.light(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    surface: Colors.white,
                                    onSurface: Colors.black,
                                  ),
                                  timePickerTheme: const TimePickerThemeData(
                                    backgroundColor: Colors.white,
                                    dialBackgroundColor: Colors.white,
                                    dialHandColor: Colors.blue,
                                    hourMinuteTextColor: Colors.black,
                                  ),
                                  dialogTheme: DialogThemeData(
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                        },
                        child: Text(
                          TimeOfDay.now().format(context),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(80, 40),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
