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

                      
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: state.postmodellist.length,
                      itemBuilder: (context, index) {
                        final item = state.postmodellist[index];
                        return ListTile(
                          isThreeLine: true,
                          title: Text('ID ' + item.id.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title.toString()),
                              Text(item.body.toString()),
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          },
        ));
  }
}
