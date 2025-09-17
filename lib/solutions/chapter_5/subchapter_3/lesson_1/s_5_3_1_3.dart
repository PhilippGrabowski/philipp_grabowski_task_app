import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class S5313 extends StatelessWidget {
  const S5313({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 200,
          height: 200,
          child: CachedNetworkImage(
            imageUrl:
                'https://www.amny.com/wp-content/uploads/2022/08/GettyImages-523538287.jpg?quality=51&resize=900,601',
            fit: BoxFit.cover,
          )),
    );
  }
}
