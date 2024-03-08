// // import 'package:dio/dio.dart';
// // import 'package:geocoding/geocoding.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:weatherapp/models/weather_model.dart';

// // class WeatherService {
// //   Future<String> getLocation() async {
    
// //     Kullanıcının konumu açık mı kontrol ettik------------------------------
    
// //     final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
// //     if (!serviceEnabled) {
// //       Future.error("Konum Servisiniz Kapali!");
// //     }

    
    
// //     Kullanıcı konum izni vermiş mi onu kontrol ettik---------------------

// //     LocationPermission permisson = await Geolocator.checkPermission();
// //     if (permisson == LocationPermission.denied) {
      
// //       Konum izni vermemişse tekrar izin istedik--------------------
// //       permisson = await Geolocator.requestPermission();
// //       if (permisson == LocationPermission.denied) {
        
// //         Yine vermemişse hata mesajı döndürdük----------------------
// //         Future.error("Konum İzni Vermelisiniz!");
// //       }
// //     }

    
// //     Kullanıcının pozisyonunu aldık-------------------------------------
    
// //     final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    
// //     Kullanıcı pozisyonundan yerleşim noktasını bulduk.---------------------------
    
// //     final List<Placemark> placeMark = await placemarkFromCoordinates(position.latitude, position.longitude);
    
// //     Şehrimizi yerleşim noktasından kaydettik----------------------------------------
    

// //     final String? city = placeMark[0].administrativeArea;

// //     if (city == null) {
// //       Future.error("Bir Sorun Oluştu");
// //     }
// //     return city!;
// //   }

// //   Future<List<WeatherModel>> getWeatherData() async {
// //     final String city = await getLocation();
// //     final String url = "https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city";
// //     const Map<String, dynamic> headers = {
// //       "authorization": "apikey 1pnnAz1IcDEfzxoaL8ngD9:0vjCAa850lABbgjwcWAV4K",
// //       "content-type": "application/json"
// //     };
// //     final dio = Dio();

// //     final response = await dio.get(url, options: Options(headers: headers));
// //     if (response.statusCode != 200) {
// //       return Future.error("Bir Sorun Oluştu");
// //     }
// //     final List list = response.data["result"];
// //     final List<WeatherModel> weatherList = list.map((e) => WeatherModel.fromJson(e)).toList();
// //     return weatherList;
// //   }
// // }



// //"https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.latitude}&appid=849744f721a97b713cbe2c66b959943b&units=metric"