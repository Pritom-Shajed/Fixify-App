import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_app/utils/app_colors.dart';
import 'package:fixify_app/utils/dimensions.dart';
import 'package:fixify_app/widgets/shimmer_effect/circle_shimmer_widget.dart';
import 'package:flutter/material.dart';

class NotificationCards {
  static Widget notificationCardCustomer(
      {required String imageUrl,
      required String title,
      required String subtitle,
      required VoidCallback onTapDelete}) {
    return ListTile(
      tileColor: AppColors.primaryColorLight.withOpacity(0.2),
      leading: CachedNetworkImage(
          imageUrl:
              imageUrl,
          imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: Dimensions.radius20 * 1.5,
                backgroundImage: imageProvider,
              ),
          placeholder: (context, url) => ShimmerWidgetCircle(
                radius: Dimensions.radius20 * 1.5,
              )),
      trailing: IconButton(
          onPressed: onTapDelete,
          icon: Icon(
            Icons.delete_forever,
            color: AppColors.negativeColor,
            size: Dimensions.width10*2.5,
          )),
      title: Text(
        title,
        style:
            TextStyle(fontWeight: FontWeight.w600, fontSize: Dimensions.font16),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: Dimensions.font12),
      ),
    );
  }
}
