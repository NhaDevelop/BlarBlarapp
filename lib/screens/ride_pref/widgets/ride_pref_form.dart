import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/screens/app_widget/bla_button.dart';
import 'package:week_3_blabla_project/screens/app_widget/seat_number_picker.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/screens/app_widget/location_picker.dart';
import 'package:week_3_blabla_project/screens/app_widget/date_picker.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/screens/rides_screen.dart'; // Import the RidesScreen

class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  Location? arrival;
  late DateTime departureDate;
  late int requestedSeats;

  @override
  void initState() {
    super.initState();
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  void _updateDeparture(Location newLocation) {
    setState(() {
      departure = newLocation;
    });
  }

  void _updateArrival(Location newLocation) {
    setState(() {
      arrival = newLocation;
    });
  }

  void _updateDepartureDate(DateTime newDate) {
    setState(() {
      departureDate = newDate;
    });
  }

  void _updateSeats(int newSeats) {
    setState(() {
      requestedSeats = newSeats;
    });
  }

  void _switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  void _onSearchPressed() {
    if (departure != null && arrival != null) {
      RidePref ridePref = RidePref(
        departure: departure!,
        arrival: arrival!,
        departureDate: departureDate,
        requestedSeats: requestedSeats,
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RidePrefScreen(
            ridePref: ridePref,
            rides: fakeRides,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(BlaSpacings.m),
          margin: const EdgeInsets.symmetric(horizontal: BlaSpacings.m),
          child: Column(
            children: [
              // Departure Location Picker with Swap Button
              Stack(
                children: [
                  LocationPicker(
                    label: "Departure",
                    initialLocation: departure,
                    onLocationSelected: _updateDeparture,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: IconButton(
                      icon: Icon(Icons.swap_vert, color: BlaColors.primary),
                      onPressed: _switchLocations,
                    ),
                  ),
                ],
              ),
              Divider(color: BlaColors.greyLight, thickness: 1),
              // Arrival Location Picker
              LocationPicker(
                label: "Arrival",
                initialLocation: arrival,
                onLocationSelected: _updateArrival,
              ),
              Divider(color: BlaColors.greyLight, thickness: 1),
              // Date Picker
              DatePicker(
                initialDate: departureDate,
                onDateSelected: _updateDepartureDate,
              ),
              Divider(color: BlaColors.greyLight, thickness: 1),
              // Seat Picker
              SeatNumberSpinner(
                initialValue: requestedSeats,
                onChanged: _updateSeats,
              ),
            ],
          ),
        ),

        // Search Button
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: BlaSpacings.m),
            child: BlaButton(
              text: "Search",
              onPressed: _onSearchPressed,
              isPrimary: true,
              icon: Icons.search,
            ),
          ),
        ),
      ],
    );
  }
}
