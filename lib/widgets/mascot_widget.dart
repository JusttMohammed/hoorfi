import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Animated mascot widget with different expressions
class MascotWidget extends StatefulWidget {
  final MascotExpression expression;
  final double size;
  final String? customMessage;

  const MascotWidget({
    Key? key,
    this.expression = MascotExpression.neutral,
    this.size = AppSizes.mascotMedium,
    this.customMessage,
  }) : super(key: key);

  @override
  State<MascotWidget> createState() => _MascotWidgetState();
}

class _MascotWidgetState extends State<MascotWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
    
    _bounceAnimation = Tween<double>(begin: 0.0, end: 8.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _bounceAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -_bounceAnimation.value),
              child: child,
            );
          },
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: _getColorForExpression(),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: _buildFace(),
            ),
          ),
        ),
        if (widget.customMessage != null) ...[
          const SizedBox(height: AppSizes.paddingM),
          Container(
            padding: const EdgeInsets.all(AppSizes.paddingM),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow,
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              widget.customMessage!,
              style: AppTextStyles.body.copyWith(
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ],
    );
  }

  Color _getColorForExpression() {
    switch (widget.expression) {
      case MascotExpression.happy:
        return AppColors.accentGreen;
      case MascotExpression.excited:
        return AppColors.accent;
      case MascotExpression.encouraging:
        return AppColors.accentBlue;
      case MascotExpression.celebrating:
        return AppColors.secondary;
      case MascotExpression.neutral:
        return AppColors.primaryLight;
    }
  }

  Widget _buildFace() {
    // This is a simple placeholder - in production, use actual mascot images
    return Text(
      _getEmojiForExpression(),
      style: TextStyle(fontSize: widget.size * 0.5),
    );
  }

  String _getEmojiForExpression() {
    switch (widget.expression) {
      case MascotExpression.happy:
        return '😊';
      case MascotExpression.excited:
        return '🤩';
      case MascotExpression.encouraging:
        return '💪';
      case MascotExpression.celebrating:
        return '🎉';
      case MascotExpression.neutral:
        return '🙂';
    }
  }
}

enum MascotExpression {
  neutral,
  happy,
  excited,
  encouraging,
  celebrating,
}
