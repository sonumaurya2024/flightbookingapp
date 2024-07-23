// import 'package:quiz_master/components/bottom_sheet.dart';
//
// import '../../../librearies.dart';
//
// class TestDashboardScreen extends StatelessWidget {
//   TestDashboardScreen({super.key});
//
//   final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
//       navigatorKey.currentContext!,
//       listen: false);
//
//   ScreenshotController screenshotController = ScreenshotController();
//
//   @override
//   Widget build(BuildContext context) {
//     return CommonScreen(
//         appBar:
//             CompAppBar.titleBar(title: "Dashboard", isBackButtonVisible: false),
//         refreshCallback: () async {
//           setLoadingComp();
//         },
//         child: loadingState(context));
//   }
//
//   loadingState(context) {
//     return Consumer<ThemeChangerViewModel>(
//       builder: (context, value, child) {
//         if (value.getDemoLoading.status == Status.LOADING) {
//           return ApiResponseView.loading();
//         } else if (value.getDemoLoading.status == Status.COMPLETED) {
//           return page(context);
//         } else if (value.getDemoLoading.status == Status.ERROR) {
//           return ApiResponseView.serverError(msg: value.getDemoLoading.message);
//         } else {
//           return ApiResponseView.serverError(msg: "Something went wrong");
//         }
//       },
//     );
//   }
//
//   page(context) {
//     return SingleChildScrollView(
//       child: Screenshot(
//         controller: screenshotController,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             MasterSpacer.h.ten(),
//             MasterSpacer.h.ten(),
//             getMenu(
//               widget: CompButton(
//                   title: "Loading",
//                   onPress: () async {
//                     setLoadingComp();
//                   }),
//             ),
//             getMenu(
//               title: "ApiResponseView.error",
//               widget: ApiResponseView.error(msg: "Error"),
//             ),
//             getMenu(
//               title: "ApiResponseView.noDataFound",
//               widget: ApiResponseView.noDataFound(msg: "No data found"),
//             ),
//             getMenu(
//               title: "ApiResponseView.serverError",
//               widget: ApiResponseView.serverError(msg: "No data found"),
//             ),
//             getMenu(
//               widget: CompButton(
//                   title: "Show Toast",
//                   onPress: () async {
//                     CompDialog.showToast(context: context, msg: "hellow");
//                   }),
//             ),
//             getMenu(
//               widget: CompButton(
//                   title: "Show showReCheck",
//                   onPress: () async {
//                     CompDialog.showReCheck(
//                       msg: "hellow",
//                     );
//                   }),
//             ),
//             getMenu(
//               title: "CompTextField.text",
//               widget: CompTextField.text(),
//             ),
//             getMenu(
//               title: "CompTextField.amount",
//               widget: CompTextField.amount(),
//             ),
//             getMenu(
//               title: "CompTextField.address",
//               widget: CompTextField.address(),
//             ),
//             getMenu(
//               title: "CompTextField.number",
//               widget: CompTextField.number(),
//             ),
//             getMenu(
//               title: "CompTextField.mobile",
//               widget: CompTextField.mobile(),
//             ),
//             getMenu(
//               title: "CompTextField.email",
//               widget: CompTextField.email(),
//             ),
//             getMenu(
//               title: "CompTextField.search",
//               widget: CompTextField.search(onChange: (val) {}, title: "Search"),
//             ),
//             getMenu(
//               title: "CompTextField.scan",
//               widget: CompTextField.scan(controller: TextEditingController()),
//             ),
//             getMenu(
//               title: "CompTextField.password",
//               widget:
//                   CompTextField.password(obscurePassword: ValueNotifier(false)),
//             ),
//             getMenu(
//               widget: CompButton(
//                   title: "get image from gallery",
//                   onPress: () async {
//                     CompFunctions.getImageFromGallery().then((value) {
//                       mDebugPrintResponse(value?.path ?? "na");
//                     });
//                   }),
//             ),
//             // getMenu(
//             //   widget: CompButton(
//             //       title: "Screenshot and share",
//             //       onPress: () async {
//             //         CompFunctions.takeScreenshotAndShare(
//             //             screenshotController: screenshotController);
//             //       }),
//             // ),
//             getMenu(
//               widget: CompButton(
//                   title: "Get current location",
//                   onPress: () async {
//                     themeChangerViewModel.setDemoLoading(LoadingModel(
//                         status: Status.LOADING, message: "Waiting..."));
//                     CompFunctions.getUserLocation().then((value) {
//                       themeChangerViewModel.setDemoLoading(LoadingModel(
//                           status: Status.COMPLETED,
//                           message: "Get location successfully"));
//                       mDebugPrintResponse(value?.addressLine ?? "na");
//                       CompDialog.showToast(
//                         context: context,
//                         msg: value?.addressLine ?? "na",
//                       );
//                     });
//                   }),
//             ),
//             getMenu(
//               widget: CompButton(
//                   title: "Show Bottom success sheet",
//                   onPress: () async {
//                     CompBottomSheet.showWrapBottomDialog(
//                       child: Column(
//                         children: [
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           CompImage.showLottie(
//                               jsonPath: "assets/common/lottie/success.json",
//                               repeat: false),
//                           Headings.whiteTextStyle(
//                               title: "Success",
//                               enumFontSize: EnumFontSize.larger),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           CompButton(
//                               title: "Cancel",
//                               onPress: () {
//                                 Navigator.pop(context);
//                               })
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//             getMenu(
//               widget: CompButton(
//                   title: "Show Bottom failed sheet",
//                   onPress: () async {
//                     CompBottomSheet.showWrapBottomDialog(
//                       child: Column(
//                         children: [
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           CompImage.showLottie(
//                               jsonPath: "assets/common/lottie/error.json",
//                               repeat: false),
//                           Headings.whiteTextStyle(
//                               title: "Failed",
//                               enumFontSize: EnumFontSize.larger),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           CompButton(
//                               title: "Cancel",
//                               onPress: () {
//                                 Navigator.pop(context);
//                               })
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//             getMenu(
//               widget: CompButton(
//                   title: "Show Bottom processing sheet",
//                   onPress: () async {
//                     CompBottomSheet.showWrapBottomDialog(
//                       child: Column(
//                         children: [
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           CompImage.showLottie(
//                               jsonPath: "assets/common/lottie/processing.json",
//                               repeat: false),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           Headings.whiteTextStyle(
//                               title: "Waiting",
//                               enumFontSize: EnumFontSize.larger),
//                           Headings.whiteTextStyle(
//                               title: "for process compleate",
//                               enumFontSize: EnumFontSize.extraLarge),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           MasterSpacer.h.ten(),
//                           CompButton(
//                               title: "Cancel",
//                               onPress: () {
//                                 Navigator.pop(context);
//                               })
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   getMenu({required Widget widget, String? title}) {
//     return Column(
//       children: [
//         Divider(
//           color: themeChangerViewModel.getWhiteColor,
//         ),
//         Headings.whiteTextStyle(title: title ?? ""),
//         MasterSpacer.h.ten(),
//         widget,
//         Divider(
//           color: themeChangerViewModel.getWhiteColor,
//         ),
//       ],
//     );
//   }
//
//   void setLoadingComp() async {
//     themeChangerViewModel.setDemoLoading(
//         LoadingModel(status: Status.LOADING, message: "Waiting..."));
//     await CompFunctions.delay();
//     themeChangerViewModel.setDemoLoading(
//         LoadingModel(status: Status.COMPLETED, message: "Waiting..."));
//   }
// }
