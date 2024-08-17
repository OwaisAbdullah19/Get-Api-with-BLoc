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
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetApiBloc>().add(fetchdata());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Api Data')),
        ),
        body: BlocBuilder<GetApiBloc, GetApiState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.all(8),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Search  '),
                    onChanged: (value) {
                context.read<GetApiBloc>().add(searchdata(searchtext: value));

                    },
                  ),
                ),
                Expanded(
                  child: state.Searchmessage.isNotEmpty ? Center(child: Text(state.Searchmessage.toString())) :  ListView.builder(
                      itemCount: state.searchlist.isEmpty ? state.postmodellist.length : state.searchlist.length,
                      itemBuilder: (context, index) {
                        if(state.searchlist.isEmpty){
                        final item = state.postmodellist[index];
                        return ListTile(
                          isThreeLine: true,
                          title: Text(item.title.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Text(item.title.toString()),
                              Text(item.body.toString()),
                            ],
                          ),
                        );

                        }else{
                         final item = state.searchlist[index];
                        return ListTile(
                          isThreeLine: true,
                          title: Text(item.title.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             // Text(item.title.toString()),
                              Text(item.body.toString()),
                            ],
                          ),
                        );

                        }
                        
                      }),
                )
              ],
            );
          },
        ));
  }
}
