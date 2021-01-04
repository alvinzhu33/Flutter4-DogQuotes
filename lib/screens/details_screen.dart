import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_quotes_4/models/dog.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailsScreen extends StatelessWidget {
  final Dog dog;

  const DetailsScreen({this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // TODO (4): Delete the height of the Container
            // TODO (5): Container.child = CarouselSlider
            // TODO (6): Configure the CarouselOptions as shown below
            // CarouselOptions(
            //   height: 250.0,
            //   autoPlay: true,
            //   enableInfiniteScroll: false,
            //   scrollDirection: Axis.horizontal,
            //   autoPlayInterval: Duration(seconds: 2, milliseconds: 500),
            // )
            // TODO (7): CarouselSlider.items = List of Containers with CachedNetworkImages as children.
            // items: dog.imageUrls
            //     .asMap()
            //     .entries
            //     .map((entry) => Container(
            //           margin: EdgeInsets.symmetric(horizontal: 5.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(20.0),
            //             border: Border.all(
            //               color: Theme.of(context).primaryColorDark,
            //           ),
            //         ),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(20.0),
            //           child: Align(
            //             child: CachedNetworkImage(
            //               fit: BoxFit.cover,
            //               imageUrl: entry.value,
            //               placeholder: (context, url) => Center(
            //                 child: Container(
            //                   height: 25.0,
            //                   width: 25.0,
            //                   child: CircularProgressIndicator(),
            //                 ),
            //               ),
            //               errorWidget: (context, url, error) =>
            //                   Icon(Icons.broken_image),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ))
            // .toList(),

            Container(
              // height: 250.0,
              color: Theme.of(context).primaryColorLight,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  scrollDirection: Axis.horizontal,
                  autoPlayInterval: Duration(seconds: 2, milliseconds: 500),
                ),
                items: dog.imageUrls
                  .asMap()
                  .entries
                  .map((imageUrl) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.brown),
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Align(
                          child: CachedNetworkImage(imageUrl: imageUrl.value, placeholder: (context, url) => Center(
                            child: Container(
                              height: 25.0,
                              width: 25.0,
                              child: CircularProgressIndicator(),
                            )
                          ),),
                        ),
                      ),
                    ),
                  )).toList(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
