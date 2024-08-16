import 'package:api_get/bloc/get_api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Apiscreen extends StatefulWidget {
  const Apiscreen({super.key});

  @override
  State<Apiscreen> createState() => _ApiscreenState();
}

class _ApiscreenState extends State<Apiscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Api Data')),
      ),
      body:BlocBuilder<GetApiBloc, GetApiState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.postmodellist.length,
            itemBuilder: (context,index){
              final item = state.postmodellist[index];
              return ListTile(
                title: Text(item.title.toString()),
                subtitle: Text(item.body.toString()),
              );
            }
            
            );
        },
      ) 
      
    );
  }
}