import 'package:flutter/material.dart';

class S5521 extends StatefulWidget {
  const S5521({super.key});

  @override
  State<S5521> createState() => _S5521State();
}

// Mit AnimationController
class _S5521State extends State<S5521> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startProgress() {
    if (_animation.isAnimating) return;
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(alignment: Alignment.center, children: [
                LinearProgressIndicator(
                  minHeight: 20,
                  backgroundColor: Colors.orange[100],
                  value: _animation.value,
                ),
                Text('${(_animation.value * 100).floor()}%')
              ]);
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: _startProgress, child: Text('Start Progress'))
        ],
      ),
    );
  }
}

// Ohne AnimationController
// class _S5521State extends State<S5521> {
//   double _progress = 0.0;
//   bool _isLoading = false;

//   void _startProgress() {
//     setState(() {
//       _progress = 0.0;
//       _isLoading = true;
//     });
//     Timer.periodic(const Duration(milliseconds: 50), (timer) {
//       setState(() {
//         _progress += 0.01;
//       });
//       if (timer.tick == 100) {
//         setState(() {
//           _isLoading = false;
//           timer.cancel();
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Stack(alignment: Alignment.center, children: [
//             LinearProgressIndicator(
//               minHeight: 20,
//               backgroundColor: Colors.orange[100],
//               value: _progress,
//             ),
//             Text('${_progress == 0.0 ? 0 : (_progress * 100).floor()}%')
//           ]),
//           const SizedBox(height: 16),
//           ElevatedButton(
//               onPressed: _isLoading ? null : _startProgress,
//               child: Text('Start Progress'))
//         ],
//       ),
//     );
//   }
// }
