import 'package:cineplex/resources/app_colors.dart';
import 'package:cineplex/resources/global_widgets.dart';
import 'package:cineplex/screens/purchase_screen/provider/purchase_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchase2View extends StatefulWidget {
  const Purchase2View({super.key});

  @override
  State<Purchase2View> createState() => _Purchase2ViewState();
}

class _Purchase2ViewState extends State<Purchase2View> {
  final List<Map<String, dynamic>> seatColumn = [
    {
      'seat': {'name': 'A', 'row': 12}
    },
    {
      'seat': {'name': 'B', 'row': 13}
    },
    {
      'seat': {'name': 'C', 'row': 13}
    },
    {
      'seat': {'name': 'D', 'row': 11}
    },
    {
      'seat': {'name': 'E', 'row': 14}
    },
    {
      'seat': {'name': 'F', 'row': 14}
    },
    {
      'seat': {'name': 'G', 'row': 14}
    },
    {
      'seat': {'name': 'H', 'row': 11}
    },
    {
      'seat': {'name': 'K', 'row': 11}
    },
  ];

  @override
  Widget build(BuildContext context) {
    final purchaseProvider = Provider.of<PurchaseProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 5),
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                        ),
                        const Text(
                          'OCCUPIED',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_circle_rounded,
                          color: Colors.red,
                        ),
                        Text(
                          'CHOSEN',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          'MORE',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 0,
              color: Colors.grey[850],
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: CustomPaint(
                painter: BentLinePainter(),
                child: const SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        'SCREEN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              //color: Colors.red,
              margin: const EdgeInsets.only(top: 20),
              alignment: Alignment.center,
              height: purchaseProvider.isZoom ? 500 : 260,
              //color: Colors.red,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 10, left: 10,right: 10),
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      seatColumn.length,
                      (index) {
                        return Center(
                          child: Row(
                            children: [
                              Text(
                                seatColumn[index]['seat']['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: purchaseProvider.isZoom ? 30 : 18,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: List.generate(
                                  seatColumn[index]['seat']['row'],
                                  (rowIndex) {
                                    return GestureDetector(
                                      onTap: () {
                                        purchaseProvider.selectSeat(
                                            seatColumn[index]['seat']['name'],
                                            (rowIndex + 1).toString());
                                      },
                                      child: FittedBox(
                                        child: Container(
                                          margin: purchaseProvider.isZoom
                                              ? const EdgeInsets.only(
                                                  right: 8, bottom: 8)
                                              : const EdgeInsets.only(right: 5),
                                          height:
                                              purchaseProvider.isZoom ? 45 : 15,
                                          width:
                                              purchaseProvider.isZoom ? 45 : 15,
                                          decoration: BoxDecoration(
                                            color: purchaseProvider
                                                    .selectedSeatList
                                                    .contains(seatColumn[index]
                                                            ['seat']['name'] +
                                                        (rowIndex + 1)
                                                            .toString())
                                                ? Colors.grey
                                                : Colors.white,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: purchaseProvider
                                                      .isZoom
                                                  ? const Radius.circular(15)
                                                  : const Radius.circular(5),
                                              bottomRight: purchaseProvider
                                                      .isZoom
                                                  ? const Radius.circular(15)
                                                  : const Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 55,
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                purchaseProvider.toggleZoom();
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[600]),
                child: purchaseProvider.isZoom
                    ? const Icon(
                        Icons.zoom_out,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.zoom_in,
                        color: Colors.white,
                      ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: GlobalWidgets.customButton(
                childWidget: Text(
                  purchaseProvider.selectedSeatList.isEmpty
                      ? 'PLEASE SELECT SEATS'
                      : 'NEXT STEP',
                  style: TextStyle(
                      color: purchaseProvider.selectedSeatList.isEmpty
                          ? Colors.grey[700]
                          : Colors.white),
                ),
                color: purchaseProvider.selectedSeatList.isEmpty
                    ? AppColors.disableButtonColor
                    : Colors.red,
                onPressed: () {
                  if (purchaseProvider.selectedSeatList.isNotEmpty) {
                    purchaseProvider.navigateToNextPage();
                  }
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: AnimatedContainer(
          padding: const EdgeInsets.all(10),
          duration: const Duration(milliseconds: 300),
          decoration: const BoxDecoration(
            color: AppColors.appBarBgColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          curve: Curves.easeInOut,
          height: purchaseProvider.containerHeight,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Total Seats: ${purchaseProvider.selectedSeatList.length}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Total Amount: ${purchaseProvider.selectedSeatList.length * 200}',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: GestureDetector(
                        onTap: () {
                          purchaseProvider.toggleContainer();
                        },
                        child: purchaseProvider.isExpanded
                            ? const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Price: 1x 200',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Selected Seats:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: purchaseProvider.selectedSeatList.length,
                    itemBuilder: (context, index) {
                      return Text(
                        '${purchaseProvider.selectedSeatList[index]}, ',
                        style: const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class BentLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(size.width / 2, -20, size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
