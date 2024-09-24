import 'package:finhub/pages/sign_up.dart';
import 'package:finhub/pages/create_saving_account.dart';
// import 'package:finhub/pages/complete_profile.dart';
import 'package:finhub/pages/new_saving_plan.dart';
import 'package:finhub/pages/bank_details.dart';
import 'package:finhub/pages/congratulations_page.dart';
import 'package:finhub/pages/loan_received.dart';
import 'package:finhub/pages/savings_screen.dart';
import 'package:finhub/pages/saving_duration.dart';
import 'package:finhub/pages/saving_duration_unlocked.dart';
import 'package:finhub/pages/savings_frequency.dart';
import 'package:finhub/pages/loan_summary.dart';
import 'package:finhub/pages/loan_calculator.dart';
import 'package:finhub/pages/lock_status.dart';
import 'package:finhub/pages/loan_packages.dart';
import 'package:finhub/pages/loans_screen.dart';
import 'package:finhub/pages/loan_breakdown.dart';
import 'package:finhub/pages/faqs_inquiries.dart';
import 'package:finhub/pages/loan_repayment.dart';
import 'package:finhub/pages/account_screen.dart';
import 'package:finhub/pages/loan_repayment_main.dart';
import 'package:finhub/pages/make_early_repayment.dart';
import 'package:finhub/pages/mojaloop.dart';
import 'package:finhub/pages/enter_phone_no.dart';
import 'package:finhub/pages/choose_plan.dart';
import 'package:finhub/pages/successful_screen.dart';
import 'package:finhub/pages/bottom_nav.dart';
import 'package:finhub/pages/payment_method.dart';
import 'package:finhub/pages/verification_details.dart';
import 'package:finhub/pages/withdraw_method_main.dart';
import 'package:finhub/pages/plan_summary.dart';
import 'package:finhub/pages/profile_info.dart';
import 'package:finhub/pages/previous_savings.dart';
import 'package:finhub/pages/verify_account.dart';
import 'package:finhub/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:finhub/pages/sign_in.dart';
import 'package:finhub/pages/splash_screen.dart';
import 'package:finhub/pages/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:finhub/firebase_options.dart';
import 'package:finhub/pages/about_us.dart';
import 'package:finhub/pages/chats_profile.dart';
import 'package:finhub/pages/chats_screen.dart';
import 'package:finhub/pages/contact_us.dart';
import 'package:finhub/pages/contacts.dart';
import 'package:finhub/pages/password_reset.dart';
import 'package:finhub/pages/messages_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:finhub/pages/enter_phone_no2.dart';
import 'package:finhub/pages/mobile_money_topup.dart';
import 'package:finhub/pages/make_payment.dart';

import 'package:provider/provider.dart';
import 'package:finhub/pages/student_provider.dart'; 
import 'package:finhub/pages/plan_pay.dart'; 
import 'package:finhub/pages/plan_payment_method.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboarding': (context) => const OnBoardingScreen(),
        '/sign_in': (context) => SignIn(),
        '/sign_up': (context) => SignUp(),
        '/verify_account': (context) => const VerifyAccount(),
        '/create_saving_account': (context) => const CreateSavingAccount(),
        '/payment_method': (context) => const PaymentMethod(),
        '/enter_phone': (context) => const EnterPhoneNumber(),
        '/congratulations': (context) => const CongratulationsPage(),
        '/bank_details': (context) => BankDetails(),
        '/bottom_nav': (context) => BottomNavigation(),
        '/plan_summary': (context) => const PlanSummary(),
        '/profile_info': (context) => ProfileInfo(),
        '/successful_screen': (context) => const SuccessfulScreen(),
        '/loan_summary': (context) => LoanSummary(),
        '/loan_calculator': (context) => LoanCalculator(),
        '/loan_packages': (context) => LoanPackages(),
        '/loan_breakdown': (context) => LoanBreakdown(),
        '/loan_received': (context) => LoanReceived(),
        '/faqs_inquiries': (context) => FaqsInquiries(),
        '/account_screen': (context) => const AccountScreen(),
        '/loans_screen': (context) => const LoansScreen(),
        '/loan_repayment': (context) => LoanRepayment(),
        '/loan_repayment_main': (context) => LoanRepaymentMain(),
        '/make_early_repayment': (context) => MakeEarlyRepayment(),
        '/dashboard': (context) => const Dashboard(),
        '/savings_frequency': (context) => const SavingsFrequency(),
        '/new_saving_plan': (context) => const NewSavingPlan(),
        '/savings_screen': (context) => const SavingScreen(),
        '/saving_duration': (context) => const SavingDuration(),
        '/saving_duration_unlocked': (context) => const SavingDurationUnlocked(),
        '/lock_status': (context) => const LockStatus(),
        '/send_money_screen': (context) => SendMoneyScreen(),
        '/about_us': (context) => const AboutUs(),
        '/chats_profile': (context) => const ChatsProfile(),
        '/chats_screen': (context) => const ChatsScreen(),
        '/contact_us': (context) => const ContactUs(),
        '/password_reset': (context) => const PasswordReset(),
        '/contacts': (context) => const Contacts(),
        '/messages_screen': (context) => MessagesScreen(),
        '/choose_plan': (context) => ChoosePlan(),
        '/previous_savings': (context) => PreviousSavings(),
        ////////
        '/enter_phone_no2': (context) => EnterPhoneNumber2(),
        '/mojaloop': (context) => SendMoneyScreen(),
        '/withdraw': (context) => WithdrawMethod(),
        '/mobile_money_topup': (context) => MobileMoneyTopUp(),
        '/verification_details': (context) => VerificationDetails(),
        '/make_payment': (context) => MakePayment(),
        '/plan_pay': (context) => PlanPay(),
        '/plan_payment_method': (context) => PlanPaymentMethod(),
        // '/complete_profile': (context) => CompleteProfile(),

      },
    );
  }
}
