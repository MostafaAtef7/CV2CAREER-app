class JobsModel {
  String? jobLinkHref;
  String? jobTitle;
  String? jobType;
  String? company;
  String? postedAt;
  String? experience;
  String? salary;
  String? jobCategory;
  String? education;
  String? skills;
  String? jobDescription;
  String? jobResponsibilities;
  String? jobRequirement;

  JobsModel({
    this.jobLinkHref,
    this.jobTitle,
    this.jobType,
    this.company,
    this.postedAt,
    this.experience,
    this.salary,
    this.jobCategory,
    this.education,
    this.skills,
    this.jobDescription,
    this.jobResponsibilities,
    this.jobRequirement,
  });

  factory JobsModel.fromJson(dynamic data) => JobsModel(
        jobLinkHref: data['job_link_href'] as String?,
        jobTitle: data['job_title'] as String?,
        jobType: data['job_type'] as String?,
        company: data['company'] as String?,
        postedAt: data['posted_at'] as String?,
        experience: data['experience'] as String?,
        salary: data['salary'] as String?,
        jobCategory: data['job_category'] as String?,
        education: data['education'] as String?,
        skills: data['skills'] as String?,
        jobDescription: data['job_description'] as String?,
        jobResponsibilities: data['job_responsibilities'] as String?,
        jobRequirement: data['job_requirement'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'job_link_href': jobLinkHref,
        'job_title': jobTitle,
        'job_type': jobType,
        'company': company,
        'posted_at': postedAt,
        'experience': experience,
        'salary': salary,
        'job_category': jobCategory,
        'education': education,
        'skills': skills,
        'job_description': jobDescription,
        'job_responsibilities': jobResponsibilities,
        'job_requirement': jobRequirement,
      };
}
