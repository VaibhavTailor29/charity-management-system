
import 'package:flutter/material.dart';

class about_us extends StatefulWidget {
  // const about_us({ Key? key }) : super(key: key);

  @override
  _about_usState createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ABOUT US"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.all(24),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("What Is an NGO?", style: TextStyle(fontSize: 25, color: Colors.deepPurpleAccent,)),
                    Text(""),
                    Text("A non-governmental organization (NGO) is a non-profit group that functions independently of any government. NGOs, sometimes called civil societies, are organized on community, national and international levels to serve a social or political goal such as humanitarian causes or the environment." ,style: TextStyle(fontSize: 18),),
                    Text(""),
                    Text(""),
                    Text("About NGOs", style: TextStyle(fontSize: 25, color: Colors.deepPurpleAccent),),
                    Text(""),
                    Text(""),
                    Text("While 'NGO' has various interpretations, the term is generally accepted to include non-profit, private organizations that operate outside of government control. Some NGOs rely primarily on volunteers, while others support a paid staff. The World Bank identifies two broad groups of NGOs:" ,style: TextStyle(fontSize: 18)),
                    Text(""),
                    Text("1. Operational NGOs, which focus on the design and implementation of development projects.", style: TextStyle(fontSize: 18),),
                    Text(""),
                    Text("2. Advocacy NGOs, which defend or promote a specific cause and seek to influence public policy.", style: TextStyle(fontSize: 18),),
                    Text(""),
                    Text(""),
                    Text("OUR MISSION", style: TextStyle(fontSize: 25,color: Colors.deepPurpleAccent),),
                    Text(""),
                    Text('"India become the best country in which to grow older." Plan and implement or join hands with government, donors, non-government and other Volunteer bodies for implementing, development that fulfill our vision to educate, organize, strengthen the downtrodden communities with total capacities to manage their own development.',style: TextStyle(fontSize: 18) ),
                  ],
                ),
              ),
            )
          ) 
          
          ),
        ),      
    );
  }
}