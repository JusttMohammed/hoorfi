import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../models/lesson.dart';
import 'star_rating.dart';

/// Card widget for displaying a lesson in the lesson path
class LessonCard extends StatefulWidget {
  final Lesson lesson;
  final bool isLocked;
  final bool isCompleted;
  final int starsEarned;
  final VoidCallback onTap;

  const LessonCard({
    Key? key,
    required this.lesson,
    required this.isLocked,
    required this.isCompleted,
    required this.starsEarned,
    required this.onTap,
  }) : super(key: key);

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (!widget.isLocked) {
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: widget.isLocked ? null : widget.onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: AppSizes.lessonCardWidth,
          height: AppSizes.lessonCardHeight,
          decoration: BoxDecoration(
            color: _getCardColor(),
            borderRadius: BorderRadius.circular(AppSizes.radiusL),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Letter display
                  Text(
                    widget.lesson.letter.character,
                    style: AppTextStyles.letterMedium.copyWith(
                      color: widget.isLocked
                          ? AppColors.locked
                          : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSizes.paddingS),
                  // Letter name
                  Text(
                    widget.lesson.letter.name,
                    style: AppTextStyles.body.copyWith(
                      color: widget.isLocked
                          ? AppColors.locked
                          : AppColors.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSizes.paddingS),
                  // Stars if completed
                  if (widget.isCompleted)
                    StarRating(
                      maxStars: widget.lesson.totalStars,
                      earnedStars: widget.starsEarned,
                      size: 20,
                    ),
                ],
              ),
              // Lock icon
              if (widget.isLocked)
                Positioned(
                  top: AppSizes.paddingS,
                  left: AppSizes.paddingS,
                  child: Container(
                    padding: const EdgeInsets.all(AppSizes.paddingS),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.lock,
                      color: AppColors.locked,
                      size: AppSizes.iconS,
                    ),
                  ),
                ),
              // Checkmark if completed
              if (widget.isCompleted)
                Positioned(
                  top: AppSizes.paddingS,
                  right: AppSizes.paddingS,
                  child: Container(
                    padding: const EdgeInsets.all(AppSizes.paddingS),
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: AppSizes.iconS,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCardColor() {
    if (widget.isLocked) {
      return AppColors.surfaceLight;
    } else if (widget.isCompleted) {
      return AppColors.success.withOpacity(0.1);
    } else {
      return AppColors.cardBackground;
    }
  }
}
