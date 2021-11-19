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
                  width: 150,
                  height: 150,
                  fadeInDuration: Duration(milliseconds: 75),
                  fadeOutDuration: Duration(milliseconds: 75),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    _content.name,
                    style: TextStyles.textL.bold(),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(_content.jobTitle,
                      style: TextStyles.textXS.offBlack(),
                      overflow: TextOverflow.ellipsis),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
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
                  additionalAttribute('email', _content.email),
                  additionalAttribute('manager', _content.managerName),
                  additionalAttribute('myers briggs', _content.myersBriggs),
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$label: ',
            style: TextStyles.textXS.bold(), overflow: TextOverflow.ellipsis),
        Text(value ?? 'N/A',
            style: TextStyles.textXS.offBlack(),
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
