// import 'package:protos/protos.dart';
// import '../../config/secure/secure_storage.dart';

// class AuthInterceptor extends ClientInterceptor {
//   @override
//   ResponseFuture<R> interceptUnary<Q, R>(
//     ClientMethod<Q, R> method,
//     Q request,
//     CallOptions options,
//     ClientUnaryInvoker<Q, R> invoker,
//   ) {
//     final response = invoker(method, request, _attachToken(options));

//     return response;
//   }

//   @override
//   ResponseStream<R> interceptStreaming<Q, R>(
//     ClientMethod<Q, R> method,
//     Stream<Q> requests,
//     CallOptions options,
//     ClientStreamingInvoker<Q, R> invoker,
//   ) {
//     final response = invoker(method, requests, _attachToken(options));

//     return response;
//   }

//   CallOptions _attachToken(CallOptions options) {
//     final token = SessionController.instance.token;

//     if (token == null || token.isEmpty) {
//       SessionController.instance.clearSession();
//       return options;
//     }
//     return options.mergedWith(
//       CallOptions(metadata: {'authorization': 'Bearer $token'}),
//     );
//   }
// }
