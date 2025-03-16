import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/mock/mock_rides_repository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';


void main() {
  // 1. Initialize with mock repository
  RidesService.initialize(MockRidesRepository());

  // 2. Create preference
  final preference = RidePreference(
    departure: Location(name: "Battambang", country: Country.uk),
    arrival: Location(name: "Siem Reap", country: Country.uk),
    departureDate: DateTime.now(),
    requestedSeats: 1,
  );

  // 3. Get filtered and sorted rides
  final results = RidesService.instance.repository
      .getRides(
        preference,
        null,
        RideSortType.departureTimeAscending, // Add sorting
      )
      .where((ride) => ride.availableSeats >= preference.requestedSeats)
      .toList();

  // 4. Print header once
  print(
      'For your preference (${preference.departure.name} -> ${preference.arrival.name}, today ${preference.requestedSeats} passenger)');
  print('we found ${results.length} rides:');

  // 5. Print results
  for (final ride in results) {
    final duration = ride.arrivalDateTime.difference(ride.departureDate);
    print('- at ${DateTimeUtils.formatTime(ride.departureDate)} '
        '\twith ${ride.driver.firstName} '
        '(${duration.inHours} hours)');
  }
}