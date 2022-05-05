class CalenderModel
{
  Calender? data;

  CalenderModel.fromJson(Map<String, dynamic> json)
  {
    data = Calender.fromJson(json['data']??0);
  }
}

class Calender {
  List<DataCalender> data = [];
  String? status;

  Calender({required this.data, this.status});

  Calender.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataCalender>[];
      json['data'].forEach((v) {
        data.add(new DataCalender.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class DataCalender {
  int? id;
  String? startTime;
  String? endTime;
  String? notes;
  String? subject;
  int? deleteStatus;
  int ? user_id;

  DataCalender(
      {this.id,
        this.startTime,
        this.endTime,
        this.notes,
        this.subject,
        this.deleteStatus,
        this.user_id
      });

  DataCalender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    notes = json['notes'];
    subject = json['subject'];
    deleteStatus = json['delete_status'];
    user_id = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['notes'] = this.notes;
    data['subject'] = this.subject;
    data['delete_status'] = this.deleteStatus;
    data['user_id'] = this.user_id;
    return data;
  }
}