import 'dart:async';

import '../../../librearies.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  late ThemeChangerViewModel themeChangerViewModel;

  TextEditingController con1 = TextEditingController();
  TextEditingController con2 = TextEditingController();
  TextEditingController con3 = TextEditingController();
  TextEditingController con4 = TextEditingController();

  FocusNode foc1 = FocusNode();
  FocusNode foc2 = FocusNode();
  FocusNode foc3 = FocusNode();
  FocusNode foc4 = FocusNode();

  Timer? timer;
  int timerValue = 59;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
        navigatorKey.currentContext!,
        listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerValue = 59 - (timer.tick);
      if (timerValue <= 0) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreen(
      isBottomShape: true,
      removePaddings: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Constants.defaultPagePaddingHorizontally),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              CompImage.showAsset(
                path: "assets/common/images/otp.png",
              ),
              MasterSpacer.h.fifty(),
              Headings.whiteTextStyle(
                  title: 'OTP has been sent to',
                  align: TextAlign.center,
                  enumFontSize: EnumFontSize.extraLarge),
              MasterSpacer.h.ten(),
              Headings.whiteTextStyle(
                title: widget.email,
                align: TextAlign.center,
              ),
              MasterSpacer.h.fifty(),
              otpTextFields(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              InkWell(
                onTap: timerValue <= 0
                    ? () {
                        timerValue = 0;
                        setState(() {});
                        startTimer();
                        CompDialog.showToast(
                            context: context,
                            msg: "OTP send to your email ${widget.email}");
                        // otpViewModel.setLoading(true);
                      }
                    : null,
                child: Headings.whiteTextStyle(
                    title:
                        timerValue <= 0 ? "Resend OTP" : "$timerValue sec left",
                    enumFontSize: EnumFontSize.small),
              ),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              MasterSpacer.h.ten(),
              CompButton(
                  title: "Confirm",
                  onPress: () {
                    checkFieldIsEmpty();
                  })
            ],
          ),
        ),
      ),
    );
  }

  otpTextFields() {
    return Row(
      children: [
        Expanded(
          child: otpTextField(con1, foc1),
        ),
        MasterSpacer.w.ten(),
        Expanded(
          child: otpTextField(con2, foc2),
        ),
        MasterSpacer.w.ten(),
        Expanded(child: otpTextField(con3, foc3)),
        MasterSpacer.w.ten(),
        Expanded(child: otpTextField(con4, foc4)),
      ],
    );
  }

  otpTextField(TextEditingController con, FocusNode foc) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: TextField(
        cursorColor: themeChangerViewModel.getSecondaryColor,
        maxLength: 1,
        focusNode: foc,
        style: TextStyle(
          color: themeChangerViewModel.whiteColor,
          fontSize: MyFontSize.getFontSize(EnumFontSize.extraLarge),
        ),
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 30),
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: themeChangerViewModel.getSecondaryColor, width: 1),
          ),
          filled: true,
          fillColor: themeChangerViewModel.lightColor,
          hintStyle: TextStyle(color: themeChangerViewModel.getGreyColor),
        ),
        onChanged: (val) {
          checkFieldIsEmpty();
        },
        controller: con,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
      ),
    );
  }

  void checkFieldIsEmpty() async {
    if (con1.text.isEmpty) {
      CompFunctions.setFieldFocus(nextFocus: foc1);
    } else if (con2.text.isEmpty) {
      CompFunctions.setFieldFocus(nextFocus: foc2);
    } else if (con3.text.isEmpty) {
      CompFunctions.setFieldFocus(nextFocus: foc3);
    } else if (con4.text.isEmpty) {
      CompFunctions.setFieldFocus(nextFocus: foc4);
    } else {
      CompFunctions.unFocus();
      String otp = con1.text + con2.text + con3.text + con4.text;
      String serverOtp = "1234";
      mDebugPrint(otp);

      if (serverOtp == otp) {
        Navigator.pop(context, "Verify");
      } else {
        CompDialog.showToast(context: context, msg: "Wrong OTP");
      }
    }
  }
}
