import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/screens/app_widget/bla_button.dart'; 
import 'package:week_3_blabla_project/screens/app_widget/seat_number_picker.dart';
import 'package:week_3_blabla_project/screens/ride/ride_screen.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/screens/app_widget/location_picker.dart';
import 'package:week_3_blabla_project/screens/app_widget/date_picker.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

// A form widget to collect and manage user ride preferences
class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref; // Optional initial ride preferences

  const RidePrefForm({super.key, this.initRidePref, required initialPreference, required void Function(dynamic newPreference) onSubmit});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

// State class for managing the form's data
class _RidePrefFormState extends State<RidePrefForm> {
  // Variables to store user selections
  Location? departure;
  Location? arrival;
  late DateTime departureDate;
  late int requestedSeats;

  @override
  void initState() {
    super.initState();
    // Initialize form fields with existing ride preferences or default values
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
  }

  // Updates the departure location and refreshes the UI
  void _updateDeparture(Location newLocation) {
    setState(() {
      departure = newLocation;
    });
  }

  // Updates the arrival location and refreshes the UI
  void _updateArrival(Location newLocation) {
    setState(() {
      arrival = newLocation;
    });
  }

  // Updates the departure date and refreshes the UI
  void _updateDepartureDate(DateTime newDate) {
    setState(() {
      departureDate = newDate;
    });
  }

  // Updates the number of requested seats and refreshes the UI
  void _updateSeats(int newSeats) {
    setState(() {
      requestedSeats = newSeats;
    });
  }

  // Swaps the departure and arrival locations
  void _switchLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  // Handles the search button press, validates input, and navigates to the results screen
  void _onSearchPressed() {
    if (departure != null && arrival != null) {
      // Create a RidePref object with the selected data
      RidePref ridePref = RidePref(
        departure: departure!,
        arrival: arrival!,
        departureDate: departureDate,
        requestedSeats: requestedSeats,
      );

      // Navigate to the RidesScreen with the selected ride preferences
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RidesScreen(
            ridePref: ridePref,
            rides: fakeRides, // Passes dummy ride data
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main form container with padding
        Container(
          padding: const EdgeInsets.all(BlaSpacings.m),
          margin: const EdgeInsets.symmetric(horizontal: BlaSpacings.m),
          child: Column(
            children: [
              // Departure Location Picker with Swap Button
              Stack(
                children: [
                  // Departure location selection
                  LocationPicker(
                    label: "Departure",
                    initialLocation: departure,
                    onLocationSelected: _updateDeparture,
                  ),
                  // Swap button to switch departure and arrival
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

              // Date Picker for selecting the ride date
              DatePicker(
                initialDate: departureDate,
                onDateSelected: _updateDepartureDate,
              ),
              Divider(color: BlaColors.greyLight, thickness: 1),

              // Seat Picker for selecting the number of passengers
              SeatNumberSpinner(
                initialValue: requestedSeats,
                onChanged: _updateSeats,
              ),
            ],
          ),
        ),

        // Search Button to submit the form
        SizedBox(
          width: double.infinity, // Makes the button full-width
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: BlaSpacings.m),
            child: BlaButton(
              text: "Search",
              onPressed: _onSearchPressed,
              isPrimary: true,
            ),
          ),
        ),
      ],
    );
  }
}
