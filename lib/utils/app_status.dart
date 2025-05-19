enum Status { loading, success, error, loadMore }

extension StatusExtension on Status {
  T when<T>({
    required T Function() loading,
    required T Function() error,
    required T Function() success,
  }) {
    switch (this) {
      case Status.loading:
        return loading();
      case Status.error:
        return error();
      case Status.success:
        return success();
      default:
        return loading();
    }
  }
}
