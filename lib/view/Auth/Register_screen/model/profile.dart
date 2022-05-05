class Profile{
  int id;
  String name ;
  String email ;
  String position ;
  String company ;
  String phone;
  String password;

  Profile({required this.id ,required this.name, required this.email , required this.position ,required this.company,required this.phone, required this.password});

}
 Profile dummyProfile = Profile(id:0,name: '', email: '', position: '', company: '', phone: '',password: '');
