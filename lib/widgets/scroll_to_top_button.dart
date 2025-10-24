import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;

  const ScrollToTopButton({super.key, required this.scrollController});

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (widget.scrollController.offset >= 400 && !_showButton) {
      setState(() => _showButton = true);
    } else if (widget.scrollController.offset < 400 && _showButton) {
      setState(() => _showButton = false);
    }
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _showButton ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: _showButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: AppColors.goldAccent,
              child: const Icon(Icons.arrow_upward, color: AppColors.deepBlack),
            )
          : const SizedBox.shrink(),
    );
  }
}
