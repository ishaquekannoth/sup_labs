// For shopify based GQL only...

const String adminAccesstoken = "";
const String storeFrontAccessToken = "";
class APIHeaders {

  final Map<String, String> _storeFrontHeaders = {
    "X-Shopify-Storefront-Access-Token": storeFrontAccessToken
  };
  final Map<String, String> _adminHeader = {
    "X-Shopify-Access-Token": adminAccesstoken
  };
  APIHeaders._private();
  static final APIHeaders _instance = APIHeaders._private();
  factory APIHeaders() => _instance;
  Map<String, String> get storeFrontHeaders => _storeFrontHeaders;
  Map<String, String> get adminHeader => _adminHeader;
}
