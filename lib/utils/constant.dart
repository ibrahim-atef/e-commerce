class ApiContest {
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RRM05qYzVMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkubzdLTTI5eXkwdGppTVNxcDFubTJVVVNPVC1Ya0U3UnVIOGdQMDBiXzlUdm1YNWhVMWJSLURDeWVVQ29SdmFfYU44QUdVUDUtSm5oWEMyUE1BMVdkTGc=";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/810113?payment_token=$finalToken';
  static String paymentFirstToken = '';

  static String paymentOrderId = '';

  static String finalToken = '';
  static String finalTokenKiosk = '';

  static const String integrationIdCard = '4420120';
  static const String integrationIdKiosk = '4420127';

  static String refCode = '';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
