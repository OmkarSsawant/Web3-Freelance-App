import 'package:flutter/material.dart';

class ProjectStatusScreen extends StatefulWidget {
  const ProjectStatusScreen({super.key});

  @override
  State<ProjectStatusScreen> createState() => _ProjectStatusScreenState();
}

class _ProjectStatusScreenState extends State<ProjectStatusScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Status"),
      ),
      body: SizedBox(
        child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return TrackingStepWidget(
                  title: "title$index", date: "date$index", completed: true);
            }),
      ),
    );
  }
}

class TrackingStepWidget extends StatelessWidget {
  final String title;
  final String date;
  final bool completed;

  const TrackingStepWidget({
    required this.title,
    required this.date,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: completed ? Colors.green : Colors.grey,
                ),
              ),
              LineAnimationWidget()
            ],
          ),
          SizedBox(width: 16.0),
          Text(title, style: TextStyle(fontSize: 16.0)),
          Spacer(),
          Text(date, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
        ],
      ),
    );
  }
}

class LineAnimationWidget extends StatefulWidget {
  const LineAnimationWidget({Key? key}) : super(key: key);

  @override
  State<LineAnimationWidget> createState() => _LineAnimationWidgetState();
}

class _LineAnimationWidgetState extends State<LineAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _colorAnimation = _controller.drive(ColorTween(
      begin: Colors.grey,
      end: Colors.green,
    ));
    _heightAnimation = _controller
        .drive(CurveTween(curve: Curves.easeOut))
        .drive(Tween<double>(begin: 0, end: 200));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter: LinePainter(color: _colorAnimation.value),
          size: Size(double.infinity, _heightAnimation.value),
        );
      },
    );
  }
}

class LinePainter extends CustomPainter {
  final Color? color;

  LinePainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.grey
      ..strokeWidth = 5;
    canvas.drawLine(Offset.zero, Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
