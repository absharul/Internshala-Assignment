// search_model.dart
class SearchInternshipModel {
  final Map<String, Internship> internshipsMeta;

  SearchInternshipModel({required this.internshipsMeta});

  factory SearchInternshipModel.fromJson(Map<String, dynamic> json) {
    var internshipsMetaJson = json['internships_meta'] as Map<String, dynamic>;
    Map<String, Internship> internshipsMeta = {};
    internshipsMetaJson.forEach((key, value) {
      internshipsMeta[key] = Internship.fromJson(value);
    });
    return SearchInternshipModel(internshipsMeta: internshipsMeta);
  }
}

class Internship {
  final String title;
  final String companyName;
  final String? companyLogo;
  final List<String> locationNames;
  final String startDate;
  final String companyUrl;
  final String duration;
  final String stipend;
  final String postedOn;

  Internship({
    required this.title,
    required this.companyName,
    this.companyLogo,
    required this.companyUrl,
    required this.locationNames,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.postedOn,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
      title: json['title'] as String,
      companyName: json['company_name'] as String,
      companyLogo: json['company_logo'] as String?,
      companyUrl: json['company_url'] ?? '',
      locationNames: List<String>.from(json['location_names'] as List<dynamic>),
      startDate: json['start_date'] as String,
      duration: json['duration'] as String,
      stipend: json['stipend'] != null ? json['stipend']['salary'] as String : 'Not disclosed',
      postedOn: json['posted_on'] as String,
    );
  }
}

