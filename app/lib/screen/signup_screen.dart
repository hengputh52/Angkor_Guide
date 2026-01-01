import 'package:app/screen/home_page.dart';
import 'package:app/widget/animations/fade_slide_animation.dart';
import 'package:app/widget/animations/flow_page_animation.dart';
import 'package:app/widget/lanaguage/langauge_switch_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override 
  void initState()
  {
    super.initState();
  }

  @override  
  void dispose()
  {
    super.dispose();
    _nameController.dispose();
  }

  void onContinue()
  {
    if(_formkey.currentState != null && _formkey.currentState!.validate())
    {
      Navigator.of(context).pushReplacement(
              FlowPageRoute(page: const HomeScreen()),
            );
    }
  }

  String? validateName(String? value)
  {
    if(value == null || value.isEmpty)
    {
      return 'Name cannot be empty';
    }
    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background illustration image
          
          Positioned.fill(
            child: Image.asset(
              'assets/images/angkor_thom.png',
              fit: BoxFit.cover,
               // Optional: fade effect
              //colorBlendMode: BlendMode.dstATop,
            ),
          ),
          // Foreground content
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            bottom: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 🔹 Header
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/bayon_face.png'),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'Angkor Guide',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                        ],
                      ),
                      
                      LanguageSwitchButton(
                        onLanguageChanged: (lang)
                        {

                        })
                    ],
                  ),
                ),
                //const SizedBox(height: 60), // Add space since illustration is now background

                // 🔹 Form Section + Continue Button as one child
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: FadeSlideAnimation(
                    beginOffset: Offset(0, 0.4),
                    child: 
                  Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Full Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                            validator: validateName,
                            style: TextStyle(color: Colors.white),
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              
                              hintStyle: TextStyle(color: const Color.fromARGB(255, 229, 224, 224)),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                                
                              
                                
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide(color: Colors.white70, width: 0.5),
                                
                                
                                
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: const BorderSide(color: Colors.white),
                                
                              ),
                              filled: true,
                              fillColor: Colors.white10
                            ),
                          ),
                        
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                    
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                                
                              ),
                            ),
                            onPressed: onContinue,
                            
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
