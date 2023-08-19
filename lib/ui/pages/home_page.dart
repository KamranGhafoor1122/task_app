
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_app/bloc/auth/auth_bloc.dart';
import 'package:task_app/bloc/auth/auth_events.dart';
import 'package:task_app/bloc/auth/auth_states.dart';
import 'package:task_app/bloc/home/home_bloc.dart';
import 'package:task_app/bloc/home/home_events.dart';
import 'package:task_app/bloc/home/home_states.dart';
import 'package:task_app/model/food.dart';
import 'package:task_app/services/Authenticate_Service.dart';
import 'package:task_app/services/home_service.dart';
import 'package:task_app/ui/components/asset_image_widget.dart';
import 'package:task_app/ui/components/filled_button.dart';
import 'package:task_app/ui/components/loader.dart';
import 'package:task_app/ui/pages/splash.dart';
import 'package:task_app/utils/navigator.dart';
import '../../Functions/CommonFunctions.dart';
import '../../model/response_model.dart';
import '../../theme/app_colors.dart';
import '../../utils/SizeConfig.dart';
import '../components/text_widget.dart';
import '../components/textfield_widget.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeBloc _homeBloc = HomeBloc(homeService: HomeService());
  final HomeService _homeService = HomeService();


  Category? selectedCategory;
  Cusine? selectedCusine;

  @override
  void initState() {
    // TODO: implement initState
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        title: TextWidget(text: "Search",fontWeight: FontWeight.w800,size: 16,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.safeBlockVertical*3,
            ),


            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                    width: SizeConfig.screenWidth,
                    height: 60,
                    hintText: "Search",

                    oncChange: (text){
                      _homeBloc.add(HomeSearchEvent(text));
                    },
                    leading: Icon(Icons.search,color: Colors.black,),

                  ),
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal*3,
                ),

                GestureDetector(
                  onTap: (){
                     showModalBottomSheet(context: context,
                         isScrollControlled: true,
                         shape:const RoundedRectangleBorder(
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(20),
                             topRight: Radius.circular(20)
                           )
                         ),
                         builder: (ctx)
                     => bottomSheetUI());
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding:const EdgeInsets.all(20),
                    child:const Icon(Icons.filter_alt_sharp,color: Colors.white,),
                  ),
                ),


              ],
            ),

            SizedBox(
              height: SizeConfig.safeBlockVertical*3,
            ),


            Expanded(
              child: BlocBuilder<HomeBloc,HomeState>(
                bloc: _homeBloc,
                builder: (context,state){
                   if(state is HomeLoading){
                      return Center(child: Loader());
                   }
                   else if(state is HomeInitialState){
                     return ListView.builder(
                       itemCount: state.foods.length,
                       itemBuilder: (ctx,index)=> _buildListItem(state.foods[index]),
                     );
                   }
                   else if(state is HomeSearchState){
                     return ListView.builder(
                       itemCount: state.foods.length,
                       itemBuilder: (ctx,index)=> _buildListItem(state.foods[index]),
                     );
                   }
                   else if(state is HomeFilterState){
                     return ListView.builder(
                       itemCount: state.foods.length,
                       itemBuilder: (ctx,index)=> _buildListItem(state.foods[index]),
                     );
                   }
                   else {
                     return Container();
                   }
                },
              ),
            )





          ],
        ),
      ),
    );
  }





  void init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _homeBloc.add(HomeInitialEvent());
    });
  }

  Widget _buildListItem(Food food) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        color: Colors.white70
      ),
      child: Row(
        children: [
            AssetImageWidget(image: food.image,height: 120,width: 120,
            rounded:true,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),

          SizedBox(
            width: SizeConfig.safeBlockHorizontal*3,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(text: food.name,maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.w700,),
              TextWidget(text: food.category.name,maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.w700,),
              TextWidget(text: food.cusine.name,maxLines: 1,
                textColor: AppColors.grayText
                ,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500,size: 12,),
              Row(
                children: [
                  AssetImageWidget(image: food.chef.image,circular: true,height: 30,width: 30,),

                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal*2,
                  ),

                  TextWidget(text: food.chef.name,maxLines: 1,textColor: Colors.grey,),


                ],
              ),
            ],
          )
        ],
      ),
    );

  }




  bottomSheetUI(){


    return StatefulBuilder(
      builder: (ctx,innerSetState) {
        return Container(
          padding:const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(text: 'Filter',size: 15,fontWeight: FontWeight.w600,),
              SizedBox(
                height: SizeConfig.safeBlockVertical*2,
              ),

              Row(
                children: [
                  TextWidget(text: "Category",fontWeight: FontWeight.w600,),
                ],
              ),

              SizedBox(
                height: SizeConfig.safeBlockVertical*2,
              ),

              SizedBox(
                height: 60,
                child: ListView.separated(
                  itemCount: _homeService.categoriesList.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (ctx,index)=>SizedBox(width: 10,),
                  itemBuilder: (ctx,index)=> GestureDetector(
                    onTap: (){
                      innerSetState((){
                         selectedCategory = _homeService.categoriesList[index];
                      });
                    },
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: selectedCategory == null ? Colors.white:
                            selectedCategory!.id == _homeService.categoriesList[index].id ? AppColors.primaryColor : Colors.white
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: TextWidget(
                        text: _homeService.categoriesList[index].name,
                        textColor:  selectedCategory == null ? AppColors.darkText:
                        selectedCategory!.id == _homeService.categoriesList[index].id ? Colors.white : AppColors.darkText

                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.safeBlockVertical*2,
              ),


              Row(
                children: [
                  TextWidget(text: "Cusine",fontWeight: FontWeight.w600,),
                ],
              ),


              SizedBox(
                height: SizeConfig.safeBlockVertical*2,
              ),
              Wrap(
                direction: Axis.horizontal,
                spacing: 15,
                children: _homeService.cusineList.map((e) => InkWell(
                  onTap: (){
                    innerSetState((){
                      selectedCusine = e;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: SizeConfig.safeBlockVertical*2
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),
                        color: selectedCusine == null ? Colors.white:
                            selectedCusine!.id == e.id ? AppColors.primaryColor:Colors.white
                    ),
                    padding:const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                    child: TextWidget(
                      text: e.name,
                      textColor: selectedCusine == null ? AppColors.darkText:
                      selectedCusine!.id == e.id ? AppColors.white:AppColors.darkText,
                    ),
                  ),
                ) ).toList(),
              ),

              SizedBox(
                height: 50,



               /* ListView.builder(
                  itemCount: _homeService.cusineList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx,index)=> ,
                ),*/
              ),



              SizedBox(
                height: SizeConfig.safeBlockVertical*3,
              ),


              SizedBox(
                width: SizeConfig.screenWidth*0.75,
                height: 55,
                child: CustomButton(
                  title: "Apply Filter",
                  onTap: (){

                    Navigator.pop(context);
                    _homeBloc.add(HomeFilterEvent(category: selectedCategory,cusine: selectedCusine));


                  },
                )
              ),


              SizedBox(
                height: SizeConfig.safeBlockVertical*3,
              ),


              SizedBox(
                  width: SizeConfig.screenWidth*0.75,
                  height: 55,
                  child: CustomButton(
                    title: "Clear Filter",
                    filledColor: AppColors.gray,
                    onTap: (){
                      Navigator.pop(context);
                      innerSetState((){
                        selectedCategory = null;
                        selectedCusine=null;
                      });
                      _homeBloc.add(HomeFilterEvent(category: selectedCategory,cusine: selectedCusine));


                    },
                  )
              ),
            ],
          ),

        );
      }
    );
  }

  }





