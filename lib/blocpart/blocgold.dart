import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldpriceprojects/blocpart/eventgold.dart';
import 'package:goldpriceprojects/blocpart/stategold.dart';
import 'package:goldpriceprojects/model/gold.dart';
import 'package:goldpriceprojects/repositorypart/repositoryforgoldprices.dart';

class BlocGold extends Bloc<EventGold,StateGold>{
  final RepositoryForGoldPrices repositoryForGoldPrices;

  BlocGold(this.repositoryForGoldPrices):super(StartState()){
    on<FetchGoldPricesEvent>((event, emit) async {
      emit(StartState());
      try{
        Gold gold =await repositoryForGoldPrices.fetchGoldPrices();
        emit(SuccessFetchingPricesState(gold));
      }
      catch(errorMessage){
        emit(ErrorInFetchingPricesState(errorMessage.toString()));
      }
    },);
  }
  
}
