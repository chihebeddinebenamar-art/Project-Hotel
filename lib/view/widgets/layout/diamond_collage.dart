import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Mosaïque de losanges (images tournées) pour l’écran d’accueil onboarding.
class DiamondCollage extends StatelessWidget {
  const DiamondCollage({super.key, required this.assetPaths});

  final List<String> assetPaths;

  @override
  Widget build(BuildContext context) {
    assert(assetPaths.length >= 5, 'La mosaïque attend 5 chemins d’assets.');
    // Grille 3×3 : 5 losanges en croix (image1…5).
    final cells = <_Cell>[
      _Cell(0, 0, assetPaths[0]),
      _Cell(0, 2, assetPaths[1]),
      _Cell(1, 1, assetPaths[2]),
      _Cell(2, 0, assetPaths[3]),
      _Cell(2, 2, assetPaths[4]),
    ];

    const cell = 72.0;
    const gap = 6.0;
    final width = cell * 3 + gap * 2;
    final height = cell * 3 + gap * 2;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          for (final c in cells)
            Positioned(
              left: c.col * (cell + gap),
              top: c.row * (cell + gap),
              child: _DiamondTile(size: cell, assetPath: c.path),
            ),
        ],
      ),
    );
  }
}

class _Cell {
  _Cell(this.row, this.col, this.path);
  final int row;
  final int col;
  final String path;
}

class _DiamondTile extends StatelessWidget {
  const _DiamondTile({required this.size, required this.assetPath});

  final double size;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    // Image droite dans un carré, puis masque losange (effet « tuile Figma »).
    return ClipPath(
      clipper: _DiamondClipper(),
      child: SizedBox(
        width: size,
        height: size,
        child: Transform.rotate(
          angle: -math.pi / 4,
          child: Transform.scale(
            scale: 1.45,
            child: Image.asset(assetPath, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

class _DiamondClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final p = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height / 2)
      ..close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
