import 'package:flutter/material.dart';
import 'package:random/helper/Api_helper.dart';
import 'package:random/modals/custom.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("RANDOM DATA"),
        backgroundColor: const Color(0xffED4264),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR : ${snapshot.error} "),
            );
          } else if (snapshot.hasData) {
            Randm? data = snapshot.data;
            return (data != null)
                ? Center(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        height: 300,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xffED4264), width: 1)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Name : ${data.nameTitle}. ${data.nameFirst} ${data.nameLast}"),
                                    Row(
                                      children: [
                                        Text("Email : ${data.email}\n"
                                            .split('@')[0]),
                                        const Text("@example.com"),
                                      ],
                                    ),
                                    Text("Phone : ${data.phone}"),
                                    Text("Gender : ${data.gender}\n\n")
                                  ],
                                ),
                                Image.network(
                                  '${data.image}',
                                  width: 75,
                                )
                              ],
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: const Color(0xffED4264),
                            ),
                            Text(
                                "\nAddress : ${data.streetNumber}, ${data.streetName},"),
                            Text(
                                "                  ${data.state}, ${data.country},"),
                            Text("                  ${data.postcode}\n\n"),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: const Color(0xffED4264),
                            ),
                            Text("\n Birthday : ${data.birthdate}"
                                .split('T')[0]),
                            Text("Age          : ${data.age}\n")
                          ],
                        ),
                      ),
                    ),
                  )
                : const Center(
                    child: Text("NO DATA...."),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      backgroundColor: const Color(0xffFFEDBC),
    ));
  }
}
