import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_to_do_app_freecode/services/auth.dart';
import 'package:mockito/mockito.dart';

class MockUser extends Mock implements User {}

class MockAuth extends Mock implements FirebaseAuth {
  @override
  Stream<User?> authStateChanges() {
    // TODO: implement authStateChanges
    return Stream.fromIterable([MockUser()]);
  }
}

void maim() {
  final MockAuth mockauth = MockAuth();
  final Auth auth = Auth(auth: mockauth);

  setUp() {}

  tearDown() {}

  test("emit occurs", () async {});
}
