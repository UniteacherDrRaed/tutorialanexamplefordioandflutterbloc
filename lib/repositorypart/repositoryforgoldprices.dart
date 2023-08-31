import 'package:dio/dio.dart';
import 'package:goldpriceprojects/model/gold.dart';

class RepositoryForGoldPrices{

  Future<Gold> fetchGoldPrices() async{
    final dio= Dio();
    dio.options.baseUrl="https://www.goldapi.io/api/";
    dio.options.headers={
      'x-access-token':'goldapi-4yfzwrllys9kdr-io'
    };
    dio.options.receiveDataWhenStatusError=true;

    final response=await dio.get("XAU/USD/");
    if(response.statusCode==200)
    {
      Gold gold= Gold(
        priceGram24k: response.data['price_gram_24k'],
        priceGram22k: response.data['price_gram_22k'],
        priceGram21k: response.data['price_gram_21k'],
        priceGram20k: response.data['price_gram_20k'],
        priceGram18k: response.data['price_gram_18k']
        );
      return gold;
    }
    else{
      throw Exception("Error in fetching gold prices"); 
    }
    
  }  
}