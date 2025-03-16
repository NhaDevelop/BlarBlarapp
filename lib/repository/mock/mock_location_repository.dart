import '../../model/ride/locations.dart';
import '../locations_repository.dart';

class MockLocationsRepository extends LocationsRepository {
  final List<Location> _getLocations = [
    Location(name: "Sr", country: Country.uk),
    Location(name: "pp", country: Country.uk),
    Location(name: "kompocham", country: Country.uk),
    Location(name: "kps", country: Country.uk),
    Location(name: "Kampot", country: Country.uk)
  ];

  @override
  List<Location> getLocations() {
    return _getLocations;
  }

  @override
  void addLocations(Location locations) {
    _getLocations.add(locations);
  }
}