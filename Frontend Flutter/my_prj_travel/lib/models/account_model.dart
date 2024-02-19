class AccInfoModel {
  final int Status;
  final String? Email;
  final String? Password;
  final String? Token;
  final String? UserName;
  final int? AccountID;
  final String? Avatar;

  final String? Error;

  AccInfoModel(
      {this.Email,
      this.Password,
      this.Token,
      this.UserName,
      this.AccountID,
      this.Avatar,
      this.Error,
      required this.Status});

  // Chuyển dữ liệu Map thành đối tượng LoginModel
  factory AccInfoModel.fromMap(Map<String, dynamic> map) {
    final status = map['Status'];

    print("Data body from API : ${map['Message']}");

    if (status == 1) {
      return AccInfoModel(
        Status: map['Status'],
        Token: map['User']['Token'],
        AccountID: map['User']['AccountID'],
        UserName: map['User']['UserName'],
        Avatar: map['User']['Avatar'],
        Email: map['User']['Email'],
      );
    } else {
      return AccInfoModel(
        Status: map['Status'],
        Error: map['Message'].toString(),
      );
    }
  }
}
