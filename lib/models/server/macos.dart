import 'package:shino/models/server/generic.dart';

class MacosServer extends GenericServer {
  MacosServer(super.client);

  @override
  Future<int> cpuCount() async =>
      int.parse(await runCommandUtf8("sysctl -n hw.physicalcpu"));
}
