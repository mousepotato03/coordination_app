import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../riverpod/my_size_info_provider.dart';

class CustomTextField extends ConsumerStatefulWidget {
  final String label;
  final String field;
  final String? value;
  final String? unit;
  final bool isEditMode;

  const CustomTextField({
    super.key,
    required this.label,
    required this.field,
    this.value,
    this.unit,
    this.isEditMode = false,
  });

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value ?? '';
    }
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && widget.isEditMode) {
      ref.read(mySizeInfoProvider.notifier).updateField(
            widget.field,
            _controller.text,
          );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100,
          child: Text(widget.label, style: const TextStyle(fontSize: 16)),
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: widget.isEditMode,
            style: TextStyle(
              color: widget.isEditMode ? Colors.black : Colors.grey[600],
              fontSize: 16,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: const UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isEditMode ? Colors.black : Colors.grey[400]!,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              suffixText: widget.unit,
              suffixStyle: TextStyle(
                color: widget.isEditMode ? Colors.black : Colors.grey[600],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
