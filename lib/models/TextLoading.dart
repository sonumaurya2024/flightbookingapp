class TextLoading{
  EnumAddressLoading? enumAddressLoading;
  String error = "";
  TextLoading({required this.enumAddressLoading,required this.error});
}


enum EnumAddressLoading{
  approving,
  error,
  none,
  verify
}