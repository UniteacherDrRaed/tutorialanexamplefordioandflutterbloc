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
          title: const Text("Gold Prices"),
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
      Container(
        color: Colors.pink.shade100,
       margin: const EdgeInsets.all(50),
       padding: const EdgeInsets.all(50),
       child: Column(
        children: [
          Row(
            children: [
              const Text("price gram 24k: "),
              Text(gold.priceGram24k.toString())
            ],
            )
            ,
             Row(
            children: [
             const  Text("price gram 22k: "),
              Text(gold.priceGram22k.toString())
            ],
            ),
             Row(
            children: [
              const Text("price gram 21k: "),
              Text(gold.priceGram21k.toString())
            ],
            ),
             Row(
            children: [
              const Text("price gram 20k: "),
              Text(gold.priceGram20k.toString())
            ],
            )
            ,
             Row(
            children: [
              const Text("price gram 18k: "),
              Text(gold.priceGram18k.toString())
            ],
            )
        ],), 
      ) ;     
}