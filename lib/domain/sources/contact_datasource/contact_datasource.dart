abstract class ContactDataSource {
  Future sendMessage();
}

class ContactDataSourceImpl extends ContactDataSource {
  @override
  Future sendMessage() async {
    Future.delayed(Duration(seconds: 2));
    return true;
  }
}
