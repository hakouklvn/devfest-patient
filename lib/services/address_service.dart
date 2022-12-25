import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import 'package:patient/models/address_model.dart';

class AddressService {
  Future<String> saveToFireStore(AddressModel addressModel) async {
    final db = FirebaseFirestore.instance;
    final address = await db.collection("address").add(addressModel.toJson());
    return address.id;
  }

  Future<AddressModel> getAddress(String addressId) async {
    final db = FirebaseFirestore.instance;

    final addressCol = db.collection("address").doc(addressId);
    final addressDoc = await addressCol.get();
    return AddressModel.fromJson(addressDoc.data()!);
  }

  Future<String> createAddress() async {
    Location location = Location();
    AddressService addressService = AddressService();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }

    locationData = await location.getLocation();
    AddressModel model = AddressModel(
        longitude: locationData.longitude, latitude: locationData.latitude);
    return await addressService.saveToFireStore(model);
  }
}
