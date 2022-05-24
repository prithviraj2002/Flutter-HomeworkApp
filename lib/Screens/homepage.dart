import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:subject_api/Models/subject_class.dart';
import 'package:subject_api/Screens/selected_subject.dart';

import '../Api/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SubjectClass? sc;

  bool isLoading = false;
  bool isAvailable = true;
  //
  // static int _len = 6;
  // List<bool> isChecked = List.generate(_len, (index) => false);



  Map<String, List<String>> storeName = {
    "10th" : [],
    "9th" : [],
    "8th" : [],
    "7th" : [],
    "6th" : [],
    "5th" : [],
    "4th" : [],
    "3rd" : [],
    "2nd" : [],
    "1st" : [],
    "11th" : [],
    "12th" : []


  };

  fetchSubject() async {
    await Future.delayed(const Duration(milliseconds: 500), () async {
      Response response = await ApiServices().fetchAllData(context);
      var decoded = jsonDecode(response.body);
      if (response.statusCode == 200) {
        sc = SubjectClass.fromJson(decoded);
        debugPrint("SC");

        setState(() {
          isLoading = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSubject();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 24,top: 18),
                      child: Icon(Icons.arrow_back_ios,color: Colors.black,),
                    ),


                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child:
                                Image.asset("images/2.png", fit: BoxFit.fill)),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Teacher Profile",
                                    style: GoogleFonts.epilogue(
                                        fontSize: 14, fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Which grades &\nsubjects you teach",
                                    style: GoogleFonts.epilogue(
                                        fontSize: 26, fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    commonFunction(sc!.classess![0].standard.toString()),
                    allStandardView(0),
                    commonFunction(sc!.classess![1].standard.toString()),
                    allStandardView(1),
                    commonFunction(sc!.classess![2].standard.toString()),
                    allStandardView(2),
                    commonFunction(sc!.classess![3].standard.toString()),
                    allStandardView(3),
                    commonFunction(sc!.classess![4].standard.toString()),
                    allStandardView(4),
                    commonFunction(sc!.classess![5].standard.toString()),
                    allStandardView(6),
                    commonFunction(sc!.classess![6].standard.toString()),
                    allStandardView(0),
                    commonFunction(sc!.classess![7].standard.toString()),
                    allStandardView(7),
                    commonFunction(sc!.classess![8].standard.toString()),
                    allStandardView(8),
                    commonFunction(sc!.classess![9].standard.toString()),
                    allStandardView(9),
                    commonFunction(sc!.classess![10].standard.toString()),
                    allStandardView(10),
                    commonFunction(sc!.classess![11].standard.toString()),
                    allStandardView(11),
                  ],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectedSubject(allSubject: storeName),));
        },
        child: Container(
          height: 50,
          width: 330,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(39, 15, 54, 1),
          ),
          child: Text("Continue",style: GoogleFonts.epilogue(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 14,letterSpacing: 1),),
        ),
      ),
    );
  }

  Widget commonFunction(String val) {
    return Expanded(
      flex: 0,
      child: Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.only(bottom: 24, left: 16),
        alignment: Alignment.center,
        child: Text(val, style: GoogleFonts.epilogue(color: Colors.white)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(39, 15, 54, 1),
        ),
      ),
    );
  }

  Widget allStandardView(
    int val,
  ) {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: sc?.classess?[val].subjects?.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent[100],
                        ),
                        height: 132,
                        width: 154,
                        child: Image.network(
                          sc!.classess![val].subjects![index].subjectImage!,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        height: 74,
                        width: 154,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: Checkbox(
                                  onChanged: (checked) {
                                    setState(
                                      () {
                                        // isChecked[index] = checked!;
                                        if(storeName[sc!.classess![val].standard.toString()]!.contains(sc!.classess![val].subjects![index]
                                            .subjectName)){
                                          storeName[sc!.classess![val].standard.toString()]!.remove(sc!.classess![val].subjects![index]
                                        .subjectName);
                                        }else {
                                          storeName[sc!.classess![val].standard.toString()]!.add(sc!.classess![val].subjects![index]
                                              .subjectName!);
                                        }

                                        print(storeName);
                                      },
                                    );
                                  },
                                value: storeName[sc!.classess![val].standard.toString()]!.contains(sc!.classess![val].subjects![index]
                                    .subjectName) ? true : false,
                                  ),
                            ),
                            Flexible(
                                flex: 0,
                                child: sc!.classess![val].subjects![index]
                                            .subjectName!.length >
                                        15
                                    ? Text(
                                        "EVS",
                                        style: GoogleFonts.epilogue(),
                                      )
                                    : Text(
                                        sc!.classess![val].subjects![index]
                                            .subjectName!,
                                        style: GoogleFonts.epilogue(),
                                      )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
