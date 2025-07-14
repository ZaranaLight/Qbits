import 'package:qbits/apis/plant_apis.dart';
import 'package:qbits/qbits.dart';

class PlantProvider extends ChangeNotifier {
  PlantProvider() {
    init();
  }

  Future<void> init() async {
    await getPlantListAPI(showLoader: true, resetData: true);
  }

  AppResponse<PlanListResponseModel>? paginationModel;

  List<PlanListResponseModel> get planListResponse =>
      paginationModel?.list ?? [];

  int currentPage = 0;

  int pageSize = 5;

  bool get hasMoreData =>
      (paginationModel?.count ?? 0) > (paginationModel?.list?.length ?? 0);

  bool isApiCalling = false;

  bool loader = false;

  String? _selectedTitle;

  String? get selectedTitle => _selectedTitle;

  String? selectedPowerKW;

  String? selectedTotalKWh;

  bool followedPlantSelected = false;

  String? _selectedRank;

  String? get selectedRank => _selectedRank;
  bool? isAscending;

  void select(String title) {
    _selectedTitle = title;
    navigatorKey.currentState?.context.navigator.pop();
    notifyListeners();
  }

  bool isSelected(String title) => _selectedTitle == title;

  void selectPowerKW(String value) {
    selectedPowerKW = value;
    notifyListeners();
  }

  void selectTotalKWh(String value) {
    selectedTotalKWh = value;
    notifyListeners();
  }

  void toggleFollowedPlant() {
    followedPlantSelected = !followedPlantSelected;
    notifyListeners();
  }

  void selectRank(String title, bool ascending) {
    _selectedRank = '$title ${ascending ? "↑" : "↓"}';
    isAscending = ascending;
    navigatorKey.currentState?.context.navigator.pop();
    notifyListeners();
  }

  bool get hasSelectedRank => _selectedRank != null;

  bool isRankSelected(String rank, bool ascending) {
    final current = '$rank ${ascending ? "↑" : "↓"}';
    return _selectedRank == current;
  }

  Future<void> getPlantListAPI({
    bool showLoader = false,
    bool resetData = false,
  }) async {
    if (isApiCalling) return;
    isApiCalling = true;

    if (showLoader) {
      loader = true;
    }

    if (resetData) {
      currentPage = 0;
      paginationModel = null;
    }

    final model = await PlantApis.getPlantListAPI(
      page: currentPage.toString(),
      pageSize: pageSize.toString(),
    );

    if (model != null) {
      if (resetData || paginationModel == null) {
        paginationModel = model.copyWith();
      } else {
        final existingIds =
            paginationModel?.list?.map((e) => e.plantInfo?.id).toSet() ?? {};
        final newItems =
            (model.list ?? [])
                .where((e) => !existingIds.contains(e.plantInfo?.id))
                .toList();

        paginationModel = paginationModel?.copyWith(
          list: [...(paginationModel?.list ?? []), ...newItems],
        );
      }

      currentPage++;
    }
    await Future.delayed(1.seconds);
    loader = false;
    isApiCalling = false;
    notifyListeners();
  }
}
