# Update:

## Tuần 1:
- Cài đặt Android Studio, Android SDK.
- Khởi tạo môi trường phát triển Flutter (biến môi trường)
- Cài đặt emulator (Emulator của Android Studio)
- Chạy ứng dụng cơ bản (ứng dụng starter của Flutter sử dụng StatelessWidget, StatefulWidget)
- Thử 1 số Widget cơ bản (Layout Widget, Media Widget, Input Widget) trong Plant App
### Code tuần 1:<br> [Starter App](https://github.com/miaht94/Flutter_Homework/tree/master/Bai_1/starter_app), [Plant App](https://github.com/miaht94/Flutter_Homework/tree/master/Plant%20App)

<img src="https://github.com/miaht94/Flutter_Homework/blob/master/Plant%20App/Screenshot%202022-02-25%20012902.png?raw=true" alt="Week1" width="900"/>

## Tuần 2:
- Gesture:<br> <img src="https://github.com/miaht94/Flutter_Homework/blob/master/b8_gesture/Screenshot%202022-03-01%20225950.png?raw=true" alt="Gesture" width="900"/>
- State and ScopedModel:<br> <img src="https://github.com/miaht94/Flutter_Homework/blob/master/bai11_scopedmodel/ezgif-1-e1aa5893c6.gif?raw=true" alt="abc" width="900"/>
- Navigator and Routing:<br> <img src="https://github.com/miaht94/Flutter_Homework/blob/master/b12_navigator_routing/ezgif-1-5db42455cf.gif?raw=true" alt="Navigator" width="900"/>
### Code tuần 2:<br> [Gesture](https://github.com/miaht94/Flutter_Homework/tree/master/b8_gesture), [State](https://github.com/miaht94/Flutter_Homework/tree/master/b9_state), [ScopedModel](https://github.com/miaht94/Flutter_Homework/tree/master/bai11_scopedmodel), [Navigator And Routing](https://github.com/miaht94/Flutter_Homework/tree/master/b12_navigator_routing)


## Tuần 3
- Animation: <br><img src="https://github.com/miaht94/Flutter_Homework/blob/master/b12_navigator_routing/animation.gif?raw=true" alt="Animation" width="450"/><img src="https://github.com/miaht94/Flutter_Homework/blob/master/b12_navigator_routing/animation2.gif?raw=true" alt="Animation" width="450"/>
- NativeCode + Flutter Plugin: Sử dụng MethodChannel để gọi App hỗ trợ Intent.ACTION_VIEW (cụ thể thì Chrome hỗ trợ loại Intent này bằng 1 activity nhận vào data là 1 URL và truy cập URL đó)
<br>  <img src="https://github.com/miaht94/Flutter_Homework/blob/master/b8_gesture/plugin.gif?raw=true" alt="Gesture" width="900"/>
- REST API:
<br> <img src="https://github.com/miaht94/Flutter_Homework/blob/master/pizza_delivery_app/FutureBuilder.png?raw=true" width="900">
<br> Cách sử dụng:
```
cd pizza_delivery_app/node_server
npm i -g http-server
http-server . -p 8080
```
Màn hình terminal sẽ hiện ra như sau:  <br> <br> <img src="https://github.com/miaht94/Flutter_Homework/blob/master/pizza_delivery_app/http_server.png?raw=true"/>
<br> Chọn 1 đường dẫn trong mình hình (VD: "http://192.168.56.1:8080") sau đó thêm đuôi /foods vào đường dẫn (VD: "http://192.168.56.1:8080/foods.json") và sửa trong file pizza_delivery_app/lib/constant.dart chỗ: <br> 
```dart
const String entryToFoodsDotJson = "http://192.168.56.1:8080/foods.json";
```
<br>
Kết quả chạy App: <br> <img src="https://github.com/miaht94/Flutter_Homework/blob/master/pizza_delivery_app/FutureBuilder.png?raw=true" width=900 />
<br> Trên app sẽ có 2 listview trong đó cái đầu tiên là dữ liệu lấy từ http-server (cụ thể là file foods.json) trong thư mục <b>pizza_delivery_app/node_server</b> <br>

- Firebase: Ở đây Firebase đã được add file config chạy trên 1 project được thiết lập sẵn nên không cần config gì thêm cả
<br> Kết quả chạy App:
<br> <img src="https://github.com/miaht94/Flutter_Homework/blob/master/firebase_app/firebase.png?raw=true" width=900/>

- Testing:
<br> <img src="https://github.com/miaht94/Flutter_Homework/blob/master/bai20_testing/Screenshot%202022-03-11%20035825.png?raw=true" width=900 />

- Intl:
<br> <img src="https://im2.ezgif.com/tmp/ezgif-2-fe2cdca5f2.gif" width=900 />
