import 'package:socket_demo/core/constants/app_constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  IO.Socket connect() {
    socket = IO.io(
      AppConstants.baseUrl,
      IO.OptionBuilder()
          .setTransports(['websocket']) // Use WebSocket only
          .enableAutoConnect() // Auto reconnect
          .build(),
    );

    return socket;
  }
}