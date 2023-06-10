class Util {
  Future<void> delay({required int milliseconds}) async {
    await Future.delayed(
      Duration(milliseconds: milliseconds),
    );
  }
}
