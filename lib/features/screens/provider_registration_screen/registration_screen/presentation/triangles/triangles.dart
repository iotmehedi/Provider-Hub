import 'package:flutter/material.dart';

class RightTriangel extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 10.0;
    Path path = Path();
    path.moveTo(radius, 0); // Start just after the top-left curve
    path.lineTo(size.width - size.height / 2, 0); // Top straight line
    path.lineTo(size.width, size.height / 2); // Draw the triangle
    path.lineTo(size.width - size.height / 2, size.height); // Bottom straight line
    path.lineTo(radius, size.height); // Bottom-left straight line
    path.quadraticBezierTo(0, size.height, 0, size.height - radius); // Bottom-left curve
    path.lineTo(0, radius); // Left straight line
    path.quadraticBezierTo(0, 0, radius, 0); // Top-left curve
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BothTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double triangleSize = size.height / 2; // Size of the triangles

    // Left triangle (facing inward)
    path.moveTo(size.width/5, size.height / 2); // Start at the middle left
    path.lineTo(triangleSize, 0); // Top-left point of the triangle
    path.lineTo(triangleSize, size.height); // Bottom-left point of the triangle
    path.close();

    // Middle rectangle
    path.addRect(Rect.fromLTWH(triangleSize, 0, size.width - 2 * triangleSize, size.height));

    // Right triangle (facing inward)
    path.moveTo(size.width, size.height / 2); // Start at the middle right
    path.lineTo(size.width - triangleSize, 0); // Top-right point of the triangle
    path.lineTo(size.width - triangleSize, size.height); // Bottom-right point of the triangle
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
class LeftTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double triangleSize = size.height / 2; // Size of the left triangle
    double radius = 10.0; // Radius for the right-side curve

    // Left triangle (facing inward)
    path.moveTo(size.width / 5, size.height / 2); // Start at the middle left
    path.lineTo(triangleSize, 0); // Top-left point of the triangle
    path.lineTo(triangleSize, size.height); // Bottom-left point of the triangle
    path.close(); // Close the left triangle

    // Middle rectangle
    path.addRect(Rect.fromLTWH(triangleSize, 0, size.width - 2 * triangleSize - radius, size.height));

    // Right side with curved corners
    path.lineTo(size.width - radius, 0); // Move to the top-right start of the curve
    path.quadraticBezierTo(
        size.width, 0, // Control point for the curve
        size.width, radius // End point of the curve
    );
    path.lineTo(size.width, size.height - radius); // Move to the bottom-right curve
    path.quadraticBezierTo(
        size.width, size.height, // Control point for the curve
        size.width - radius, size.height // End point of the curve
    );
    // path.lineTo(size.height, 0);
    path.lineTo(size.width, size.height + 17); // Connect to the bottom-left of the triangle

    path.close(); // Close the path to complete the shape

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
