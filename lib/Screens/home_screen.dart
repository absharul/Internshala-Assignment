import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_internships/Model/search_model.dart';
import 'package:search_internships/Services/api_service.dart';
import 'package:search_internships/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ApiService apiService = ApiService();

  late Future<SearchInternshipModel> futureInternships;

  @override
  void initState() {
    // TODO: implement initState
    futureInternships = apiService.searchInternships();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBarWithSearchSwitch(
        toolbarWidth: double.maxFinite,
        toolbarHeight: 100.0,
        appBarBuilder: (BuildContext context) {
          return AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: const Text('Internships', style: appBarTextStyle,),
            actions: [
              const AppBarSearchButton(

              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.bookmark_outline_sharp)),
              IconButton(onPressed: (){}, icon: const Icon(Icons.chat_bubble_outline_sharp)),
              const SizedBox(width: 10.0,),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 28.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: appColor)
                      ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.filter_alt_outlined,color: appColor,size: 15.0,),
                            SizedBox(width: 2.0,),
                            Text('Filters', style: TextStyle(color: appColor,fontSize: 15.0),)
                          ],
                        ),
                      ),
                    const Text('9155 total internships', style: TextStyle(color: Colors.black54),)
                  ],
                )
              ),
            ),
          );
        },
      ),
      drawer: const Drawer(

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder<SearchInternshipModel>(
              future: futureInternships,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.internshipsMeta;

                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var internship = data.values.elementAt(index);

                        return Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: Container(
                            height: 300,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                                  child: Container(
                                    height: 25.0,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.trending_up, color: Colors.blueAccent, size: 15.0,),
                                        SizedBox(width: 5.0,),
                                        Text('Actively hiring', style: TextStyle(fontSize: 12.0),)
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        internship.title,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textWidthBasis: TextWidthBasis.longestLine,
                                        internship.companyName,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      const SizedBox(height: 7.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on_outlined,size: 15.0,),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            internship.locationNames.join(', '),
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 7.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.play_circle_outline,size: 15.0,),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            internship.startDate,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                      ],),
                                      const SizedBox(height: 7.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.work_outline_outlined,size: 15.0,),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            internship.duration,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 7.0,),
                                      Row(
                                        children: [
                                          const Icon(Icons.money_outlined,size: 15.0,),
                                          const SizedBox(width: 5.0,),
                                          Text(
                                            internship.stipend,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 7.0,),
                                      Text(
                                        'Posted on: ${internship.postedOn}',
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5.0,),
                                Container(
                                  height: 1,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.5)
                                    )
                                  ),
                                ),
                                const SizedBox(height: 5.0,),
                                Row(
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    const Text(
                                      'View Details',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0,),
                                    Container(
                                      height: 40.0,
                                      width: 130.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7.0),
                                        color: Colors.blue,
                                      ),
                                      child: const Center(child: Text('Apply Now',style: TextStyle(fontSize: 15.0,color: Colors.white,fontWeight: FontWeight.w500)),),
                                    ),
                                    const SizedBox(width: 10.0,),
                                  ],
                                )

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      )
      ,
    );
  }
}
