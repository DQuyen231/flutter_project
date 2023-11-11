import 'package:flutter/material.dart';
import 'package:laundry_middle_transportation/presentation/screens/order.dart';
import 'package:laundry_middle_transportation/presentation/screens/orderOfLaundryStore.dart';
import 'package:laundry_middle_transportation/presentation/screens/user.dart';
import 'package:laundry_middle_transportation/presentation/widgets/appBarActionItems.dart';
import 'package:laundry_middle_transportation/presentation/widgets/barChart.dart';
import 'package:laundry_middle_transportation/presentation/widgets/header.dart';
import 'package:laundry_middle_transportation/presentation/widgets/historyTable.dart';
import 'package:laundry_middle_transportation/presentation/widgets/infoCard.dart';
import 'package:laundry_middle_transportation/presentation/widgets/paymentDetailList.dart';
import 'package:laundry_middle_transportation/presentation/widgets/sideMenu.dart';
import 'package:laundry_middle_transportation/config/responsive.dart';
import 'package:laundry_middle_transportation/config/size_config.dart';
import 'package:laundry_middle_transportation/style/colors.dart';
import 'package:laundry_middle_transportation/style/style.dart';
import 'package:laundry_middle_transportation/presentation/widgets/navigation.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        key: _drawerKey,
        // drawer: SizedBox(width: 100, child: SideMenu()),
        appBar: !Responsive.isDesktop(context)
            ? AppBar(
                elevation: 0,
                backgroundColor: AppColors.white,
                actions: [
                  AppBarActionItems(),
                ],
              )
            : PreferredSize(
                preferredSize: Size.zero,
                child: SizedBox(),
              ),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 1,
                  child: SideMenu(),
                ),
              Expanded(
                  flex: 10,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Header(),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 4,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth,
                            child: Wrap(
                              spacing: 20,
                              runSpacing: 20,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Dashboard(),
                                      ),
                                    );
                                  },
                                  child: InfoCard(
                                    icon: '',
                                    label: 'Orders',
                                    amount: '8',
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Dashboard(),
                                      ),
                                    );
                                  },
                                  child: InfoCard(
                                      icon: 'assets/transfer.svg',
                                      label: 'User',
                                      amount: '250'),
                                ),
                                InfoCard(
                                    icon: 'assets/bank.svg',
                                    label: 'Service',
                                    amount: '4'),
                                InfoCard(
                                    icon: 'assets/invoice.svg',
                                    label: 'Order',
                                    amount: '123'),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PrimaryText(
                                    text: 'Balance',
                                    size: 16,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.secondary,
                                  ),
                                  PrimaryText(
                                      text: '\$1500',
                                      size: 30,
                                      fontWeight: FontWeight.w800),
                                ],
                              ),
                              PrimaryText(
                                text: 'Past 30 DAYS',
                                size: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.secondary,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 3,
                          ),
                          Container(
                            height: 180,
                            child: BarChartCopmponent(),
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryText(
                                  text: 'History',
                                  size: 30,
                                  fontWeight: FontWeight.w800),
                              PrimaryText(
                                text: 'Transaction of lat 6 month',
                                size: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.secondary,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 3,
                          ),
                          HistoryTable(),
                          if (!Responsive.isDesktop(context))
                            PaymentDetailList()
                        ],
                      ),
                    ),
                  )),
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 4,
                  child: SafeArea(
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.screenHeight,
                      decoration: BoxDecoration(color: AppColors.secondaryBg),
                      child: SingleChildScrollView(
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        child: Column(
                          children: [
                            AppBarActionItems(),
                            PaymentDetailList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigation());
  }
}
