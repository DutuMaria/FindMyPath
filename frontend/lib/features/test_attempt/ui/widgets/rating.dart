import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showRatingDialog(
    BuildContext context,
    Function(int, int) onSubmit,
    ) async {
  int experienceRating = 0;
  int contentRating = 0;

  Widget ratingStars(bool isAndroid, StateSetter setState, int selectedRating, Function(int) onRatingSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              onRatingSelected(index + 1);
            });
          },
          child: Icon(
            index < selectedRating
                ? (isAndroid ? Icons.star_rounded : CupertinoIcons.star_fill)
                : (isAndroid ? Icons.star_border_rounded : CupertinoIcons.star),
            color: Colors.amber,
            size: 30,
          ),
        );
      }),
    );
  }

  if (Platform.isAndroid) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: const Text(
              'Rate',
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white,
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Experience'),
                      ratingStars(true, setState, experienceRating, (rating) {
                        experienceRating = rating;
                      }),
                      const SizedBox(height: 20),
                      const Text('Test Content'),
                      ratingStars(true, setState, contentRating, (rating) {
                        contentRating = rating;
                      }),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: (experienceRating > 0 && contentRating > 0)
                            ? () {
                          onSubmit(experienceRating, contentRating);
                          Navigator.of(context, rootNavigator: true).pop();
                        }
                            : null,
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  } else {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: CupertinoAlertDialog(
            title: const Text('Rate'),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Experience'),
                      ratingStars(false, setState, experienceRating, (rating) {
                        experienceRating = rating;
                      }),
                      const SizedBox(height: 20),
                      const Text('Test Content'),
                      ratingStars(false, setState, contentRating, (rating) {
                        contentRating = rating;
                      }),
                      const SizedBox(height: 20),
                      CupertinoDialogAction(
                        onPressed: (experienceRating > 0 && contentRating > 0)
                            ? () {
                          onSubmit(experienceRating, contentRating);
                          Navigator.of(context).pop();
                        }
                            : null,
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}