import 'package:portfolio_marin/domain/sources/contact_datasource/contact_datasource.dart';

abstract class ContactRepositoryBase {
  Future<bool> sendMessage({required String name, required String email, required String message});
}

class ContactRepository extends ContactRepositoryBase {
  final ContactDataSource _dataSource;

  ContactRepository(this._dataSource);
  @override
  Future<bool> sendMessage({required String name, required String email, required String message}) async =>
      await _dataSource.sendMessage(name, email, message);
}
