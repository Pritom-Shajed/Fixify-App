class TechnicianHiringModel {
  String? technicianUid;
  String? customerUid;
  String? jobDescription;
  List<String>? serviceName;
  String? status;

  TechnicianHiringModel({
    this.technicianUid,
    this.customerUid,
    this.jobDescription,
    this.serviceName,
    this.status});

  TechnicianHiringModel.fromJson(Map<String, dynamic> json) {
    technicianUid = json['technician_uid'];
    customerUid = json['customer_uid'];
    jobDescription = json['job_description'];
    serviceName = json['service_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['technician_uid'] = technicianUid;
    data['customer_uid'] = customerUid;
    data['job_description'] = jobDescription;
    data['service_name'] = serviceName;
    data['status'] = status;
    return data;
  }
}