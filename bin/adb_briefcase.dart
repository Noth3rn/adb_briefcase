import 'package:dart_tui/dart_tui.dart';

Future<void> main() async {
  await Program(
    options: [
      withAltScreen(),
    ],
  ).run(CounterModel());
}

final class CounterModel extends Model {
  CounterModel({
    this.count = 0,
  });

  final int count;

  @override
  (Model, Cmd?) update(Msg msg) {
    if (msg is KeyMsg) {
      switch (msg.key) {
        case 'up':
        case 'k':
          return (
          CounterModel(count: count + 1),
          null,
          );

        case 'down':
        case 'j':
          return (
          CounterModel(count: count - 1),
          null,
          );

        case 'q':
        case 'ctrl+c':
          return (
          this,
              () => quit(),
          );
      }
    }

    return (this, null);
  }

  @override
  View view() {
    return newView('''
Counter

Count: $count

↑ / k   increase
↓ / j   decrease
q       quit
''');
  }
}