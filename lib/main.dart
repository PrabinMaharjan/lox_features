import 'package:confirmation/model/license_plate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<double> _animationIcon;
  late Animation<double> _translateButton;
  final Curve _curve = Curves.easeOut;
  final double _fabHeight = 56.0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(microseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animationIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    
    _translateButton = Tween<double>(begin: _fabHeight, end: -14).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.00, 1.00, curve: _curve)));

    super.initState();
  }
  
  showAlertDialog(BuildContext context) {
    Widget closeButton = ElevatedButton(
      child: const Text("Close"),
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(primary: Colors.grey),
    );

    // set up the AlertDialog
    // AlertDialog alert = AlertDialog(
    //   backgroundColor: const Color.fromARGB(255, 223, 229, 234),
    //   title: const Text("Confirmation Summary"),
    //   content: StatefulBuilder(builder: (context, state) {
    //     return SizedBox(
    //       width: MediaQuery.of(context).size.width * 0.9,
    //       height: MediaQuery.of(context).size.height * 0.5,
    //       child: SingleChildScrollView(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const Text("Items"),
    //                 ElevatedButton(
    //                   onPressed: () {},
    //                   child: const Text("Print Items"),
    //                   style: ElevatedButton.styleFrom(primary: Colors.orange),
    //                 ),
    //               ],
    //             ),
    //             Container(
    //               height: 25,
    //               color: Colors.white,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   const Text("Regular"),
    //                   SizedBox(
    //                       width: 30,
    //                       height: 30,
    //                       child: IconButton(
    //                           onPressed: () {
    //                             setState(() {
    //                               print("tapped$showRegularItems");
    //                               showRegularItems = !showRegularItems;
    //                             });
    //                           },
    //                           icon: showRegularItems == true
    //                               ? const Icon(Icons.keyboard_arrow_up_outlined)
    //                               : const Icon(
    //                                   Icons.keyboard_arrow_down_outlined)))
    //                 ],
    //               ),
    //             ),
    //             showRegularItems == true
    //                 ? Container(
    //                     color: Colors.grey[200],
    //                     child: Column(
    //                       children: [
    //                         Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           children: const [
    //                             SizedBox(
    //                               width: 100,
    //                               child: Text(
    //                                 "BATCH / SERIAL NUMBER",
    //                                 maxLines: 2,
    //                                 style: TextStyle(fontSize: 12),
    //                               ),
    //                             ),
    //                             SizedBox(
    //                                 width: 60,
    //                                 child: Text(
    //                                   "Quantity",
    //                                   style: TextStyle(fontSize: 12),
    //                                 )),
    //                             SizedBox(
    //                                 width: 60,
    //                                 child: Text(
    //                                   "Inspected",
    //                                   style: TextStyle(fontSize: 12),
    //                                 )),
    //                           ],
    //                         ),
    //                         ListView.separated(
    //                           shrinkWrap: true,
    //                           itemCount: 1,
    //                           itemBuilder: (context, index) {
    //                             return Container(
    //                               color: Colors.grey[300],
    //                               child: Row(
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   SizedBox(
    //                                     width: 100,
    //                                     child: Text("R${index + 1}"),
    //                                   ),
    //                                   const SizedBox(
    //                                       width: 60, child: Text("2")),
    //                                   const SizedBox(
    //                                       width: 60, child: Text(" "))
    //                                 ],
    //                               ),
    //                             );
    //                           },
    //                           separatorBuilder: (context, index) {
    //                             return const SizedBox(
    //                               height: 4,
    //                             );
    //                           },
    //                         ),
    //                       ],
    //                     ),
    //                   )
    //                 : Container(),
    //             Container(
    //               height: 25,
    //               color: Colors.white,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   const Text("Batch"),
    //                   SizedBox(
    //                       width: 30,
    //                       height: 30,
    //                       child: IconButton(
    //                           onPressed: () {},
    //                           icon: const Icon(
    //                               Icons.keyboard_arrow_down_outlined)))
    //                 ],
    //               ),
    //             ),
    //             Container(
    //               height: 25,
    //               color: Colors.white,
    //               child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   const Text("Serial"),
    //                   SizedBox(
    //                       width: 30,
    //                       height: 30,
    //                       child: IconButton(
    //                           onPressed: () {},
    //                           icon: const Icon(
    //                               Icons.keyboard_arrow_down_outlined)))
    //                 ],
    //               ),
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const Text("Liscense Plates"),
    //                 ElevatedButton(
    //                   onPressed: () {},
    //                   child: const Text("Print LPs"),
    //                   style: ElevatedButton.styleFrom(primary: Colors.orange),
    //                 ),
    //               ],
    //             ),
    //             ListView.separated(
    //               physics: const NeverScrollableScrollPhysics(),
    //               itemCount: 8,
    //               shrinkWrap: true,
    //               itemBuilder: (context, index) {
    //                 return Container(
    //                   height: 25,
    //                   color: Colors.white,
    //                   child: Text("LP-CHECK -${index + 1}"),
    //                 );
    //               },
    //               separatorBuilder: (context, index) {
    //                 return const SizedBox(height: 4);
    //               },
    //             )
    //           ],
    //         ),
    //       ),
    //     );
    //   }),
    //   actions: [
    //     Align(alignment: Alignment.center, child: closeButton),
    //   ],
    // );

    // show the dialog
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return OpenAlertDialog(closeButton: closeButton);
        },
      );
    });
  }

  showAlertDialogLPs(BuildContext context) {
    Widget closeButton = ElevatedButton(
      child: const Text("Close"),
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(primary: Colors.grey),
    );

    Widget saveButton = ElevatedButton(
      child: const Text("Save"),
      onPressed: () {
        Navigator.pop(context);
      },
      style: ElevatedButton.styleFrom(primary: Colors.orange),
    );

  
    // show the dialog
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return OpenAlertDialogLPs(closeButton: closeButton, saveButton: saveButton,);
        },
      );
    });
  }

  Widget alertDialog() {
    return Container(
      child: FloatingActionButton(
        //onPressed: (){},
        onPressed: () {
          showAlertDialog(context);
        },
        tooltip: 'Confirm',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget generateLPs() {
    return Container(
      child: FloatingActionButton(
        //onPressed: (){},
        onPressed: () {
          showAlertDialogLPs(context);
        },
        tooltip: 'LPs',
        child: const Icon(Icons.add),
      ),
    );
  }

animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget buttonToggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: animate,
        tooltip: "Toggle",
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animationIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(child: Container()),
      // floatingActionButton: FloatingActionButton(
      //   //onPressed: (){},
      //   onPressed: () {
      //     showAlertDialog(context);
      //   },
      //   tooltip: 'Confirm',
      //   child: const Icon(Icons.add),
      // ),
      floatingActionButton: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(
                            0.0, _translateButton.value * 2.0, 0.0),
                        child: alertDialog(),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            0.0, _translateButton.value, 0.0),
                        child: generateLPs(),
                      ),
                      buttonToggle()
                    ],
                  ),
    );
  }
}

class OpenAlertDialog extends StatefulWidget {
  const OpenAlertDialog({
    Key? key,
    required this.closeButton,
  }) : super(key: key);

  final Widget closeButton;

  @override
  State<OpenAlertDialog> createState() => _OpenAlertDialogState();
}

class _OpenAlertDialogState extends State<OpenAlertDialog> {
  bool showRegularItems = false;
  bool showBatchItems = false;
  bool showSerialItems = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 223, 229, 234),
      title: const Text("Confirmation Summary"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Items"),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Print Items"),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),
                ],
              ),
              Container(
                height: 25,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Regular"),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            print("tapped$showRegularItems");
                            showRegularItems = !showRegularItems;
                          });
                        },
                        icon: showRegularItems == true
                            ? const Icon(Icons.keyboard_arrow_up_outlined)
                            : const Icon(Icons.keyboard_arrow_down_outlined),
                      ),
                    ),
                  ],
                ),
              ),
              showRegularItems == true
                  ? Container(
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "BATCH / SERIAL NUMBER",
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                  width: 60,
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(fontSize: 12),
                                  )),
                              SizedBox(
                                  width: 60,
                                  child: Text(
                                    "Inspected",
                                    style: TextStyle(fontSize: 12),
                                  )),
                            ],
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.grey[300],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text("R${index + 1}"),
                                    ),
                                    const SizedBox(width: 60, child: Text("2")),
                                    const SizedBox(width: 60, child: Text(" "))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 4,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                height: 25,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Batch"),
                    SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                showBatchItems = !showBatchItems;
                              });
                            },
                            icon: showBatchItems == true
                            ? const Icon(Icons.keyboard_arrow_up_outlined)
                            : const Icon(Icons.keyboard_arrow_down_outlined),))
                  ],
                ),
              ),
              showBatchItems == true
                  ? Container(
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "BATCH / SERIAL NUMBER",
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                  width: 60,
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(fontSize: 12),
                                  )),
                              SizedBox(
                                  width: 60,
                                  child: Text(
                                    "Inspected",
                                    style: TextStyle(fontSize: 12),
                                  )),
                            ],
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.grey[300],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text("B${index + 1}"),
                                    ),
                                    const SizedBox(width: 60, child: Text("2")),
                                    const SizedBox(width: 60, child: Text(" "))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 4,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                height: 25,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Serial"),
                    SizedBox(
                        width: 30,
                        height: 30,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                showSerialItems = !showSerialItems;
                              });
                            },
                            icon: showSerialItems == true
                            ? const Icon(Icons.keyboard_arrow_up_outlined)
                            : const Icon(Icons.keyboard_arrow_down_outlined),))
                  ],
                ),
              ),
              showSerialItems == true
                  ? Container(
                      color: Colors.grey[200],
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "BATCH / SERIAL NUMBER",
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                              SizedBox(
                                  width: 60,
                                  child: Text(
                                    "Quantity",
                                    style: TextStyle(fontSize: 12),
                                  )),
                              SizedBox(
                                  width: 60,
                                  child: Text(
                                    "Inspected",
                                    style: TextStyle(fontSize: 12),
                                  )),
                            ],
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.grey[300],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: Text("S${index + 1}"),
                                    ),
                                    const SizedBox(width: 60, child: Text("2")),
                                    const SizedBox(width: 60, child: Text(" "))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 4,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(),
                  const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Liscense Plates"),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Print LPs"),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),
                ],
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 25,
                    color: Colors.white,
                    child: Text("LP-CHECK -${index + 1}"),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 4);
                },
              )
            ],
          ),
        ),
      ),
      actions: [
        Align(alignment: Alignment.center, child: widget.closeButton),
      ],
    );
  }
}


class OpenAlertDialogLPs extends StatefulWidget {
  const OpenAlertDialogLPs({
    Key? key,
    required this.closeButton,
    required this.saveButton,
  }) : super(key: key);

  final Widget closeButton;
  final Widget saveButton;

  @override
  State<OpenAlertDialogLPs> createState() => _OpenAlertDialogLPsState();
}

class _OpenAlertDialogLPsState extends State<OpenAlertDialogLPs> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 20.0),
      backgroundColor: const Color.fromARGB(255, 223, 229, 234),
      title: const Text("Generated License Plate",
      style: TextStyle(fontWeight: FontWeight.bold),),
      
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  SizedBox(width:MediaQuery.of(context).size.width * 0.3,child: const Text("License Plate")),
                  SizedBox(width:MediaQuery.of(context).size.width * 0.18,child: const Text("Quantity")),
                  SizedBox(width:MediaQuery.of(context).size.width * 0.15,child: const Text("Action")),
                ],
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: generatedLPs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width:MediaQuery.of(context).size.width * 0.3,child: Text(generatedLPs[index].lpNum)),
                        Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: TextFormField(
                          autofocus: false,
                          initialValue: generatedLPs[index].quantity.toString(),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.orange),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            fillColor: Colors.white,
                            filled: true,
                            hintStyle:
                                Theme.of(context).textTheme.button?.copyWith(
                                      color: Colors.grey[100],
                                    ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                              ),
                            ),
                            enabled: true,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                        SizedBox(width:MediaQuery.of(context).size.width * 0.15,
                        child:  IconButton(icon: const Icon(Icons.close), color: Colors.orange,
                        onPressed: (){
                          setState(() {
                            print("${generatedLPs[index].lpNum} ${generatedLPs[index].quantity}");
                            generatedLPs.removeAt(index);
                          });
                        },),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 4);
                },
              )
            ],
          ),
        ),
      ),
      actions: [
        Align(alignment: Alignment.center, child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.closeButton,
            const SizedBox(width: 20),
            widget.saveButton,
          ],
        )),
      ],
    );
  }
}
