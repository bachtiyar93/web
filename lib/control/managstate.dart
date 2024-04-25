import 'package:apphelper/apphelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web/model/menu_icon.dart';
import 'package:web/ui/dashboard/dashboard.dart';
import 'package:universal_html/html.dart';
import 'package:web/ui/profile/profile.dart';
import 'package:web/ui/project/project.dart';
import 'package:web/ui/settings/settings.dart';

class ManagState extends ChangeNotifier{
  Widget pageHome=const Dashboard();
  MenuIcon? activePage;
  handler(){
    return document.onContextMenu.listen((event) => event.preventDefault());
  }
  List<MenuIcon> menu =[
    MenuIcon(icon: Icons.person_outlined, appName: 'Profile', status: false, windowMode: 1, widget: const Profile()),
    MenuIcon(icon: Icons.featured_play_list_outlined, appName: 'Preview', status: false, windowMode: 1, widget: const Project()),
    MenuIcon(icon: Icons.handyman_outlined, appName: 'Ability Skills', status: false, windowMode: 1),
    MenuIcon(icon: Icons.contact_mail_outlined, appName: 'Personal Documents', status: false, windowMode: 1),
    MenuIcon(icon: Icons.settings_outlined, appName: 'Settings', status: false, windowMode: 1, widget: const Settings()),
  ];

  void setActiveMenu(index) {
    activePage=menu[index];
    if(activePage!.widget==null){
      AppHelpers.showWarning(title:'404 Not Found',text: 'Page Under Maintenance');
    }else if (!activePage!.status) {
      activePage!.status = true;
    }
    notifyListeners();
  }

  closePage() {
    menu.where((element) => element.appName==activePage!.appName).first.status=false;
    activePage=null;
    notifyListeners();
  }

  Future<Uint8List?> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return pickedFile.readAsBytes();
    }
    return null;
  }

}