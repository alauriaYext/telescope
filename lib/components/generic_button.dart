import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GenericButton extends StatefulWidget {
  final Widget _child;
  final VoidCallback _onTap;

  GenericButton({required VoidCallback onTap, required Widget child})
      : _child = child,
        _onTap = onTap;

  @override
  _GenericButtonState createState() => _GenericButtonState();
}

class _GenericButtonState extends State<GenericButton> {
  var _isHovering = false;
  var _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovering = false;
        });
      },
      child: button(),
    );
  }

  Widget button() {
    return Opacity(
      opacity: _isClicked || _isHovering ? 0.85 : 1.0,
      child: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _isClicked = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _isClicked = false;
          });
          widget._onTap();
        },
        child: widget._child,
      ),
    );
  }
}
