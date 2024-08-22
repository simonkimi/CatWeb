import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

SwipeActionController useSwipeActionController() {
  final controller = useMemoized(() => SwipeActionController());
  useEffect(() {
    return controller.dispose;
  }, []);
  return controller;
}
