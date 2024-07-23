import '../librearies.dart';

class CompTextField {
  static final themeChangerViewModel = Provider.of<ThemeChangerViewModel>(
      navigatorKey.currentContext!,
      listen: false);
  static email(
      {FocusNode? focusNode,
      TextEditingController? controller,
      FocusNode? nextFocusNode}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 50,
        child: TextField(
          cursorColor: themeChangerViewModel.getSecondaryColor,
          maxLength: 20,
          focusNode: focusNode,
          style: TextStyle(
              color: themeChangerViewModel.whiteColor,
              fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
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
              hintText: "Enter email",
              hintStyle: TextStyle(color: themeChangerViewModel.getGreyColor),
              prefixIcon: Icon(
                Icons.mail,
                color: themeChangerViewModel.getSecondaryColor,
              )),
          onSubmitted: (val) {
            CompFunctions.fieldFocusChange(
                currentFocusNode: focusNode ?? FocusNode(),
                nextFocusNode: nextFocusNode ?? FocusNode());
          },
          controller: controller,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }

  static password(
      {FocusNode? focusNode,
      TextEditingController? controller,
      FocusNode? nextFocusNode,
      required ValueNotifier<bool> obscurePassword}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 50,
        child: ValueListenableBuilder(
            valueListenable: obscurePassword,
            builder: (context, value, child) {
              return TextFormField(
                onFieldSubmitted: (va) {
                  CompFunctions.fieldFocusChange(
                      currentFocusNode: focusNode ?? FocusNode(),
                      nextFocusNode: nextFocusNode ?? FocusNode());
                },
                obscureText: obscurePassword.value,
                obscuringCharacter: "*",
                cursorColor: themeChangerViewModel.getSecondaryColor,
                maxLength: 20,
                focusNode: focusNode,
                style: TextStyle(
                    color: themeChangerViewModel.whiteColor,
                    fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall)),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    counterText: "",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: themeChangerViewModel.getSecondaryColor,
                          width: 1),
                    ),
                    filled: true,
                    fillColor: themeChangerViewModel.lightColor,
                    hintText: "Enter password",
                    hintStyle:
                        TextStyle(color: themeChangerViewModel.getGreyColor),
                    prefixIcon: Icon(
                      Icons.key,
                      color: themeChangerViewModel.getSecondaryColor,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        obscurePassword.value = !obscurePassword.value;
                      },
                      child: Icon(
                        obscurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        color: themeChangerViewModel.getSecondaryColor,
                      ),
                    )),
                controller: controller,
                keyboardType: TextInputType.emailAddress,
              );
            }),
      ),
    );
  }

  static mobile(
      {TextEditingController? controller,
      FocusNode? focusNode,
      FocusNode? nextFocusNode,
      ValueChanged<PhoneNumber>? onChange}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 50,
        child: IntlPhoneField(
          autovalidateMode: AutovalidateMode.disabled,
          dropdownIcon: Icon(
            Icons.arrow_drop_down,
            color: themeChangerViewModel.getSecondaryColor,
          ),
          cursorColor: themeChangerViewModel.getSecondaryColor,
          controller: controller,
          onSubmitted: (val) {
            CompFunctions.fieldFocusChange(
                currentFocusNode: focusNode ?? FocusNode(),
                nextFocusNode: nextFocusNode ?? FocusNode());
          },
          showCountryFlag: false,
          disableLengthCheck: false,
          focusNode: focusNode,
          style: TextStyle(
            fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall),
            color: themeChangerViewModel.getWhiteColor,
          ),
          dropdownTextStyle: TextStyle(
            color: themeChangerViewModel.getWhiteColor,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: themeChangerViewModel.getSecondaryColor, width: 1),
            ),
            fillColor: themeChangerViewModel.lightColor,
            filled: true,
            contentPadding: const EdgeInsets.all(0),
            isDense: true,
            errorBorder: InputBorder.none,
            errorText: null,
            hintText: "Enter mobile number",
            hintStyle: TextStyle(
              color: themeChangerViewModel.getGreyColor,
            ),
            counterText: "",
            errorStyle: const TextStyle(),
          ),
          initialCountryCode: 'IN',
          onChanged: onChange,
        ),
      ),
    );
  }

  static text(
      {FocusNode? focusNode,
      String hint = "here",
      IconData prefixIcon = Icons.text_fields_rounded,
      ValueChanged<String>? onChanged,
      TextEditingController? controller,
      FocusNode? nextFocusNode}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 50,
        child: TextField(
          cursorColor: themeChangerViewModel.getSecondaryColor,
          maxLength: 20,
          focusNode: focusNode,
          style: TextStyle(
              color: themeChangerViewModel.whiteColor,
              fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
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
            hintText: "Enter $hint",
            hintStyle: TextStyle(color: themeChangerViewModel.getGreyColor),
            prefixIcon: Icon(
              prefixIcon,
              color: themeChangerViewModel.getSecondaryColor,
            ),
          ),
          onChanged: onChanged,
          onSubmitted: (val) {
            CompFunctions.fieldFocusChange(
                currentFocusNode: focusNode ?? FocusNode(),
                nextFocusNode: nextFocusNode ?? FocusNode());
          },
          controller: controller,
          keyboardType: TextInputType.emailAddress,
        ),
      ),
    );
  }

  static address(
      {FocusNode? focusNode,
      TextEditingController? controller,
      FocusNode? nextFocusNode,
      ValueChanged<String>? onChanged,
      String hint = "Enter address here",
      FormFieldValidator? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 100,
        child: TextFormField(
          cursorColor: themeChangerViewModel.getSecondaryColor,
          maxLength: 150,
          focusNode: focusNode,
          style: TextStyle(
              color: themeChangerViewModel.whiteColor,
              fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall)),
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.all(Constants.defaultPagePaddingHorizontally),
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
            hintText: hint,
            hintStyle: TextStyle(color: themeChangerViewModel.getGreyColor),
          ),
          onChanged: onChanged,
          validator: validator,
          onFieldSubmitted: (val) {
            CompFunctions.fieldFocusChange(
                currentFocusNode: focusNode ?? FocusNode(),
                nextFocusNode: nextFocusNode ?? FocusNode());
          },
          controller: controller,
          maxLines: null,
          expands: true,
          keyboardType: TextInputType.multiline,
        ),
      ),
    );
  }

  static search(
      {required Function(String) onChange,
      TextEditingController? controller,
      required String title}) {
    return Row(
      children: [
        Headings.whiteTextStyle(
            title: title,
            enumFontSize: EnumFontSize.small,
            fw: FontWeight.normal),
        MasterSpacer.w.fifty(),
        Expanded(
          child: AnimatedSearchBar(
            labelStyle: TextStyle(color: themeChangerViewModel.getWhiteColor),
            searchIcon: Icon(
              Icons.search,
              color: themeChangerViewModel.whiteColor,
            ),
            height: 35,
            controller: controller,
            cursorColor: themeChangerViewModel.getSecondaryColor,
            searchDecoration: InputDecoration(
              filled: true,
              fillColor: themeChangerViewModel.lightColor,
              hintText: "Search here",
              hintStyle: TextStyle(color: themeChangerViewModel.getGreyColor),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: themeChangerViewModel.getSecondaryColor, width: 1),
              ),
            ),
            searchStyle: TextStyle(
                color: themeChangerViewModel.getWhiteColor,
                fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall)),
            closeIcon: Icon(
              Icons.close,
              color: themeChangerViewModel.getWhiteColor,
            ),
            onChanged: onChange,
          ),
        ),
      ],
    );
  }

  static amount(
      {FocusNode? focusNode,
      TextEditingController? controller,
      FocusNode? nextFocusNode,
      suffixVisible = true,
      TextAlign textAlign = TextAlign.left,
      String hint = "Enter amount",
      GestureTapCallback? onSuffixTap,
      ValueChanged<String>? onChange,
      bool enable = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 50,
        child: TextField(
          enabled: enable,
          textAlign: textAlign,
          cursorColor: themeChangerViewModel.getSecondaryColor,
          maxLength: 20,
          focusNode: focusNode,
          style: TextStyle(
              color: themeChangerViewModel.whiteColor,
              fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
              fillColor: enable
                  ? themeChangerViewModel.getGreyColor.withOpacity(0.2)
                  : themeChangerViewModel.getGreyColor.withOpacity(0.08),
              hintText: hint,
              hintStyle: TextStyle(color: themeChangerViewModel.getGreyColor),
              suffix: Visibility(
                visible: suffixVisible,
                child: InkWell(
                  onTap: onSuffixTap,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Headings.secondaryTextStyle(
                        title: "MAX",
                        enumFontSize: EnumFontSize.extraSmall,
                        align: TextAlign.center),
                  ),
                ),
              )),
          onChanged: onChange,
          onSubmitted: (val) {
            CompFunctions.fieldFocusChange(
                currentFocusNode: focusNode ?? FocusNode(),
                nextFocusNode: nextFocusNode ?? FocusNode());
          },
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            // FilteringTextInputFormatter.allow(RegExp(r"^[0-9.]{1,10}$")),
            TextInputFormatter.withFunction((oldValue, newValue) {
              final text = newValue.text;

              // Regular expression to match only decimal digits and a single period (.)
              final validInput = RegExp(r'^\d{0,8}(\.\d{0,4})?$');

              if (text.isEmpty || validInput.hasMatch(text)) {
                return newValue;
              } else {
                // Check if the old value is empty or matches the valid input pattern
                if (oldValue.text.isEmpty ||
                    validInput.hasMatch(oldValue.text)) {
                  // Revert to the old value if it's valid
                  return oldValue;
                } else {
                  // If the old value is also invalid, allow backspace by returning an empty string
                  return TextEditingValue.empty;
                }
              }
            }),
          ],
        ),
      ),
    );
  }

  static number({
    FocusNode? focusNode,
    TextEditingController? controller,
    FocusNode? nextFocusNode,
    String hint = "Enter here",
    int maxLength = 6,
    ValueChanged<String>? onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 50,
        child: TextField(
          // textAlign: TextAlign.right,
          cursorColor: themeChangerViewModel.getSecondaryColor,
          maxLength: maxLength,
          focusNode: focusNode,
          style: TextStyle(
              color: themeChangerViewModel.whiteColor,
              fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
            hintText: hint,
            hintStyle: TextStyle(color: themeChangerViewModel.getGreyColor),
          ),
          onChanged: onChanged,
          onSubmitted: (val) {
            CompFunctions.fieldFocusChange(
                currentFocusNode: focusNode ?? FocusNode(),
                nextFocusNode: nextFocusNode ?? FocusNode());
          },
          controller: controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            // FilteringTextInputFormatter.allow(RegExp(r"^[0-9.]{1,10}$")),
            TextInputFormatter.withFunction((oldValue, newValue) {
              final text = newValue.text;

              // Regular expression to match only decimal digits and a single period (.)
              final validInput = RegExp(r"^[0-9]+$");

              if (text.isEmpty || validInput.hasMatch(text)) {
                return newValue;
              } else {
                // Check if the old value is empty or matches the valid input pattern
                if (oldValue.text.isEmpty ||
                    validInput.hasMatch(oldValue.text)) {
                  // Revert to the old value if it's valid
                  return oldValue;
                } else {
                  // If the old value is also invalid, allow backspace by returning an empty string
                  return TextEditingValue.empty;
                }
              }
            }),
          ],
        ),
      ),
    );
  }

  static scan(
      {FocusNode? focusNode,
      required TextEditingController controller,
      FocusNode? nextFocusNode,
      GestureTapCallback? onSuffixTap,
      String hint = "Enter here",
      ValueChanged<String>? onChanged,
      Function? call,
      bool isSuffix = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: SizedBox(
        height: 50,
        child: TextField(
          // textAlign: TextAlign.right,
          cursorColor: themeChangerViewModel.getSecondaryColor,
          maxLength: 40,
          focusNode: focusNode,
          style: TextStyle(
              color: themeChangerViewModel.whiteColor,
              fontSize: MyFontSize.getFontSize(EnumFontSize.extraSmall)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
              hintText: hint,
              hintStyle: TextStyle(color: themeChangerViewModel.getGreyColor),
              suffixIcon: isSuffix
                  ? InkWell(
                      onTap: () async {
                        await Navigator.push(
                          navigatorKey.currentContext!,
                          PageTransition(
                            child: ScannerScreen(
                              textEditingController: controller,
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                        if (call != null) {
                          call();
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Icon(
                          Icons.qr_code,
                          color: themeChangerViewModel.getSecondaryColor,
                        ),
                      ),
                    )
                  : null),

          onSubmitted: (val) {
            CompFunctions.fieldFocusChange(
                currentFocusNode: focusNode ?? FocusNode(),
                nextFocusNode: nextFocusNode ?? FocusNode());
          },
          onChanged: onChanged,
          controller: controller,
          keyboardType: TextInputType.text,
        ),
      ),
    );
  }
}
