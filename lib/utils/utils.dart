class Utils {
  static getActionValue(ActionType actionType) {
    switch (actionType) {
      case ActionType.SPOT:
        return 1;
      case ActionType.FUND:
        return 2;
      case ActionType.TRANSFER:
        return 1;
      case ActionType.WITHDRAWAL:
        return 2;
      case ActionType.SWAP:
        return 3;
      case ActionType.TRASE:
        return 4;
      case ActionType.P2P:
        return 5;
      default:
    }
  }

  static String getOtpString({required String method,required String coinName
    ,required String amount,required String address,required String walletType,}){
    return '''
    <h3>Your Transaction Details</h3>
      Method : $method<br>
      Currency : $coinName<br>
      Amount : $amount<br>
      ${'Address : $address<br>'}
      Via : $walletType<br><br>
      Your Otp is : 
      ''';
  }
}


enum ActionType { SPOT, FUND, TRANSFER, WITHDRAWAL, SWAP, TRASE, P2P }
