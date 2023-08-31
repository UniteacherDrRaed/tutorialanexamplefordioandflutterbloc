import 'package:equatable/equatable.dart';
import 'package:goldpriceprojects/model/gold.dart';

abstract class StateGold extends Equatable{}

class StartState extends StateGold{
  @override
 
  List<Object?> get props => [];
}

class SuccessFetchingPricesState extends StateGold{
  final Gold gold;
  SuccessFetchingPricesState(this.gold);

  @override
 
  List<Object?> get props => [gold];
}

class ErrorInFetchingPricesState extends StateGold{
  final String errorMessage;
  ErrorInFetchingPricesState(this.errorMessage);
  @override
 
  List<Object?> get props => [errorMessage];
}