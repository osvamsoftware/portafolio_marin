import 'package:portfolio_marin/domain/sources/contact_datasource/contact_datasource.dart';

abstract class ContactRepositoryBase {
  Future<bool> sendMessage();
}

class ContactRepository extends ContactRepositoryBase {
  final ContactDataSource _dataSource;

  ContactRepository(this._dataSource);
  @override
  Future<bool> sendMessage() async => await _dataSource.sendMessage();
}
