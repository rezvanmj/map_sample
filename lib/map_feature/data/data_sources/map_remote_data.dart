class MapRemoteData {
  // Future<dynamic> editProfile(Map<String, dynamic> data) async {
  //   Response res =
  //       await ApiProvider().put('${baseUrl}user/profile', data: data);
  //   return res;
  // }
  //
  // Future<dynamic> updateProfile(Map<String, dynamic> data) async {
  //   Response res =
  //       await ApiProvider().patch('${baseUrl}user/profile', data: data);
  //   return res;
  // }
  //
  // Future<dynamic> getDegrees(Map<String, dynamic> data) async {
  //   Response res =
  //       await ApiProvider().get('${baseUrl}entities/degrees', data: data);
  //   return res;
  // }
  //
  // Future<dynamic> getCountries(Map<String, dynamic> data) async {
  //   Response res =
  //       await ApiProvider().get('${baseUrl}entities/countries', data: data);
  //   return res;
  // }
  //
  // Future<dynamic> getStates(Map<String, dynamic> data) async {
  //   String countryId = data['country_id'];
  //   Response res = await ApiProvider()
  //       .get('${baseUrl}entities/countries/${countryId}/states', data: data);
  //   return res;
  // }
  //
  // Future<dynamic> getCities(Map<String, dynamic> data) async {
  //   String countryId = data['country_id'];
  //   String stateId = data['state_id'];
  //   Response res = await ApiProvider().get(
  //       '${baseUrl}entities/countries/${countryId}/states/${stateId}/cities',
  //       data: data);
  //   return res;
  // }
  //
  // Future<dynamic> getPositions(Map<String, dynamic> data) async {
  //   if (data.isEmpty) {
  //     Response res = await ApiProvider().get('${baseUrl}entities/jobs');
  //     return res;
  //   } else {
  //     String query = data['query'];
  //     String page = data['page'].toString();
  //     Response res = await ApiProvider()
  //         .get('${baseUrl}entities/jobs?title=$query&page=$page&limit=50');
  //     return res;
  //   }
  // }
  //
  // Future<dynamic> getStudyFields(Map<String, dynamic> data) async {
  //   Response res =
  //       await ApiProvider().get('${baseUrl}entities/fields-of-study');
  //   return res;
  // }
  //
  // Future<dynamic> getContactInfo(Map<String, dynamic> data) async {
  //   Response res = await ApiProvider().get('${baseUrl}user/contact-methods');
  //   return res;
  // }
  //
  // Future<dynamic> deleteCertificate(Map<String, dynamic> data) async {
  //   String certId = data['id'];
  //   Response res = await ApiProvider()
  //       .delete('${baseUrl}user/profile/certificate/${certId}');
  //   return res;
  // }
  //
  // Future<dynamic> deleteEducation(Map<String, dynamic> data) async {
  //   String educationId = data['id'];
  //   Response res = await ApiProvider()
  //       .delete('${baseUrl}user/profile/education/${educationId}');
  //   return res;
  // }
  //
  // Future<dynamic> editCertificate(Map<String, dynamic> data) async {
  //   String certId = data['id'];
  //   Map<String, dynamic> editedCertification = data['map'];
  //   Response res = await ApiProvider().put(
  //       '${baseUrl}user/profile/certificate/${certId}',
  //       data: editedCertification);
  //   return res;
  // }
  //
  // Future<dynamic> editEducation(Map<String, dynamic> data) async {
  //   String educationId = data['id'];
  //   Map<String, dynamic> editedEducation = data['map'];
  //   Response res = await ApiProvider().put(
  //       '${baseUrl}user/profile/education/${educationId}',
  //       data: editedEducation);
  //   return res;
  // }
}
