class ResultModel {
  final int Status;
  final String Message;
  ResultModel({
    required this.Status,
    required this.Message,
  });

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      Status: map['Status'],
      Message: map['Message'].toString(),
    );
  }
}
