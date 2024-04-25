// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:universal_html/html.dart';
//
// Future getImage() async {
//   Map<String, String> mapSelections = {"1": "Gallery", "2": "Camera"};
//   List<String> formatSupport=['.jpg','.jpeg','.png','.heic','.heif','.raw','.pdf','.doc','.docx'];
//   if (widget.enableFile) mapSelections["3"] = "File";
//   if(widget.enableFile) {
//     await Helper.selection(context, selections: mapSelections,
//         success: (key) async {
//           bool status1 = false;
//           bool status3 = false;
//           bool status2 = false;
//           if (key == "1") {
//             await Permission.photos.status;
//             status1 = await Permission.photos.request().isGranted;
//             if (status1) {
//               var image;
//               try{
//                 image= await ImagePicker()
//                     .pickImage(source: ImageSource.gallery, imageQuality: 70);
//                 if(!formatSupport.contains(p.extension(image.path).toLowerCase())){
//                   return Helper.toastError(context, "Image not supported, please use JPEG, PNG, HEIF, or RAW but your format is ${p.extension(image.path).toLowerCase()}");
//                 }
//               }catch(e){
//                 return Helper.toastError(context, "Image file is corrupted, please change other image");
//               }
//               if (image != null) {
//                 setState(() {
//                   widget.imageFile = File(image.path);
//                   if (widget.listener != null) widget.listener(widget.imageFile);
//                 });
//               }
//             } else {
//               await Permission.photos.request();
//               status1 = await Permission.photos.request().isGranted;
//               if (status1) {
//                 var image;
//                 try{
//                   image= await ImagePicker()
//                       .pickImage(source: ImageSource.gallery, imageQuality: 70);
//                   if(!formatSupport.contains(p.extension(image.path).toLowerCase())){
//                     return Helper.toastError(context, "Image not supported, please use JPEG, PNG, HEIF, or RAW");
//                   }
//                 }catch(e){
//                   return Helper.toastError(context, "Image file is corrupted, please change other image");
//                 }
//                 if (image != null) {
//                   setState(() {
//                     widget.imageFile = File(image.path);
//                     if (widget.listener != null)
//                       widget.listener(widget.imageFile);
//                   });
//                 }
//               } else {
//                 Helper.toastError(context,
//                     'No have permission, please manually granted access');
//               }
//             }
//           } else if (key == '2') {
//             await Permission.camera.status;
//             status2 = await Permission.camera.request().isGranted;
//             if (status2) {
//               var image = await ImagePicker()
//                   .pickImage(source: ImageSource.camera, imageQuality: 70);
//               if (image != null) {
//                 setState(() {
//                   widget.imageFile = File(image.path);
//                   if (widget.listener != null) widget.listener(widget.imageFile);
//                 });
//               }
//             } else {
//               await Permission.camera.request();
//               status2 = await Permission.camera.request().isGranted;
//               if (status2) {
//                 var image = await ImagePicker()
//                     .pickImage(source: ImageSource.camera, imageQuality: 70);
//                 if (image != null) {
//                   setState(() {
//                     widget.imageFile = File(image.path);
//                     if (widget.listener != null)
//                       widget.listener(widget.imageFile);
//                   });
//                 }
//               } else {
//                 Helper.toastError(context,
//                     'No have permission, please manually granted access');
//               }
//             }
//           } else if (key == '3') {
//             if(Platform.isAndroid){
//               await getFile();
//               // Saf saf = Saf("~/");
//               // bool? isGranted = await saf.getDirectoryPermission(isDynamic: true);
//               //
//               // if (isGranted==null||isGranted) {
//               //   await getFile();
//               // } else {
//               //   isGranted = await saf.getDirectoryPermission(isDynamic: true);
//               //   if (isGranted==null||isGranted) {
//               //     await getFile();
//               //   }else{
//               //     Helper.toastError(context,
//               //         'No have permission, please manually granted access');
//               //   }
//               // }
//             }
//             else if(Platform.isIOS){
//               await Permission.storage.request();
//               status3 = await Permission.storage.request().isGranted;
//               if (status3) {
//                 await getFile();
//               } else {
//                 await Permission.storage.request();
//                 status3 = await Permission.storage.request().isGranted;
//                 if (status3) {
//                   await getFile();
//                 } else {
//                   Helper.toastError(context,
//                       'No have permission, please manually granted access');
//                 }
//               }
//             }else{
//               return  Helper.toastError(context,
//                   'No have permission, please manually granted access');
//             }
//           }
//         });
//   }else{
//     bool status2 = false;
//     await Permission.camera.request();
//     status2 = await Permission.camera.request().isGranted;
//     if (status2) {
//       var image = await ImagePicker()
//           .pickImage(source: ImageSource.camera, imageQuality: 70);
//       if (image != null) {
//         setState(() {
//           widget.imageFile = File(image.path as List<Object>);
//           if (widget.listener != null)
//             widget.listener(widget.imageFile);
//         });
//       }
//     } else {
//       Helper.toastError(context,
//           'No have permission, please manually granted access');
//     }
//   }
// }
//
// class ImagePickerImb extends StatefulWidget {
//   String? url;
//   String hint;
//   File? imageFile;
//   File? fileFile;
//   bool isProfile;
//   double widthProfile;
//   double sizeIconProfile;
//   var listener;
//   var enableFile;
//   var enableGallery;
//   _ImagePickerImb? model;
//
//   ImagePickerImb(
//       {this.url,
//         this.imageFile,
//         this.listener,
//         this.hint = "Upload Image",
//         this.isProfile = false,
//         this.widthProfile = 90,
//         this.sizeIconProfile = 30,
//         this.enableFile = false,
//         this.enableGallery = true});
//
//   @override
//   State<StatefulWidget> createState() {
//     model = _ImagePickerImb();
//     return model!;
//   }
//
//   Future<String?>? uploadImage({path}) {
//     if (model == null) return null;
//
//     return model!.uploadImage(path: path);
//   }
//
//   void refresh() {
//     if (model != null) model!.setState(() {});
//   }
// }
//
// class _ImagePickerImb extends State<ImagePickerImb> {
//   @override
//   Widget build(BuildContext context) {
//     Widget imgChild;
//     Widget remove = Container();
//
//     bool _validURL = widget.url != null && Uri.parse(widget.url!).isAbsolute;
//     if (!_validURL) widget.url = "";
//
//     if (widget.imageFile != null) {
//       if (widget.isProfile) {
//         imgChild = Stack(children: <Widget>[
//           Center(
//               child: Container(
//                   width: widget.widthProfile,
//                   height: widget.widthProfile,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey[300]!),
//                       borderRadius: BorderRadius.circular(widget.widthProfile)),
//                   child: CircleAvatar(backgroundImage: FileImage(widget.imageFile!)))),
//         ]);
//       } else {
//         imgChild = Stack(children: <Widget>[
//           Center(
//               child: Image.file(widget.imageFile!, width: MediaQuery.of(context).size.width - 40)),
//         ]);
//       }
//       remove = Icon(Icons.clear, color: Colors.red);
//     } else if (widget.fileFile != null) {
//       imgChild = Stack(children: <Widget>[
//         Center(
//             child: Column(children: [
//               Icon(Icons.insert_drive_file_rounded, size: 30, color: Colors.green[400]),
//               Wgt.spaceTop(5),
//               Wgt.textSecondary(context, "File ready to upload", color: Colors.green),
//             ])),
//       ]);
//       remove = Icon(Icons.clear, color: Colors.red);
//     } else if (widget.url != null && widget.url != "") {
//       if (widget.url!.endsWith("pdf")) {
//         imgChild = InkWell(
//           onTap: () {
//             Helper.openWebview(context, url: widget.url);
//           },
//           child: Center(
//               child: Column(children: [
//                 Icon(Icons.insert_drive_file_rounded, color: Colors.grey[700], size: 30),
//                 Wgt.spaceTop(5),
//                 Wgt.textSecondary(context, "Preview PDF", color: Colors.grey[700]),
//               ])),
//         );
//       } else if (widget.isProfile) {
//         imgChild = Center(
//             child: Container(
//                 child: Wgt.image(
//                     url: widget.url,
//                     width: widget.widthProfile,
//                     height: widget.widthProfile,
//                     roundedRadius: widget.widthProfile)));
//       } else {
//         imgChild = Center(
//             child: Wgt.image(url: widget.url, width: MediaQuery.of(context).size.width - 40));
//       }
//       remove = Container();
//     } else {
//       if (!widget.isProfile)
//         imgChild = Container(
//             padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
//             decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey[300]!),
//                 borderRadius: BorderRadius.circular(5)),
//             child: Column(children: <Widget>[
//               Icon(Icons.cloud_upload, color: Colors.grey),
//               Wgt.text(context, "${widget.hint}", color: Colors.grey),
//             ]));
//       else
//         imgChild = Column(children: <Widget>[
//           Container(
//               width: widget.widthProfile,
//               height: widget.widthProfile,
//               padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey[300]!),
//                   borderRadius: BorderRadius.circular(widget.widthProfile)),
//               child: Center(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Icon(Icons.cloud_upload, size: widget.sizeIconProfile, color: Colors.grey[400])
//                     ],
//                   ))),
//           Wgt.spaceTop(10),
//           Wgt.text(context, "${widget.hint}", color: Colors.grey)
//         ]);
//       remove = Container();
//     }
//
//     return Stack(children: <Widget>[
//       Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             !widget.isProfile
//                 ? Expanded(
//                 child: Material(
//                     color: Colors.transparent,
//                     child: InkWell(onTap: () async => await getImage(), child: imgChild)))
//                 : Container(
//               child: Material(
//                   color: Colors.transparent,
//                   child: InkWell(onTap: () async => await getImage(), child: imgChild)),
//             ),
//           ]),
//       Positioned(
//           right: 0,
//           child: InkWell(
//               child: remove,
//               onTap: () {
//                 widget.imageFile = null;
//                 setState(() {});
//               }))
//     ]);
//   }
//
//   Future getImage() async {
//     Map<String, String> mapSelections = {"1": "Gallery", "2": "Camera"};
//     List<String> formatSupport=['.jpg','.jpeg','.png','.heic','.heif','.raw','.pdf','.doc','.docx'];
//     if (widget.enableFile) mapSelections["3"] = "File";
//     if(widget.enableFile) {
//       await Helper.selection(context, selections: mapSelections,
//           success: (key) async {
//             bool status1 = false;
//             bool status3 = false;
//             bool status2 = false;
//             if (key == "1") {
//               await Permission.photos.status;
//               status1 = await Permission.photos.request().isGranted;
//               if (status1) {
//                 var image;
//                 try{
//                   image= await ImagePicker()
//                       .pickImage(source: ImageSource.gallery, imageQuality: 70);
//                   if(!formatSupport.contains(p.extension(image.path).toLowerCase())){
//                     return Helper.toastError(context, "Image not supported, please use JPEG, PNG, HEIF, or RAW but your format is ${p.extension(image.path).toLowerCase()}");
//                   }
//                 }catch(e){
//                   return Helper.toastError(context, "Image file is corrupted, please change other image");
//                 }
//                 if (image != null) {
//                   setState(() {
//                     widget.imageFile = File(image.path);
//                     if (widget.listener != null) widget.listener(widget.imageFile);
//                   });
//                 }
//               } else {
//                 await Permission.photos.request();
//                 status1 = await Permission.photos.request().isGranted;
//                 if (status1) {
//                   var image;
//                   try{
//                     image= await ImagePicker()
//                         .pickImage(source: ImageSource.gallery, imageQuality: 70);
//                     if(!formatSupport.contains(p.extension(image.path).toLowerCase())){
//                       return Helper.toastError(context, "Image not supported, please use JPEG, PNG, HEIF, or RAW");
//                     }
//                   }catch(e){
//                     return Helper.toastError(context, "Image file is corrupted, please change other image");
//                   }
//                   if (image != null) {
//                     setState(() {
//                       widget.imageFile = File(image.path);
//                       if (widget.listener != null)
//                         widget.listener(widget.imageFile);
//                     });
//                   }
//                 } else {
//                   Helper.toastError(context,
//                       'No have permission, please manually granted access');
//                 }
//               }
//             } else if (key == '2') {
//               await Permission.camera.status;
//               status2 = await Permission.camera.request().isGranted;
//               if (status2) {
//                 var image = await ImagePicker()
//                     .pickImage(source: ImageSource.camera, imageQuality: 70);
//                 if (image != null) {
//                   setState(() {
//                     widget.imageFile = File(image.path);
//                     if (widget.listener != null) widget.listener(widget.imageFile);
//                   });
//                 }
//               } else {
//                 await Permission.camera.request();
//                 status2 = await Permission.camera.request().isGranted;
//                 if (status2) {
//                   var image = await ImagePicker()
//                       .pickImage(source: ImageSource.camera, imageQuality: 70);
//                   if (image != null) {
//                     setState(() {
//                       widget.imageFile = File(image.path);
//                       if (widget.listener != null)
//                         widget.listener(widget.imageFile);
//                     });
//                   }
//                 } else {
//                   Helper.toastError(context,
//                       'No have permission, please manually granted access');
//                 }
//               }
//             } else if (key == '3') {
//               if(Platform.isAndroid){
//                 await getFile();
//                 // Saf saf = Saf("~/");
//                 // bool? isGranted = await saf.getDirectoryPermission(isDynamic: true);
//                 //
//                 // if (isGranted==null||isGranted) {
//                 //   await getFile();
//                 // } else {
//                 //   isGranted = await saf.getDirectoryPermission(isDynamic: true);
//                 //   if (isGranted==null||isGranted) {
//                 //     await getFile();
//                 //   }else{
//                 //     Helper.toastError(context,
//                 //         'No have permission, please manually granted access');
//                 //   }
//                 // }
//               }
//               else if(Platform.isIOS){
//                 await Permission.storage.request();
//                 status3 = await Permission.storage.request().isGranted;
//                 if (status3) {
//                   await getFile();
//                 } else {
//                   await Permission.storage.request();
//                   status3 = await Permission.storage.request().isGranted;
//                   if (status3) {
//                     await getFile();
//                   } else {
//                     Helper.toastError(context,
//                         'No have permission, please manually granted access');
//                   }
//                 }
//               }else{
//                 return  Helper.toastError(context,
//                     'No have permission, please manually granted access');
//               }
//             }
//           });
//     }else{
//       bool status2 = false;
//       await Permission.camera.request();
//       status2 = await Permission.camera.request().isGranted;
//       if (status2) {
//         var image = await ImagePicker()
//             .pickImage(source: ImageSource.camera, imageQuality: 70);
//         if (image != null) {
//           setState(() {
//             widget.imageFile = File(image.path);
//             if (widget.listener != null)
//               widget.listener(widget.imageFile);
//           });
//         }
//       } else {
//         Helper.toastError(context,
//             'No have permission, please manually granted access');
//       }
//     }
//   }
//
//   Future<String?> uploadImage({path}) async {
// //    if (widget.imageFile == null || path == null) return null;
// //    StorageReference ref = FirebaseStorage.instance.ref().child("$path.jpg");
// //    StorageUploadTask uploadTask = ref.putFile(widget.imageFile);
// //    var hasil = await (await uploadTask.onComplete).ref.getDownloadURL();
//
// //    return hasil;
//     return null;
//   }
//
//   Future getFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowMultiple: false,
//       allowedExtensions: ['jpg', 'jpeg','heic','heif','raw', 'png', 'pdf', 'doc', 'docx'],
//     );
//
//     if (result != null) {
//       widget.fileFile = File(result.files.single.path!);
//       setState(() {
//         if (widget.listener != null) widget.listener(widget.fileFile);
//       });
//     } else {
//       // User canceled the picker
//     }
//   }
// }