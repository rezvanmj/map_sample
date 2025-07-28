// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:global_validity/core/widgets/app_button.dart';
// import 'package:global_validity/features/edit_profile/data/models/field_of_study_model.dart';
// import 'package:global_validity/features/edit_profile/domain/entities/delete_response_entity.dart';
// import 'package:global_validity/features/edit_profile/domain/entities/field_of_study_entity.dart';
// import 'package:global_validity/features/edit_profile/presentation/manager/edit_profile_controller.dart';
//
// import '../../../../core/constants/strings.dart';
// import '../../../../core/exceptions/failure.dart';
// import '../../../../core/utils/utils.dart';
// import '../../../profile/data/models/education_model.dart';
// import '../../../profile/domain/entities/added_education_entity.dart';
// import '../../../profile/domain/use_cases/add_education_usecase.dart';
// import '../../data/models/degree_model.dart';
// import '../../data/models/position_model.dart';
// import '../../domain/entities/degree_entity.dart';
// import '../../domain/entities/position_entity.dart';
// import '../../domain/use_cases/delete_education_usecase.dart';
// import '../../domain/use_cases/edit_education_usecase.dart';
// import '../../domain/use_cases/get_degrees_usecase.dart';
// import '../../domain/use_cases/get_position_usecase.dart';
// import '../../domain/use_cases/get_study_fields_usecase.dart';
//
// class AddEducationController extends GetxController {
//   AddEducationUseCase addEducationUseCase;
//   GetDegreesUseCase getDegreesUseCase;
//   GetPositionsUseCase getPositionUseCase;
//   GetStudyFieldsUseCase getStudyFieldsUseCase;
//   EditEducationUseCase editEducationUseCase;
//   DeleteEducationUseCase deleteEducationUseCase;
//
//   AddEducationController(
//       {required this.addEducationUseCase,
//       required this.getPositionUseCase,
//       required this.editEducationUseCase,
//       required this.getStudyFieldsUseCase,
//       required this.deleteEducationUseCase,
//       required this.getDegreesUseCase});
//
//   RxBool isAcademic = false.obs;
//   RxBool isAddingMode = false.obs;
//   RxBool isLoading = false.obs;
//
//   TextEditingController universityController = TextEditingController();
//   TextEditingController startDateController = TextEditingController();
//   TextEditingController endDateController = TextEditingController();
//
//   RxList<Degrees>? degrees = <Degrees>[].obs;
//   RxList<Jobs> majors = <Jobs>[].obs;
//   RxList<Jobs> orientations = <Jobs>[].obs;
//   RxList<FieldsOfStudy> studyFields = <FieldsOfStudy>[].obs;
//   RxString selectedMajor = ''.obs;
//   RxString selectedStudyField = ''.obs;
//   RxString selectedOrientation = ''.obs;
//   RxString selectedDegreeId = ''.obs;
//   RxString selectedStudyFieldId = ''.obs;
//   RxString selectedDegree = ''.obs;
//   RxString selectedMajorId = ''.obs;
//   RxString selectedOrientationId = ''.obs;
//   RxList<UserProfileEducations> userEducations = <UserProfileEducations>[].obs;
//   bool isEditMode = false;
//   UserProfileEducations? education;
//   @override
//   void onInit() async {
//     super.onInit();
//     await getDegrees();
//     await getStudyFields();
//     await getPositions();
//
//     var arg = Get.arguments;
//     isEditMode = arg['isEditMode'] ?? false;
//     if (isEditMode) {
//       education = arg['education'];
//       universityController.text = education!.university!;
//       startDateController.text = education!.startDate!;
//       endDateController.text = education!.endDate!;
//       selectedStudyFieldId.value = education!.fieldOfStudyId!;
//       studyFields.forEach((element) {
//         if (element.id == selectedStudyFieldId.value) {
//           selectedStudyField.value = element.title!;
//         }
//       });
//       selectedDegreeId.value = education!.degreeId!;
//       degrees?.forEach((element) {
//         if (element.id == selectedDegreeId.value) {
//           selectedDegree.value = element.title!;
//         }
//       });
//     }
//   }
//
//   Future<void> getPositions() async {
//     Either<Failure, PositionEntity> response = await getPositionUseCase({});
//     isLoading.value = true;
//     response.fold((error) {
//       if (error is ResponseError) {
//         Utils.showMessage(message: error.message!, type: AppStrings.error.tr);
//       } else {
//         Utils.showMessage(
//             message: error.response?.response?.data['message'] ??
//                 error.response.message,
//             type: AppStrings.error.tr);
//       }
//       isLoading.value = false;
//     }, (PositionEntity data) async {
//       if (data.ok!) {
//         majors.clear();
//         orientations.clear();
//         majors(data.data?.jobs);
//         orientations(data.data?.jobs);
//         isLoading.value = false;
//       }
//     });
//   }
//
//   Future<void> getDegrees() async {
//     isLoading.value = true;
//     Either<Failure, DegreeEntity> response = await getDegreesUseCase({});
//     response.fold((error) {
//       if (error is ResponseError) {
//         Utils.showMessage(message: error.message!, type: AppStrings.error.tr);
//       } else {
//         Utils.showMessage(
//             message: error.response?.response?.data['message'] ??
//                 error.response.message,
//             type: AppStrings.error.tr);
//       }
//       isLoading.value = false;
//     }, (DegreeEntity data) async {
//       if (data.ok!) {
//         degrees?.clear();
//         degrees!(data.data?.degrees!.toList());
//       }
//     });
//   }
//
//   Future<void> getStudyFields() async {
//     isLoading.value = true;
//     Either<Failure, FieldOfStudyEntity> response =
//         await getStudyFieldsUseCase({});
//     response.fold((error) {
//       if (error is ResponseError) {
//         Utils.showMessage(message: error.message!, type: AppStrings.error.tr);
//       } else {
//         Utils.showMessage(
//             message: error.response?.response?.data['message'] ??
//                 error.response.message,
//             type: AppStrings.error.tr);
//       }
//       isLoading.value = false;
//     }, (FieldOfStudyEntity data) async {
//       if (data.ok!) {
//         studyFields.clear();
//         studyFields(data.data?.fieldsOfStudy!.toList());
//       }
//     });
//   }
//
//   Future<bool> validateEducation(
//       {required bool isFromEditPage, bool? isFromNextButton}) async {
//     if (universityController.text.isNotEmpty &&
//         startDateController.text.isNotEmpty &&
//         endDateController.text.isNotEmpty &&
//         selectedDegreeId.value.isNotEmpty &&
//         selectedStudyFieldId.value.isNotEmpty) {
//       if (DateTime.parse(startDateController.text).millisecondsSinceEpoch <
//           DateTime.parse(endDateController.text).millisecondsSinceEpoch) {
//         if (isFromEditPage) {
//           await addEducations().then((value) {
//             if ((isFromNextButton ?? false) == false) {
//               Get.find<EditProfileController>().currentStep.value++;
//             }
//           });
//         } else {
//           await addEducations().then((value) {
//             if (value == true) {
//               Get.back(result: true);
//             }
//           });
//         }
//         return true;
//       } else {
//         Utils.showMessage(
//             type: AppStrings.warning.tr, message: AppStrings.dateError.tr);
//
//         Get.dialog(Dialog(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(AppStrings.dateError.tr),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: CustomButton(
//                       onPress: () {
//                         Navigator.of(Get.context!).pop();
//                       },
//                       buttonText: AppStrings.done.tr),
//                 )
//               ],
//             ),
//           ),
//         ));
//         return false;
//       }
//     } else {
//       Utils.showMessage(
//           type: AppStrings.warning.tr,
//           message: AppStrings.fieldCompleteHint.tr);
//       return false;
//     }
//   }
//
//   Future<bool?> editEducation(String id) async {
//     isLoading.value = true;
//     Either<Failure, AddedEducationEntity> response =
//         await editEducationUseCase({
//       "id": id,
//       "map": {
//         "degree_id": selectedDegreeId.value,
//         "end_date": endDateController.text.contains('T')
//             ? '${endDateController.text}'
//             : '${endDateController.text}T15:04:05Z',
//         "field_of_study_id": selectedStudyFieldId.value,
//         "start_date": startDateController.text.contains('T')
//             ? '${startDateController.text}'
//             : '${startDateController.text}T15:04:05Z',
//         "university": universityController.text
//       }
//     });
//     response.fold((error) {
//       isLoading.value = false;
//       if (error is ResponseError) {
//         Utils.showMessage(message: error.message!, type: AppStrings.error.tr);
//       } else {
//         Utils.showMessage(
//             message: error.response?.response?.data['message'] ??
//                 error.response.message,
//             type: AppStrings.error.tr);
//       }
//       return false;
//     }, (AddedEducationEntity data) async {
//       if (data.ok!) {
//         isLoading.value = false;
//         Get.back();
//         Utils.showMessage(
//             type: AppStrings.success.tr,
//             message: AppStrings.successEditEducationHint.tr);
//
//         return true;
//       }
//     });
//     return null;
//   }
//
//   Future<bool?> addEducations() async {
//     isLoading.value = true;
//     Either<Failure, AddedEducationEntity> response = await addEducationUseCase({
//       "degree_id": selectedDegreeId.value,
//       "end_date": '${endDateController.text}T15:04:05Z',
//       // "2006-12-02T15:04:05Z",
//       "field_of_study_id": selectedStudyFieldId.value,
//       "start_date": '${startDateController.text}T15:04:05Z',
//       "university": universityController.text
//     });
//     response.fold((error) {
//       isLoading.value = false;
//       if (error is ResponseError) {
//         Utils.showMessage(message: error.message!, type: AppStrings.error.tr);
//       } else {
//         Utils.showMessage(
//             message: error.response?.response?.data['message'] ??
//                 error.response.message,
//             type: AppStrings.error.tr);
//       }
//       return false;
//     }, (AddedEducationEntity data) async {
//       if (data.ok!) {
//         UserProfileEducations newEducation = UserProfileEducations(
//           degreeId: data.data?.userProfileEducation?.degreeId,
//           endDate: data.data?.userProfileEducation?.endDate,
//           fieldOfStudyId: data.data?.userProfileEducation?.fieldOfStudyId,
//           id: data.data?.userProfileEducation?.id,
//           startDate: data.data?.userProfileEducation?.startDate,
//           university: data.data?.userProfileEducation?.university,
//           userId: data.data?.userProfileEducation?.userId,
//         );
//         userEducations.add(newEducation);
//         isAddingMode.value = false;
//         isLoading.value = false;
//
//         Utils.showMessage(
//             type: AppStrings.success.tr,
//             message: AppStrings.successAddEducationHint.tr);
//
//         return true;
//       }
//     });
//   }
//
//   Future<void> deleteEducation(String educationId) async {
//     isLoading.value = true;
//     Either<Failure, DeleteResponseEntity> response =
//         await deleteEducationUseCase({'id': educationId});
//     response.fold((error) {
//       if (error is ResponseError) {
//         Utils.showMessage(message: error.message!, type: AppStrings.error.tr);
//       } else {
//         Utils.showMessage(
//             message: error.response?.response?.data['message'] ??
//                 error.response.message,
//             type: AppStrings.error.tr);
//       }
//       isLoading.value = false;
//     }, (DeleteResponseEntity data) async {
//       if (data.ok!) {
//         Get.back();
//         Utils.showMessage(
//             type: AppStrings.success.tr,
//             message: AppStrings.successDeleteEducationHint.tr);
//       }
//     });
//   }
// }
