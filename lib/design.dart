import 'package:flutter/material.dart';
import 'package:pagination/model.dart';

class DesignContainer extends StatelessWidget {
  const DesignContainer({
    super.key,
    required this.data,
  });
  final Welcome data;

  @override
  Widget build(BuildContext context) {
    final Color color = _getColorFromHex(data.color);
    return Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(0, 6)),
            ]),
        child: Column(
          children: [
            listItem('ID : ', data.id),
            listItem('Title : ', data.title),
            listItem('Color : ', data.color),
            listItem('Lebel : ', data.label),
            data.year < 2000 ?
            listItem('Year : ', data.year) :
            listItem('Artist Id : ', data.artistId),
            listItem('Listens : ', data.listens),
            listItem('Cover : ', data.cover)
          ],
        ));
  }

  listItem(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontFamily: 'JF',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white)),
          Expanded(
              child: Text(
            value.toString(),
            maxLines: 2,
            style: const TextStyle(
                fontFamily: 'JF',
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ))
        ],
      ),
    );
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', ''); // Remove the '#' character
    return Color(int.parse(
        '0xFF$hexColor')); // Convert the hex color string to Color object
  }
}
