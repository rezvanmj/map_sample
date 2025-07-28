import '../../domain/repositories/map_repository.dart';
import '../data_sources/map_remote_data.dart';

class MapRepositoryImp extends MapRepository {
  MapRemoteData mapRemoteData;
  MapRepositoryImp({required this.mapRemoteData});
  //
  // @override
  // Future<Either<Failure, EditProfileEntity>> editProfile(
  //     Map<String, dynamic> data) async {
  //   // if (netWorkInfo.checkConnectivity() == ConnectivityResult.none) {
  //   //   return Left(ResponseError(message: AppStrings.noNetwork));
  //   // }
  //   try {
  //     Response result = await editProfileRemoteData.editProfile(data);
  //     if (result.statusCode == 201 || result.statusCode == 200) {
  //       EditProfileModel res = EditProfileModel.fromJson(result.data);
  //       return Right(res);
  //     } else {
  //       return Left(ResponseError(message: result.data['message']));
  //     }
  //   } catch (error) {
  //     return Left(ServerFailure(error: error));
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, UpdateProfileEntity>> updateProfile(
  //     Map<String, dynamic> data) async {
  //   // if (netWorkInfo.checkConnectivity() == ConnectivityResult.none) {
  //   //   return Left(ResponseError(message: AppStrings.noNetwork));
  //   // }
  //   try {
  //     Response result = await editProfileRemoteData.updateProfile(data);
  //     if (result.statusCode == 201 || result.statusCode == 200) {
  //       UpdateProfileModel res = UpdateProfileModel.fromJson(result.data);
  //       return Right(res);
  //     } else {
  //       return Left(ResponseError(message: result.data['message']));
  //     }
  //   } catch (error) {
  //     return Left(ServerFailure(error: error));
  //   }
  // }
}
