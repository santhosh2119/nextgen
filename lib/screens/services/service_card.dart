import 'package:flutter/material.dart';
import 'package:nextgen/utils/colors.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.name,
    required this.buttonText,
    required this.problem,
    required this.width,
    required this.marginRight,
    required this.pressed,
  }) : super(key: key);
  final String name;
  final String buttonText;
  final String problem;
  final double width;
  final double marginRight;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      margin: EdgeInsets.only(
        right: marginRight,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: ConstantColors().borderColor),
          borderRadius: BorderRadius.circular(9)),
      padding: const EdgeInsets.fromLTRB(13, 15, 13, 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ServiceCardContents(
              name: name,
              problem: problem,
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: ConstantColors().primaryColor, elevation: 0),
              onPressed: pressed,
              child: Text(
                buttonText,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ))
        ],
      ),
    );
  }
}

class ServiceCardContents extends StatelessWidget {
  const ServiceCardContents({
    Key? key,
    required this.name,
    required this.problem,
  }) : super(key: key);

  final String name;
  final String problem;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          child: Text(name[0].toString().toUpperCase()),
        ),
       const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //service name ======>
              SizedBox(
                width: 200,
                child: Text(
                  name,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ConstantColors().greyFour,
                    fontSize: 15,
                    height: 1.4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              //Author name
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  problem,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ConstantColors().greyFour,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
