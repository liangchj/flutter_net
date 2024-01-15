import '../flutter_net.dart';

/// 默认解码器
class DefaultNetDecoder extends NetDecoder {
  /// 单例对象
  static final DefaultNetDecoder _instance = DefaultNetDecoder._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultNetDecoder._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultNetDecoder.getInstance() => _instance;

  @override
  K decode<T, K>({required Response<dynamic> response, T? Function(dynamic)? fromJsonFun}) {
    if (fromJsonFun == null) {
      return response.data as K;
    } else {
      if (response.data is List) {
        var list = response.data as List;
        var dataList =
        List<T>.from(list.map((item) => fromJsonFun(item)).toList()) as K;
        return dataList;
      }
      var model = fromJsonFun(response.data) as K;
      return model;
    }
  }

}
