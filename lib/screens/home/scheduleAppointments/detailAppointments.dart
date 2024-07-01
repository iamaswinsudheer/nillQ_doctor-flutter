import 'package:flutter/material.dart';

class DetailAppoinmnets extends StatefulWidget {
  final Map<String, String> appointments;
  const DetailAppoinmnets({super.key, required this.appointments});

  @override
  State<DetailAppoinmnets> createState() => _DetailAppoinmnetsState();
}

class _DetailAppoinmnetsState extends State<DetailAppoinmnets> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenSize.width * 0.03),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.03,
            vertical: screenSize.height * 0.03),
        child: ListView(
          children: [
            Text(
              'Days :',
              style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Text(
              widget.appointments['customDays']!.isEmpty
                  ? '${widget.appointments['fromDate']} to ${widget.appointments['endDate']}'
                  : widget.appointments['customDays']!,
              style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
            ),
            Divider(
              height: screenSize.height * 0.05,
              thickness: 2.0,
            ),
            Text('TimeSlots :',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: screenSize.height * 0.01,
            ),
            Text(
              widget.appointments['timeSlots']!,
              style: TextStyle(color: Colors.grey[800], fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}
