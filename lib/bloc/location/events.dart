part of 'bloc_location.dart';

abstract class EventBlocLocation {}
class EventLocationFetch extends EventBlocLocation{
  final String? name;
  EventLocationFetch(this.name);
}

class EventLocationNextPage extends EventBlocLocation{
  final String? name;
  EventLocationNextPage(this.name);
}
