import 'package:shino/models/bytes.dart';
import 'package:shino/models/memory.dart';
import 'package:shino/models/server/generic.dart';

class MacosServer extends GenericServer {
  MacosServer(super.client);

  @override
  Future<int> cpuCount() async =>
      int.parse(await runCommandUtf8("sysctl -n hw.physicalcpu"));

  @override
  Future<Memory> memoryUsage() async {
    final vmstat = await runCommandUtf8("vm_stat");
    final memsize = await runCommandUtf8("sysctl -n hw.memsize_usable");

    final pageSizeRegex = RegExp(r"page size of (\d+) bytes");
    final pageSize = int.parse(pageSizeRegex.firstMatch(vmstat)!.group(1)!);

    final fields = Map.fromEntries(
      vmstat.split("\n").skip(1).where((line) => line.isNotEmpty).map(
        (line) {
          final parts = line.split(":");
          return MapEntry(
            parts[0].trim(),
            int.parse(parts[1].trim().split(".")[0]),
          );
        },
      ),
    );

    final total = int.parse(memsize);
    final used = fields["Pages active"]! + (fields["Pages wired down"] ?? 0);

    return Memory(
      total: Bytes(bytes: total),
      used: Bytes(bytes: used * pageSize),
    );
  }
}
