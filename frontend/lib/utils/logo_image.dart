import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key, this.source});

  final String? source;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Image.network(
        source ??
            'https://wwohqlpxrsvgdyijgmgc.supabase.co/storage/v1/object/public/images/logo.png?t=2025-01-19T00%3A25%3A45.705Z',
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return const Icon(Icons.error);
        },
      ),
    );
  }
}
