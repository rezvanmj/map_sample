import 'package:get/get.dart';
import 'package:map_sample/map_feature/presentation/manager/map_page_controller.dart';

class MapBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MapPageController());
    //     Get.lazyPut(() => AddEducationController(
    //           addEducationUseCase: Get.find<AddEducationUseCase>(),
    //           getDegreesUseCase: Get.find<GetDegreesUseCase>(),
    //           getPositionUseCase: Get.find<GetPositionsUseCase>(),
    //           getStudyFieldsUseCase: Get.find<GetStudyFieldsUseCase>(),
    //           editEducationUseCase: Get.find<EditEducationUseCase>(),
    //           deleteEducationUseCase: Get.find<DeleteEducationUseCase>(),
    //         ));
    //     Get.lazyPut(() => DeleteEducationUseCase(
    //           editProfileRepository: Get.find<EditProfileRepositoryImp>(),
    //         ));
    //
    //     Get.lazyPut(() => DeleteCertificateUseCase(
    //           editProfileRepository: Get.find<EditProfileRepositoryImp>(),
    //         ));
    //
    //     Get.lazyPut(() => AddCertificationController(
    //           addCertificationUseCase: Get.find<AddCertificationUseCase>(),
    //           uploadMediaUseCase: Get.find<UploadMediaUseCase>(),
    //           mediaUseCase: Get.find<MediaUseCase>(),
    //           downloadMediaUseCase: Get.find<DownloadMediaUseCase>(),
    //           editCertificateUseCase: Get.find<EditCertificateUseCase>(),
    //           deleteCertificateUseCase: Get.find<DeleteCertificateUseCase>(),
    //         ));
    //     Get.lazyPut(() => EditProfileController(
    //         uploadMediaUseCase: Get.find<UploadMediaUseCase>(),
    //         mediaUseCase: Get.find<MediaUseCase>(),
    //         downloadMediaUseCase: Get.find<DownloadMediaUseCase>(),
    //         editProfileUseCase: Get.find<EditProfileUseCase>(),
    //         updateProfileUseCase: Get.find<UpdateProfileUseCase>(),
    //         getCitiesUseCase: Get.find<GetCitiesUseCase>(),
    //         getStatesUseCase: Get.find<GetStatesUseCase>(),
    //         getCountriesUseCase: Get.find<GetCountriessUseCase>(),
    //         getPositionUseCase: Get.find<GetPositionsUseCase>(),
    //         getContactInfoUseCase: Get.find<GetContactInfoUseCase>()));
    //
    //     Get.lazyPut(() => VerifyEmailController(
    //           addContactUseCase: Get.find<AddContactUseCase>(),
    //           verifyOtpUseCase: Get.find<VerifyOtpUseCase>(),
    //           sendOtpUseCase: Get.find<SendOtpUseCase>(),
    //         ));
    //
    //     Get.lazyPut(() => SendOtpUseCase(
    //         authenticationRepository: Get.find<AuthenticationRepositoryImp>()));
    //     Get.lazyPut(() => VerifyOtpUseCase(
    //         authenticationRepository: Get.find<AuthenticationRepositoryImp>()));
    //
    //     Get.lazyPut(() => AddContactUseCase(
    //         authenticationRepository: Get.find<AuthenticationRepositoryImp>()));
    //     Get.lazyPut(() => EditCertificateUseCase(
    //           editProfileRepository: Get.find<EditProfileRepositoryImp>(),
    //         ));
    //
    //     Get.lazyPut(() => EditEducationUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => AuthenticationRepositoryImp(
    //         authenticationRemoteData: Get.find<AuthenticationRemoteData>(),
    //         netWorkInfo: Get.find<NetworkInfoImpl>()));
    //
    //     Get.lazyPut(() => AuthenticationRemoteData());
    //
    //     Get.lazyPut(() => GetCountriessUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => GetCountriessUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => GetContactInfoUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => GetStudyFieldsUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => GetPositionsUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => GetCitiesUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => GetStatesUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => EditProfileUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => GetDegreesUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //
    //     Get.lazyPut(() => UpdateProfileUseCase(
    //         editProfileRepository: Get.find<EditProfileRepositoryImp>()));
    //     Get.lazyPut(() => EditProfileRepositoryImp(
    //         editProfileRemoteData: Get.find<EditProfileRemoteData>(),
    //         netWorkInfo: Get.find<NetworkInfoImpl>()));
    //     Get.lazyPut(() => ProfileRepositoryImp(
    //         profileRemoteData: Get.find<ProfileRemoteData>(),
    //         netWorkInfo: Get.find<NetworkInfoImpl>()));
    //
    //     Get.lazyPut(() => ProfileRemoteData());
    //     Get.lazyPut(() => AddEducationUseCase(
    //           profileRepository: Get.find<ProfileRepositoryImp>(),
    //         ));
    //
    //     Get.lazyPut(() => AddCertificationUseCase(
    //           profileRepository: Get.find<ProfileRepositoryImp>(),
    //         ));
    //
    //     Get.lazyPut(() => EditProfileRemoteData());
    //
    // //----------------UPLOAD-------------------------
    //     Get.lazyPut(() => MediaUseCase(
    //           uploadMediaRepository: Get.find<UploadMediaRepositoryImp>(),
    //         ));
    //
    //     Get.lazyPut(() => UploadMediaUseCase(
    //           uploadMediaRepository: Get.find<UploadMediaRepositoryImp>(),
    //         ));
    //
    //     Get.lazyPut(() => UploadMediaRepositoryImp(
    //         uploadMediaRemoteData: Get.find<UploadMediaRemoteData>(),
    //         netWorkInfo: Get.find<NetworkInfoImpl>()));
    //
    //     Get.lazyPut(() => UploadMediaRemoteData());
    //
    // //----------------DOWNLOAD-------------------------
    //     Get.lazyPut(() => DownloadMediaUseCase(
    //           downloadMediaRepository: Get.find<DownloadMediaRepositoryImp>(),
    //         ));
    //
    //     Get.lazyPut(() => DownloadMediaRepositoryImp(
    //         downloadMediaRemoteData: Get.find<DownloadMediaRemoteData>(),
    //         netWorkInfo: Get.find<NetworkInfoImpl>()));
    //
    //     Get.lazyPut(() => DownloadMediaRemoteData());
  }
}
