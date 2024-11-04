
import 'package:dividex_new/customers/customersController.dart';
import 'package:dividex_new/customers/models/CustomerResponse.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomersListView extends StatefulWidget {
  const CustomersListView({super.key});

  @override
  CustomersListState createState() => CustomersListState();
}

class CustomersListState extends State<CustomersListView> {

  final CustomersController customersController = Get.put(CustomersController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      customersController.getCustomers();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Screen'),
      ),
      body:Obx((){
        if(customersController.isLoading.value){
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const CircularProgressIndicator(color: Colors.red,));
        }
        return  Container(
          child: ListView(
            children: [
              MaterialButton(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white),
                      // boxShadow:  [BoxShadow(blurRadius: FontSize.s10, color:AppColors.newAppBlack)],
                    ),
                    child: const Text('Refresh Data',style: TextStyle(color: Colors.white,fontSize: 18),),
                  ),
                  onPressed: (){
                    WidgetsBinding.instance.addPostFrameCallback((_){
                      customersController.getCustomers();
                    });
                  }),
              const SizedBox(height: 15,),
              Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      itemCount: customersController.customerResponse.value.result!.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        Result result = customersController.customerResponse.value.result![index];
                        return  Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black),
                            // boxShadow:  [BoxShadow(blurRadius: FontSize.s10, color:AppColors.newAppBlack)],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(height: 10,),
                              commonTextVal("Name :  " ,result.name),
                              const SizedBox(height: 10,),
                              commonTextVal("Mobile :  " ,result.mobile),
                              const SizedBox(height: 10,),
                              commonTextVal("Email :  " ,result.email),
                              const SizedBox(height: 10,),
                              commonTextVal("Address :  " ,result.address),
                              const SizedBox(height: 10,),
                            ],
                          ),
                        );
                      }
                  ))
            ],
          ),
        );
      })
    );
  }

  Widget commonTextVal(String title,String val){
    return RichText(
      textAlign: TextAlign.start,
      text:TextSpan(
        children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                color: Colors.black,fontSize: 17.0,fontWeight: FontWeight.bold
              )),

          TextSpan(
              text: val,
              style: const TextStyle(
                color: Colors.grey,fontSize: 14.0,
              )),
        ],
      ),
    );
  }
}
