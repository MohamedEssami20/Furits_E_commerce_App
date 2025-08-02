class OrderAddressDetailsEntity {
  final String fullName;
  final String email;
  final String address;
  final String phone;
  final String city;
  final String addressDetails;

  OrderAddressDetailsEntity(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.phone,
      required this.city,
      required this.addressDetails});
}
