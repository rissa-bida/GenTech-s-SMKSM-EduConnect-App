class UserData {
  String profilePicture;
  String name;
  String email;
  String phoneNumber;
  String address;

  UserData({
    required this.profilePicture,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  UserData copy() {
    return UserData(
      profilePicture: profilePicture,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      address: address,
    );
  }

  static UserData currentUser = UserData(
    profilePicture: 'https://www.w3schools.com/howto/img_avatar.png', // Replace with your default image
    name: 'Simon Joseph',
    email: 'simonjo@email.com',
    phoneNumber: '+234090065000',
    address: '123 Main St',
  );
}

extension UserDataExtension on UserData {
  String getFieldValue(String labelText) {
    switch (labelText) {
      case 'Name':
        return name;
      case 'Email':
        return email;
      case 'Phone':
        return phoneNumber;
      case 'Address':
        return address;
      default:
        return '';
    }
  }
}
