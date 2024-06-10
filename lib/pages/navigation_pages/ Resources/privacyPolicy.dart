import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Privacy Policy",
          style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10,right: 10),
          child:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("GENERAL:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("AMERICAN QUARTZ's Privacy Policy governs the collection, use, and disclosure of information on \nhttps://www.americanquartzusa.com.\n By using the website, you agree to this policy and the Terms of Use. We are dedicated to safeguarding your privacy and encourage regular review of this policy for updates."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Information Collection:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("We collect Personally Identifiable Information (like name, email, phone) and Anonymous/Non-Personally Identifiable Information (IP address, browser type) when you use our website."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Privacy of Children:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("We do not knowingly collect personal information from children under 13 without parental consent. Parents can request removal of their child's information."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Use of Information:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("We use collected information for improving user experience, sending communications, marketing messages, analytics, fraud prevention, and other lawful purposes."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Sharing Information:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("We may share information with service providers, in legal compliance, during business transitions, and with your consent."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Third Parties:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("We're not responsible for the privacy practices of third-party websites linked to or from our site."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Security Measures:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("We employ industry-standard security measures, but we cannot guarantee 100% security due to the nature of the internet."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Modification and Deletion:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("You can request modification or deletion of your Personally Identifiable Information through our online contact form."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Changes to Policy:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text(" This Privacy Policy may change; any updates will be posted on our website."),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Contact Us:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              ),
              Text("For questions or concerns about this policy, please contact us through our online contact form.\nhttp://americanquartzusa.com/contact-us"),
              SizedBox(height: 10,),
              Text("This Privacy Policy was last modified on: March 2020."),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
