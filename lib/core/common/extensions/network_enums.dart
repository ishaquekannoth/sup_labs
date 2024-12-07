enum RequestMethod {
  getRequest,
  postRequest,
  putRequest,
  deleteRequest,
  patchRequest,
  headRequest
}
enum QueryType {
  query,
  mutation;
}
extension GQLMethodString on QueryType {
  String get requestType {
    switch (this) {
      case QueryType.query:
        return "query";
      case QueryType.mutation:
        return "mutation";
    }
  }
}
extension RESTMethodString on RequestMethod {
  String get getMethodName {
    switch (this) {
      case RequestMethod.getRequest:
        return "GET";
      case RequestMethod.postRequest:
        return "POST";
      case RequestMethod.putRequest:
        return "PUT";
      case RequestMethod.deleteRequest:
        return "DELETE";
      case RequestMethod.patchRequest:
        return "PATCH";
      case RequestMethod.headRequest:
        return "HEAD";
    }
  }
}
enum ErrorMessageType {
  messageFromResponseBody,
  messageDefaultByDio,
  messageCustomised
}