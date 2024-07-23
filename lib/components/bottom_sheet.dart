import '../librearies.dart';

class CompBottomSheet {
  static final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
      navigatorKey.currentContext!,
      listen: false);

  static showFixedBottomDialog(
      {required Widget child, required RefreshCallback? onRefresh}) {
    showModalBottomSheet(
        context: navigatorKey.currentContext!,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext context) {
          return Container(
            color: themeChangerViewModel.getPrimaryColor,
            height: MediaQuery.of(context).size.height / 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MasterSpacer.h.ten(),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.close,
                        color: themeChangerViewModel.getSecondaryColor,
                      )),
                ),
                Expanded(child: isRefresh(onRefresh, child)),
              ],
            ),
          );
        });
  }

  static showWrapBottomDialog({required Widget child}) {
    showModalBottomSheet(
        context: navigatorKey.currentContext!,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(15),
            color: themeChangerViewModel.getPrimaryColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Wrap(
                  children: [
                    MasterSpacer.h.ten(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            Icons.close,
                            color: themeChangerViewModel.getSecondaryColor,
                          )),
                    ),
                    child
                  ],
                ),
              ),
            ),
          );
        });
  }

  static isRefresh(onRefresh, child) {
    if (onRefresh != null) {
      return CompRefreshIndicator.show(
          onRefresh: onRefresh, child: page(child));
    } else {
      return page(child);
    }
  }

  static page(child) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Padding(padding: const EdgeInsets.all(15.0), child: child),
        ],
      ),
    );
  }
}
