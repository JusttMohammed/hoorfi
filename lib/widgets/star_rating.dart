import 'package:flutter/material.dart';
import '../utils/constants.dart';

/// Star rating display widget
class StarRating extends StatelessWidget {
  final int maxStars;
  final int earnedStars;
  final double size;
  final bool showCount;

  const StarRating({
    Key? key,
    this.maxStars = 3,
    this.earnedStars = 0,
    this.size = AppSizes.iconM,
    this.showCount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(maxStars, (index) {
          final isEarned = index < earnedStars;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(
              isEarned ? Icons.star : Icons.star_border,
              color: isEarned ? AppColors.starGold : AppColors.starSilver,
              size: size,
            ),
          );
        }),
        if (showCount) ...[
          const SizedBox(width: AppSizes.paddingS),
          Text(
            '$earnedStars/$maxStars',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ],
    );
  }
}

/// Animated star collection widget
class AnimatedStar extends StatefulWidget {
  final bool show;
  final VoidCallback? onComplete;

  const AnimatedStar({
    Key? key,
    required this.show,
    this.onComplete,
  }) : super(key: key);

  @override
  State<AnimatedStar> createState() => _AnimatedStarState();
}

class _AnimatedStarState extends State<AnimatedStar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppAnimations.normal,
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });
  }

  @override
  void didUpdateWidget(AnimatedStar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.show && !oldWidget.show) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.show) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value * 2 * 3.14159,
            child: Icon(
              Icons.star,
              color: AppColors.starGold,
              size: AppSizes.iconXL,
            ),
          ),
        );
      },
    );
  }
}
