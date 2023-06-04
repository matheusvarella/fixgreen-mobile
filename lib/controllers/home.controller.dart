import 'package:fixgreen/models/truck.model.dart';
import 'package:fixgreen/repositories/truck.repository.dart';
import 'package:mobx/mobx.dart';

abstract class HomeController with Store {
  @observable
  bool showSearch = false;

  @observable
  ObservableList<TruckModel> trucks = new ObservableList<TruckModel>();

  @action
  toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  search(String term) async {
    final repository = new TruckRepository();
    trucks = new ObservableList<TruckModel>();
    dynamic data = await repository.search(term);
    trucks.addAll(data);
  }
}