

import 'package:SMS/services/database.dart';
import 'package:flutter/material.dart';
import '../models/event.dart';
class AddEvent extends StatefulWidget
{
  @override
  _AddEventState createState() => new _AddEventState();

}
class _AddEventState extends State<AddEvent>
{
  String eventname ='';
  final _formKey = GlobalKey<FormState>();
  TextEditingController namer;
  void initState()
  {
    super.initState();
    namer = TextEditingController(text:" ");
  }
  Widget _buildevent()
  {
    return TextFormField(
      decoration: InputDecoration(labelText: "Event Name"),
      validator: (String val){
        if(val.isEmpty){
          return "Required";
        }
      },
      onSaved: (String val){
        eventname = val;
        },
      );
   
  }
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Add event')),
     
     body: SingleChildScrollView
     (
       child: Form(
         child: Column
         (crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height:10.0),
            TextFormField(
              controller: namer,
              decoration: InputDecoration
              ( border: OutlineInputBorder(),
                labelText: "Event Name"  
              ),
            ),
            const SizedBox(height:20.0),
            RaisedButton
            (
              child: Text("Save"),
              onPressed:() async{
              try{
               DatabaseService().addEvent(
                Event(name: namer.text , delegates:0)
              );
              }
              catch(e)
              {
                print(e);
              }
 
              }
            )
          ],
          ),
        ),
       
     
     ),
      // body: StreamBuilder(
      //   stream: DatabaseService().getEvents(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot){
      //    if(snapshot.hasError || !snapshot.hasData)
      //     return CircularProgressIndicator();
      //     return ListView.builder
      //     (
      //       itemCount: snapshot.data.length,
      //       itemBuilder: (BuildContext context , int index)
      //       {
      //         Event event = snapshot.data[index];
      //         return ListTile(
      //           title: Text(event.name),
      //         );
      //       }
      //     );
      //   }          
      // ),
    //===========================================
      // body: Container(
      //   padding: EdgeInsets.all(40.0),
      //   alignment: Alignment.center, //centers the children
      //   child: Form 
      //   (  key: _formKey,
      //     child: Column(children: <Widget>
      //   [     
      //      SizedBox(height: 20.0,),
      //     _buildevent(),
      //     SizedBox(height: 20.0,),
      //     RaisedButton
      //     (
      //       child: Text('Create Event', style: TextStyle(color: Colors.white)),
      //       color: Colors.pink[400],
      //       onPressed: (){
      //         if(!_formKey.currentState.validate())
      //         {
      //           return;
      //         }
      //         _formKey.currentState.save();
      //         print(eventname);
      //       },
      //     )


      //   ],),),

      // ),
    
    );
    
  }
}