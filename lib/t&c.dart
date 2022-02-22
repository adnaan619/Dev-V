import 'package:flutter/material.dart';
import 'package:demo_cuticare/main_pages/bottom_nav_bar.dart';

void main() => runApp(MaterialApp(
  home: TermsAndConditions(),
  debugShowCheckedModeBanner: false,
));

class TermsAndConditions extends StatefulWidget{
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions>{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.008),
              Container(
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                child: Row(
                  children: [
                    Icon(
                      Icons.article_outlined,
                      size: size.height * 0.06,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                        width: size.width * 0.04),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Terms and Conditions",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "Last Updated: Feb/21/2022",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: size.height * 0.0175,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: size.width * 0.015),
              Expanded(
                child: Container(
                  width: size.width,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.01,
                    horizontal: size.height * 0.045,
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      "By downloading or using the app, these terms will automatically apply to you – you "
                          "should make sure therefore that you read them carefully before using the app. "
                          "You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. "
                          "You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try "
                          "to translate the app into other languages or make derivative versions. "
                          "The app itself, and all the trademarks, copyright, database rights, and other intellectual "
                          "property rights related to it, still belong to DevV."
                          "\n\n"
                          "DevV is committed to ensuring that the app is as useful and efficient as possible. "
                          "For that reason, we reserve the right to make changes to the app or to charge for its services, "
                          "at any time and for any reason. We will never charge you for the app or its services without making "
                          "it very clear to you exactly what you’re paying for."
                          "\n\n"
                          "The CutiCare app stores and processes personal data that you have provided to us, "
                          "to provide our Service. It’s your responsibility to keep your phone and access to the app secure. "
                          "We, therefore, recommend that you do not jailbreak or root your phone, which is the process of "
                          "removing software restrictions and limitations imposed by the official operating system of your device. "
                          "It could make your phone vulnerable to malware/viruses/malicious programs, compromise your "
                          "phone’s security features and it could mean that the CutiCare app won’t work properly or at all."
                          "\n\n"
                          "The app does use third-party services that declare its Terms and Conditions."
                          "Link to Terms and Conditions of third-party service providers used by the app"
                          "\nGoogle Play Services\nGoogle Analytics for Firebase\nFirebase Crashlytics\nFacebook\n\n"
                          "You should be aware that there are certain things that DevV will not take responsibility for. "
                          "Certain functions of the app will require the app to have an active internet connection. "
                          "The connection can be Wi-Fi or provided by your mobile network provider, but DevV cannot take "
                          "responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, "
                          "and you don’t have any of your data allowance left."
                          "\n\nIf you’re using the app outside of an area with Wi-Fi, you should remember that the terms of "
                          "the agreement with your mobile network provider will still apply. As a result, you may be "
                          "charged by your mobile provider for the cost of data for the duration of the connection while "
                          "accessing the app, or other third-party charges. In using the app, you’re accepting responsibility "
                          "for any such charges, including roaming data charges if you use the app outside of your home "
                          "territory (i.e. region or country) without turning off data roaming. If you are not the bill "
                          "payer for the device on which you’re using the app, please be aware that we assume that you have "
                          "received permission from the bill payer for using the app."
                          "\n\nAlong the same lines, DevV cannot always take responsibility for the way you use the app i.e. "
                          "You need to make sure that your device stays charged – if it runs out of battery and you can’t "
                          "turn it on to avail the Service, DevV cannot accept responsibility.\n"
                          "concerning DevV’s responsibility for your use of the app, when you’re using the app, it’s "
                          "important to bear in mind that although we endeavor to ensure that it is updated and correct at "
                          "all times, we do rely on third parties to provide information to us so that we can make it available "
                          "to you. DevV accepts no liability for any loss, direct or indirect, you experience as a result of "
                          "relying wholly on this functionality of the app."
                          "\n\n\nAt some point, we may wish to update the app. The app is currently available on "
                          "Android & iOS – the requirements for both systems(and for any additional systems we decide "
                          "to extend the availability of the app to) may change, and you’ll need to download the updates "
                          "if you want to keep using the app. DevV does not promise that it will always update the app so "
                          "that it is relevant to you and/or works with the Android & iOS versions that you have installed"
                          " on your device. However, you promise to always accept updates to the application when offered to you, We may "
                          "also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination "
                          "to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you "
                          "in these terms will end; (b) you must stop using the app, and (if needed) delete it from "
                          "your device.\n\nContact Us"
                          "\nIf you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact "
                          "us at CutiCare@DevV.com.\n",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: size.height * 0.022,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.015),
              Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02,
                ),
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.035),
                child: Row(
                  children: [
                    SizedBox(width: size.width * 0.015),
                    Expanded(
                      child: TermsButton(
                          isAccepted: true,
                          title: "Back",
                          onTap: () {
                            print("Clicked");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => BottomNavBar()));

                          }

                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TermsButton extends StatelessWidget{
  final String title;
  final bool isAccepted;
  final VoidCallback onTap;
  const TermsButton({
    required this.title,
    required this.onTap,
    this.isAccepted = false,
  });

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Material(
      child: InkWell(
        onTap: () => onTap(),
        splashColor: Colors.redAccent,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            border: Border.all(
              color: isAccepted ? Colors.white : Colors.redAccent,
              width: size.width * 0.005,
            ),
            borderRadius: BorderRadius.circular(size.height * 0.01),
            color: isAccepted ? Colors.redAccent : Colors.white,
          ),
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: size.height * 0.023,
              fontWeight: FontWeight.w600,
              color: isAccepted ? Colors.white : Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}





