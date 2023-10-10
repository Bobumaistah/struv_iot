import 'package:hive/hive.dart';

import '../models/hardware_model.dart';

abstract class LocalDataSource {
  Future<Box<HardwareModel>> getHadwaretBox();
  Future<void> saveHardware(HardwareModel hardware);
  Future<List<HardwareModel>> getAllHardwares();
  Future<void> updateProduct(HardwareModel product, index);
  Future<void> removeHardware(int index);
}

class LocalRemoteDataSourceImpl extends LocalDataSource {
  final String boxName = 'hadwareBox';

  @override
  Future<Box<HardwareModel>> getHadwaretBox() async {
    return Hive.openBox(boxName);
  }

  @override
  Future<void> saveHardware(HardwareModel hardware) async {
    final box = await getHadwaretBox();
    await box.add(hardware);
  }

  @override
  Future<List<HardwareModel>> getAllHardwares() async {
    final box = await getHadwaretBox();
    return box.values.toList();
  }

  @override
  Future<void> updateProduct(HardwareModel product, index) async {
    final box = await getHadwaretBox();
    await box.putAt(index, product);
  }

  @override
  Future<void> removeHardware(int index) async {
    final box = await getHadwaretBox();
    await box.deleteAt(index);
  }
}
