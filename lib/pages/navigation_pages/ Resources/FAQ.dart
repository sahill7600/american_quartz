import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "FAQ",
          style: TextStyle(fontFamily: 'RaleWay', color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 12,right: 10),
          child:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("How do I maintain American Quartz's natural beauty?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("American Quartz is known for its carefree surfaces. Simply wipe off any grease, hairspray or makeup spills. To keep the surfaces clean, use a damp cloth and wipe with warm water and soap. For additional information please see our care and maintenance page."),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("How should I remove stubborn or dried spills?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("To remove any spills use a damp cloth and carefully apply warm, soapy water to the space. For tougher stains, apply a non-abrasive cleanser. If food and gum need to be removed, first scrape them away using a plastic putty knife and then apply a damp cloth to remove any remaining dirt. For additional information please see our care and maintenance page."),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 10),
                child: Text("How durable is American Quartz?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("American Quartz produces the most durable surface material engineered stone. Quartz ranks number 7.0 on MOH’s Hardness scale, which is used to measure the scratch- resistance of a material. It is resistant to cracks, chips, scratches, and stains. Although it is very durable, excessive amounts of stress from objects can harm the surface."),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Do I need to apply a sealer to American Quartz?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("Due to American Quartz’s non-porous surfaces, you will never have to apply sealer to any of our surfaces."),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Can I cut on my American Quartz countertop?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("Our engineered stone is more ‘stone-like’ because it’s a mixture of 94% quartz and 6% polyester resin which is pressed into slabs. Due to this engineering, our quartz has superior strength and beauty. Although your knives will not ruin American Quartz, the use of a cutting board is suggested to avoid dulling the surface or damaging knife blades."),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("How do I maintain the polish on my American Quartz countertop?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("For polished stone, cleaning with a wet damp cloth will keep your surface looking great. Use non-abrasive cleansers to avoid dulling the surface."),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("How well does American Quartz withstand heat?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("American Quartz is more heat resistant in comparison to other stones, including granite.Unfortunately, even the finest material can suffer damages from sudden changes in temperature. Be careful not to place hot pans directly onto the surface although material can withstand heat up to 356°F."),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Are there any chemicals or cleaners to avoid using?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("Avoid chemicals with high alkaline or PH level. Materials that might contain this include, oven grill cleaners, floor strippers, toilet bowl cleaners, oil soaps, tarnish removers, furniture cleaners, and drain products."),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Is caring for my American Quartz surface really this easy?",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              ),
              Text("A benefit of American Quartz’s products is that they will allow you to focus on the important things in life. Choose American Quartz to be your surface of choice, and enjoy American Quartz’s worry and care-free bonuses."),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Can American Quartz be used outdoors?",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                ),
              ),
              Text("Please note that the outdoor use of our products is not covered by our Lifetime Warranty. American Quartz’s products have not been tested under prolonged exposure to UV rays. Unfortunately, installing our products outdoors will render our Lifetime Warranty null and void."),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
