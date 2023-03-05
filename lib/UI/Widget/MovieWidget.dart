import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movistar/UI/Details/MovieDetailsPage.dart';
import 'package:movistar/Util/Responsive.dart';

class MoviesWidget extends StatelessWidget {
  const MoviesWidget({
    super.key,
    required this.title,
    required this.posterPath,
    required this.id,
  });

  final int id;
  final String posterPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: Responsive.isDesktop(context) ? 20 : 5, top: 10, bottom: 10),
      child: SizedBox(
        height: MediaQuery.of(context).size.width > 900
            ? MediaQuery.of(context).size.height * 0.3
            : MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width > 900
            ? MediaQuery.of(context).size.width * 0.12
            : MediaQuery.of(context).size.width * 0.31,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MovieDetails(
                          id: id.toString(),
                        )));
              },
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.width > 900
                    ? MediaQuery.of(context).size.height * 0.3
                    : MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width > 900
                    ? MediaQuery.of(context).size.width * 0.12
                    : MediaQuery.of(context).size.width * 0.3,
                imageUrl: posterPath,
                fit: BoxFit.cover,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              overflow: TextOverflow.clip,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}