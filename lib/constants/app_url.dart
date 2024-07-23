class AppUrl{
  static var  otpUrl = "https://photonexact2021.photonex.io/";

  static var  baseUrl = "https://exp.laxman.info/";

  static var  imageBaseUrl = "https://opscan.live";

  static var  transactionBaseUrl = "https://apilist.tronscanapi.com/";

  //auth
  static var  registerApiUrl = "${baseUrl}api/Login/UserInsert";
  static var  userValidationUrl = "${baseUrl}api/Login/UserValidation";
  static var  userInsertOTPUrl = "${baseUrl}api/Login/UserInsertOTP";
  static var  userInsertUrl = "${baseUrl}api/Login/UserInsert";
  static var  userGetLoginUrl = "${baseUrl}api/Login/UserGetLogin";
  static var  userGetUrl = "${baseUrl}api/Login/UserGet";
  static var  userKYCGetUrl = "${baseUrl}api/Login/UserKycGet";
  static var  setAccountStatusUrl = "${baseUrl}api/Login/SetAccountStatus";
  static var  userForgetPasswordUrl = "${baseUrl}api/Login/UserForgetPassword";
  static var  userGetByAddressUrl = "${baseUrl}api/Login/UserGetByAddress";
  static var  transactionOTPUrl = "${baseUrl}api/Login/TransactionOTP";
  static var  userKycInsertUrl = "${baseUrl}api/Login/UserKycInsert";
  static var  userPicUpdateUrl = "${baseUrl}api/Login/UserPicUpdate";
  static var  userNikNameUpdateUrl = "${baseUrl}api/Login/UserNikNameUpdate";

  //market
  static var  getMarketListUrl = "${baseUrl}api/MarketList/GetMarketList";

  // CryptoWallet
  static var  appUserGetWalletUrl = "${baseUrl}api/CryptoWallet/AppUserGetWallet";
  static var  userGetNetworkTypeUrl = "${baseUrl}api/CryptoWallet/UserGetNetworkType";
  static var  appGetCurrencyUrl = "${baseUrl}api/CryptoWallet/AppGetCurrency";
  static var  userGetCryptoAddressUrl = "${baseUrl}api/CryptoWallet/UserGetCryptoAddress";

  //GetBanner
  static var  getBannerUrl = "${baseUrl}api/GetBanner/GetBanner";

  //GetNews
  static var  getNewsUrl = "${baseUrl}api/News/GetNews";

  //Transfer
  static var  appTransferWalletUrl = "${baseUrl}api/Transfer/AppTransferWallet";

  //Withdrawal
  static var  appWithdrawWalletBySystemUrl = "${baseUrl}api/Withdrawal/AppWithdrawWalletBySystem";
  static var  appWithdrawWalletByCryptoUrl = "${baseUrl}api/Withdrawal/AppWithdrawWalletByCrypto";
  static var  withdrawPreInfoUrl = "${baseUrl}api/Withdrawal/WithdrawPreInfo";

  //TransactionHistory
  static var  spotHistoryGetUrl = "${baseUrl}api/TransactionHistory/SpotHistoryGet";
  static var  fundHistoryGetUrl = "${baseUrl}api/TransactionHistory/FundHistoryGet";


  //imageUploadUrl
  static var  imageUploadUrl = "https://api.cloudflare.com/client/v4/accounts/279d08d35986fc95bef69b1bd213a33d/images/v1";

  //swap
  static var swapCurrencyPrimaryUrl = "${baseUrl}api/Swap/SwapCurrencyPrimary";
  static var swapCurrencySecondaryUrl = "${baseUrl}api/Swap/SwapCurrencySecondry";
  static var swapGetCoinBalanceUrl = "${baseUrl}api/Swap/SwapGetCoinBalance";
  static var swapUserInsertUrl = "${baseUrl}api/Swap/SwapUserInsert";

  //Staking
  static var stakingMasterAllUrl = "${baseUrl}api/Staking/StakingMasterAll";
  static var  stakingInsertUrl = "${baseUrl}api/Staking/StakingInsert";
  static var  stakingUserUrl = "${baseUrl}api/Staking/StakingUserGetAll";
  static var  stakingUserRedeemUrl = "${baseUrl}api/Staking/StakingUserRedeem";

  //Devices
  static var  appUserLoginHistoryGetUrl = "${baseUrl}api/Login/AppUserLoginHistoryGet";
  static var  userLoginHistoryInsertUrl = "${baseUrl}api/Login/UserLoginHistoryInsert";
  static var  appUserLogoutUrl = "${baseUrl}api/Login/AppUserLogout";

}