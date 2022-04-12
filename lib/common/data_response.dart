class DataResponse<T> {
  Status status;
  T? data;
  String? message;
  String? modelType;
  int responseStatus;

  DataResponse.loading(this.message)
      : status = Status.Loading,
        responseStatus = 0;

  DataResponse.success(this.data, {this.modelType})
      : status = Status.Success,
        responseStatus = 0;

  DataResponse.error(this.message, [int statusCode = 0])
      : status = Status.Error,
        responseStatus = statusCode;

  DataResponse.connectivityError()
      : status = Status.ConnectivityError,
        responseStatus = 0;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { Loading, Success, Error, ConnectivityError }
