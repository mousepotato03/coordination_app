import '../../domain/model/my_size/my_size_info.model.dart';
import '../entity/my_size/my_size_info.entity.dart';

//model => entity
extension MySizeInfoEx on MySizeInfo {
  MySizeInfoEntity toEntity() {
    return MySizeInfoEntity(
      name: name,
      age: age,
      sex: sex,
      height: height,
      weight: weight,
      upperBodyHeight: upperBodyHeight,
      shoulderWidth: shoulderWidth,
      chestHeight: chestHeight,
      lowerBodyHeight: lowerBodyHeight,
      waistWidth: waistWidth,
      hipWidth: hipWidth,
      shoesSize: shoesSize,
    );
  }
}

//entity => model
extension MySizeInfoEntityX on MySizeInfoEntity {
  MySizeInfo toModel() {
    return MySizeInfo(
      name: name,
      age: age,
      sex: sex,
      height: height,
      weight: weight,
      upperBodyHeight: upperBodyHeight,
      shoulderWidth: shoulderWidth,
      chestHeight: chestHeight,
      lowerBodyHeight: lowerBodyHeight,
      waistWidth: waistWidth,
      hipWidth: hipWidth,
      shoesSize: shoesSize,
    );
  }
}
