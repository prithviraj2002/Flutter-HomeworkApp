import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedSubject extends StatefulWidget {
  final Map<String, List<String>> allSubject;
  const SelectedSubject({Key? key, required this.allSubject}) : super(key: key);

  @override
  _SelectedSubjectState createState() => _SelectedSubjectState();
}

class _SelectedSubjectState extends State<SelectedSubject> {
  List<String> stand = [
    "10th",
    "9th",
    "8th",
    "7th",
    "6th",
    "5th",
    "4th",
    "3rd",
    "2nd",
    "1st",
    "11th",
    "12th",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,

        child: Column(
          children: [

            Stack(
              alignment: Alignment.centerRight,
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Image.asset("images/21.png", fit: BoxFit.fill)),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "welcome",
                            style: GoogleFonts.epilogue(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You teach these\nclass & subjects",
                            style: GoogleFonts.epilogue(
                                fontSize: 26, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            displayAllSubject(),
          ],
        ),
      )),
      floatingActionButton: Container(
        height: 50,
        width: 330,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(39, 15, 54, 1),
        ),
        child: Text("Thank You",style: GoogleFonts.epilogue(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14,letterSpacing: 1),),
      ),
    );
  }

  Widget displayAllSubject() {
    return Expanded(
      flex: 0,
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.5,
        child: ListView.builder(
          itemCount: 12,
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, val) {
            print(widget.allSubject[val]);

            return widget.allSubject[stand[val]]?.length == 0
                ? Container()
                : Expanded(
                    flex: 2,
                    child: SizedBox(

                      child: ListView.builder(
                        itemCount:
                            widget.allSubject[stand[val]]?.length,
                        shrinkWrap: true,
                        // scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 64,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey.shade200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,


                                    alignment: Alignment.center,
                                    child: Text(stand[val],
                                        style: GoogleFonts.epilogue(
                                            color: Colors.white)),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          const Color.fromRGBO(39, 15, 54, 1),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(widget.allSubject[stand[val]]![index],style: GoogleFonts.epilogue(color: Colors.black)),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

}
