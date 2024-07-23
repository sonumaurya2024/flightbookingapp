
class UserModel {
  String? UserKey;
  String? SponsorKey;
  String? ReferralKey;
  String? SpUsername;
  String? Username;
  int? UserRank;
  String? NickName;
  String? Name;
  String? Mobile;
  String? Email;
  String? CountryCode;
  String? Country;
  String? DOB;
  String? PicUrl;
  String? regDate;
  int? AccountStatus;
  int? KycStatus;
  String? Password;
  int? UserStatus;


  UserModel({this.UserKey,this.Username,this.AccountStatus,this.Email,this.KycStatus,this.Password,
    this.PicUrl,this.SponsorKey,this.ReferralKey,this.SpUsername,this.UserRank
  ,this.NickName,this.Name,this.Mobile,this.regDate,this.CountryCode,this.Country,this.DOB,
    this.UserStatus,});

  UserModel.fromJson(Map<String, dynamic> json) {
    UserKey = json['UserKey'];
    ReferralKey = json['ReferralKey'];
    SponsorKey = json['SponsorKey'];
    SpUsername = json['SpUsername'];
    Username = json['Username'];
    AccountStatus = json['AccountStatus'];
    Email = json['Email'];
    KycStatus = json['KycStatus'];
    Password = json['Password'];
    UserRank = json['UserRank'];
    PicUrl = json['PicUrl'];
    NickName = json['NickName'];
    Name = json['Name'];
    Mobile = json['Mobile'];
    regDate = json['regDate'];
    CountryCode = json['CountryCode'];
    Country = json['Country'];
    DOB = json['DOB'];
    UserStatus = json['UserStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserKey'] = this.UserKey;
    data['ReferralKey'] = this.ReferralKey;
    data['SponsorKey'] = this.SponsorKey;
    data['SpUsername'] = this.SpUsername;
    data['Username'] = this.Username;
    data['AccountStatus'] = this.AccountStatus;
    data['Email'] = this.Email;
    data['KycStatus'] = this.KycStatus;
    data['Password'] = this.Password;
    data['PicUrl'] = this.PicUrl;
    data['UserRank'] = this.UserRank;
    data['NickName'] = this.NickName;
    data['Name'] = this.Name;
    data['Mobile'] = this.Mobile;
    data['regDate'] = this.regDate;
    data['CountryCode'] = this.CountryCode;
    data['Country'] = this.Country;
    data['DOB'] = this.DOB;
    data['UserStatus'] = this.UserStatus;
    return data;
  }
}