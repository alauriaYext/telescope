import 'package:flutter/material.dart';
import 'package:telescope/components/generic_button.dart';
import 'package:telescope/home/yexter_content.dart';
import 'package:telescope/style_guide/palette.dart';
import 'package:telescope/style_guide/text_styles.dart';

class YexterCard extends StatelessWidget {
  final UNKNOWN_IMAGE_URL =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1084px-Unknown_person.jpg';
  final YexterContent _content;
  YexterCard(this._content);

  @override
  Widget build(BuildContext context) {
    return GenericButton(
      onTap: () => print('TODO'),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.gray2,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                color: Palette.gray3,
                child: FadeInImage.assetNetwork(
                  image: _content.photoUrl ?? UNKNOWN_IMAGE_URL,
                  placeholder: 'assets/images/unknown_person.jpeg',
                  width: 140,
                  height: 140,
                  fadeInDuration: Duration(milliseconds: 75),
                  fadeOutDuration: Duration(milliseconds: 75),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      _content.name,
                      style: TextStyles.textL.bold(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Center(
                    child: Text(_content.jobTitle,
                        style: TextStyles.textXS.offBlack(),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: Palette.gray10,
                          size: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 1, bottom: 1),
                          child: Text(
                            _content.officeName ?? 'N/A',
                            style: TextStyles.textS.offBlack().bold(),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      additionalAttribute('team', _content.team),
                      additionalAttribute('email', _content.email),
                      additionalAttribute('myers briggs', _content.myersBriggs),
                      additionalAttribute('manager', _content.managerName),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget additionalAttribute(String label, String? value) {
    return Row(
      children: [
        Container(width: 25),
        Text('$label: ',
            style: TextStyles.textXS.bold(), overflow: TextOverflow.ellipsis),
        Expanded(
          child: Text(value ?? 'N/A',
              style: TextStyles.textXS.offBlack(),
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
