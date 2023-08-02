class UserDetails {
  final String id;
  final String givenName;
  final String familyName;
  final String email;
  final String picture;

  UserDetails(this.id, this.givenName, this.familyName, this.email, this.picture);

  @override
  String toString() {
    return 'UserDetails{id: $id, givenName: $givenName, familyName: $familyName, email: $email, picture: $picture}';
  }
}
