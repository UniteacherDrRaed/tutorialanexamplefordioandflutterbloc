import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldpriceprojects/blocpart/blocgold.dart';
import 'package:goldpriceprojects/blocpart/eventgold.dart';
import 'package:goldpriceprojects/blocpart/stategold.dart';
import 'package:goldpriceprojects/model/gold.dart';
import 'package:goldpriceprojects/repositorypart/repositoryforgoldprices.dart';

class PageGoldPrices extends StatelessWidget {
  const PageGoldPrices({super.key});
 
            
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: ( (context) => BlocGold(RepositoryForGoldPrices())))
      ], 
      child: Scaffold(
        appBar: AppBar(
          title: const Text("The Gold Prices"),
          backgroundColor: Colors.pink,
        ),
        body: BlocProvider(
          create:  (context) => BlocGold(RepositoryForGoldPrices())..add(FetchGoldPricesEvent())
          ,
          child: BlocBuilder<BlocGold,StateGold>(
            builder: ((context, state) {
              if (state is StartState)
              {
                 return _showCircularProgressIndicator();
              }
              if(state is SuccessFetchingPricesState)
              {
                return _showGolodPrices(state.gold);
              }
              else if(state is ErrorInFetchingPricesState)
              {
                  return Text(state.errorMessage);
              }
             return Container(
              color: Colors.pink.shade100,
              padding: const EdgeInsets.all(50),
            
            );

            }
            ),
          ),
         ),
         )
      );
  }
    Widget _showCircularProgressIndicator() =>Container(
              color: Colors.pink.shade100,
              padding: const EdgeInsets.all(50),
              child: const CircularProgressIndicator(
                color:Colors.blue,
                strokeWidth:5.0
              ),
            );
      Widget _showGolodPrices(Gold gold)=>
      Center(
        child: Container(
          color: Colors.pink.shade100,
        
         child:DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(child: Text("Type of Gold",softWrap: true,
              style: TextStyle(fontStyle: FontStyle.italic,
              color:Colors.red,fontSize: 19),),
              )
              ),
              DataColumn(
              label: Expanded(child:  Text("Price",style:  TextStyle(fontStyle: FontStyle.italic,
              color:Colors.red,fontSize: 19),
              )
              ,))
          ],
           rows: <DataRow>[
            DataRow(
              cells:<DataCell>[
                const DataCell(Text(" gram 24k: "),),
                DataCell(Text(gold.priceGram24k.toString()))
              ] )
              ,
              DataRow(
              cells:<DataCell>[
                const DataCell(Expanded(child: Text(" gram 22k: ")),),
                DataCell(Text(gold.priceGram22k.toString()))
              ] )
              ,
              DataRow(
              cells:<DataCell>[
                const DataCell(Text(" gram 21k: "),),
                DataCell(Text(gold.priceGram21k.toString()))
              ] ),
              DataRow(
              cells:<DataCell>[
                const DataCell(Text(" gram 20k: "),),
                DataCell(Text(gold.priceGram20k.toString()))
              ] ),
              DataRow(
              cells:<DataCell>[
                const DataCell(Text(" gram 18k: "),),
                DataCell(Text(gold.priceGram18k.toString()))
              ] )
      
           ])),
      ) ;     
}


