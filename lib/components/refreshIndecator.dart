import '../librearies.dart';

class CompRefreshIndicator{
  static final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(navigatorKey.currentContext!,listen: false);
  static show({required Widget child,required RefreshCallback onRefresh}){
    return RefreshIndicator(
        backgroundColor: themeChangerViewModel.getWhiteColor,
        color: themeChangerViewModel.getPrimaryColor,
        onRefresh: onRefresh,
        child: child
    );
  }
}