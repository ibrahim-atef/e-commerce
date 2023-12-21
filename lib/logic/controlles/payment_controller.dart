import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'dart:convert';
import '../../model/paynentModel/authentication_request_model.dart';
import '../../model/paynentModel/order_registration_model.dart';
import '../../model/paynentModel/payment_reqeust_model.dart';
import '../../services/payment_services.dart';
import '../../utils/constant.dart';

class PayMentController extends GetxController {
  var phoneNumber = "".obs;
  var address = 'Your Address'.obs;
  var paymentItems = <PaymentItem>[].obs;
  var isLoading = false.obs;
  int radioPaymentIndex = 1;

  //Location

  Future<void> updatePosition() async {
    Position position = await _determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemarks[0];

    address.value = "${place.country},${place.street}";
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

//Google Pay

  void makeGooglePay({required String amount, required String label}) {
    paymentItems.add(
      PaymentItem(
        label: label,
        amount: amount,
        status: PaymentItemStatus.final_price,
      ),
    );

    update();
  }

  void removeGooglePay() {
    paymentItems.clear();
    update();
  }

  AuthenticationRequestModel? authTokenModel;
  OrderRegistrationModel? orderRegistrationModel;
  PaymentRequestModel? paymentRequestModel;

  Future<void> getAuthToken() async {
    isLoading.value = true;
    update();
    try {
      final response = await PaymentServices.postData(
        url: ApiContest.getAuthToken,
        data: {"api_key": ApiContest.paymentApiKey},
      );

      if (response.statusCode == 201) {
        // If the response code is 201, it usually means the resource was created.
        // You might want to handle this case differently if it's not an error.

        // Check if the response body is a valid JSON string
        final dynamic responseBody = json.decode(response.body);

        if (responseBody is Map<String, dynamic>) {
          // Parse the JSON response
          authTokenModel = AuthenticationRequestModel.fromJson(responseBody);
          ApiContest.paymentFirstToken = authTokenModel!.token;
          print('The token 🍅${ApiContest.paymentFirstToken}');
          update();
        } else {
          // If the response body is not a valid JSON Map, log an error
          print('Error: Response body is not a valid JSON Map');
          // Handle the error or throw an exception if needed
          update();
        }
      } else {
        // If the response code is not 201, handle it as an error
        print('Error: ${response.statusCode} - ${response.body}');
        // Handle the error or throw an exception if needed
        update();
      }
    } catch (error) {
      // Handle any unexpected errors during the API call
      print('Error in auth token $error 🤦‍♂️');
      // Handle the error or throw an exception if needed
      update();
    }
  }

  Future<void> getOrderRegistrationID({
    required String price,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) async {
    try {
      final response = await PaymentServices.postData(
        url: ApiContest.getOrderId,
        data: {
          'auth_token': ApiContest.paymentFirstToken,
          "delivery_needed": "false",
          "amount_cents": price,
          "currency": "EGP",
          "items": [],
        },
      );

      if (response.statusCode == 201) {
        // If the response code is 201, it usually means the resource was created.
        // You might want to handle this case differently if it's not an error.

        // Check if the response body is a valid JSON string
        final dynamic responseBody = json.decode(response.body);

        if (responseBody is Map<String, dynamic>) {
          // Parse the JSON response
          orderRegistrationModel =
              OrderRegistrationModel.fromJson(responseBody);
          ApiContest.paymentOrderId = orderRegistrationModel!.id.toString();
          getPaymentRequest(price, firstName, lastName, email, phone);
          print('The order id 🍅 =${ApiContest.paymentOrderId}');
        } else {
          // If the response body is not a valid JSON Map, log an error
          print('Error: Response body is not a valid JSON Map');
        }
      } else {
        // If the response code is not 201, handle it as an error
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      // Handle any unexpected errors during the API call
      print('Error in order id $error 🤦‍♂️');
    }

    update();
  }

  // for final request token

  Future<void> getPaymentRequest(
    String priceOrder,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    try {
      final response = await PaymentServices.postData(
        url: ApiContest.getPaymentRequest,
        data: {
          "auth_token": ApiContest.paymentFirstToken,
          "amount_cents": priceOrder,
          "expiration": 3600,
          "order_id": ApiContest.paymentOrderId,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number": phone,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": ApiContest.integrationIdCard,
          "lock_order_when_paid": "false",
        },
      );

      if (response.statusCode == 201) {
        // If the response code is 201, it usually means the resource was created.
        // You might want to handle this case differently if it's not an error.

        // Check if the response body is a valid JSON string
        final dynamic responseBody = json.decode(response.body);

        if (responseBody is Map<String, dynamic>) {
          // Parse the JSON response
          paymentRequestModel = PaymentRequestModel.fromJson(responseBody);
          ApiContest.finalToken = paymentRequestModel!.token;
          print('Final token 🚀 ${ApiContest.finalToken}');
        } else {
          // If the response body is not a valid JSON Map, log an error
          print('Error: Response body is not a valid JSON Map');
        }
      } else {
        // If the response code is not 201, handle it as an error
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      // Handle any unexpected errors during the API call
      print('Error in final token $error 🤦‍♂️');
    }
    isLoading.value = false;

    update();
  }
/// get ref code
  Future<void> getPaymentFinalKioskKey(
      String priceOrder,
      String firstName,
      String lastName,
      String email,
      String phone,
      ) async {
    try {
      final response = await PaymentServices.postData(
        url: ApiContest.getPaymentRequest,
        data: {
          "auth_token": ApiContest.paymentFirstToken,
          "amount_cents": priceOrder,
          "expiration": 3600,
          "order_id": ApiContest.paymentOrderId,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number": phone,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": ApiContest.integrationIdKiosk,
          "lock_order_when_paid": "false",
        },
      );

      if (response.statusCode == 201) {
        // If the response code is 201, it usually means the resource was created.
        // You might want to handle this case differently if it's not an error.

        // Check if the response body is a valid JSON string
        final dynamic responseBody = json.decode(response.body);

        if (responseBody is Map<String, dynamic>) {
          // Parse the JSON response
          paymentRequestModel = PaymentRequestModel.fromJson(responseBody);
          ApiContest.finalTokenKiosk = paymentRequestModel!.token;
          print('Final finalToken Kiosk 🚀 ${ApiContest.finalTokenKiosk}');
        } else {
          // If the response body is not a valid JSON Map, log an error
          print('Error: Response body is not a valid JSON Map');
        }
      } else {
        // If the response code is not 201, handle it as an error
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      // Handle any unexpected errors during the API call
      print('Error in final token $error 🤦‍♂️');
    }
    isLoading.value = false;

    update();
  }


  Future<void> getRefCode() async {

      final response = await PaymentServices.postData(
        url: ApiContest.getRefCode,
        data: {
          "source": {
            "identifier": "AGGREGATOR",
            "subtype": "AGGREGATOR",
          },
          "payment_token": ApiContest.finalTokenKiosk,
        },
      ) .then((value) {
        ApiContest.refCode=jsonDecode(value.body)["id"].toString();
        print('The ref code 🍅${ApiContest.refCode}');
      }).catchError((onError){
        print('Error in ref code $onError 🤦‍♂️');
      });


    isLoading.value = false;
    update();
  }

  ///choosePayMethod

  payWithRef() {
    radioPaymentIndex = 1;
    update();
  }

  payWithCard() {
    radioPaymentIndex = 2;
    update();
  }
}
