import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technaureus/app/customers/model/customer.dart';
import 'package:technaureus/core/utils/app_colors.dart';
import 'package:technaureus/core/utils/app_urls.dart';
import 'package:technaureus/core/utils/size_extenstion.dart';
import 'package:url_launcher/url_launcher.dart';

class CostomerTile extends StatelessWidget {
  final Customer customer;
  final Function()? onTap;
  const CostomerTile({super.key, required this.customer, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        height: 13.h,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade300)],
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 22.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl:
                        AppUrls.mediaBaseUrl + customer.profilePic.toString(),
                    errorWidget: (context, url, error) {
                      return const Center(
                        child: Icon(Icons.error),
                      );
                    },
                  ),
                ),
              ),
              const VerticalDivider(),
              SizedBox(
                width: 45.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customer.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      'ID: ${customer.id}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '${customer.street}, ${customer.streetTwo}, ${customer.city}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    5.height,
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                              text: 'Due Amount: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          TextSpan(
                            text: '\$${1000 % customer.id!}',
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => launch('tel://${customer.mobileNumber}'),
                    child: const Icon(
                      CupertinoIcons.phone_circle_fill,
                      color: Colors.blue,
                      size: 22,
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        launch('https://wa.me/${customer.mobileNumber}'),
                    child: Image.asset(
                      'assets/icons/whatsapp.png',
                      height: 20,
                      width: 20,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
