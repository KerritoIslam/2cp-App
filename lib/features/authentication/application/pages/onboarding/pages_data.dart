import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class PagesData {
 static final  _decoration= PageDecoration(

    
    );

  static final firstPage=PageViewModel(
    decoration:_decoration ,    image: SvgPicture.asset('assets/images/office_work.svg'),
    title: 'Find Internships Easily',
    body:"Browse thousands of opportunities based on your skills, location, and interests."
      
  );
  static final secondPage=PageViewModel(
    decoration: _decoration,
    image: SvgPicture.asset('assets/images/QA_engineers.svg'),
    title:'Track Your Applications',
    body: 'Keep track of all your applications in one place and never miss a deadline.'
  );
  static final thirdPage=PageViewModel(
    decoration:_decoration,    
    image: SvgPicture.asset('assets/images/profile_data.svg'),
    title: 'Build Your Profile',
    body: 'Showcase your resume, skills, and achievements to stand out to employers.'
  );
  static final fourthPage=PageViewModel(
    decoration: _decoration,
    image: SvgPicture.asset('assets/images/new_entry.svg'),
    title: ' Ready to kickstart your journey?',
    body: 'Create your profile now and unlock endless internship opportunities at your fingertips !'
  );
}
