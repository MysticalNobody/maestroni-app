import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:maestroni/res/assets/assets.gen.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({required this.image, this.onPressed, Key? key})
      : super(key: key);
  final String image;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: SizedBox(
        height: 150,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: CupertinoButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            minSize: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FastCachedImage(
                url: image,
                width: MediaQuery.of(context).size.width,
                errorBuilder: (_, __, ___) =>
                    Assets.images.noImage.image(fit: BoxFit.fitWidth),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
