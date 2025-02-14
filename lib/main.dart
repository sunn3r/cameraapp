import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
void main() => runApp(MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Colors.blue,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Form(
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: <Widget>[
            imageProfile(),
            nameTextField("Name", "Input name and lastname", 60, controller1),
            nameTextField("Major", "Input major", 60, controller2),
            nameTextField("Faculty", "Input faculty name", 60, controller3),
            nameTextField("Telephone", "Input phone number", 60, controller4),
            nameTextField("Address", "Input address", 60, controller5),
            SizedBox(
              height: 10,
            ),
          ])),
    );
  }

  Widget nameTextField(String title, String hinttext, double sizebox,
      TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: sizebox,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: hinttext,
              prefixIcon: Align(
                widthFactor: 1.0,
                heightFactor: sizebox,
                child: Icon(
                  Icons.person,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          _image != null
              ? CircleAvatar(
                  radius: 80.0, backgroundImage: MemoryImage(_image!))
              : const CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
          Positioned(
            bottom: 0,
            right: 20,
            child: IconButton(
              onPressed: () {
                showImagePickerOption(context);
              },
              icon: Icon(
                Icons.add_a_photo,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 70,
                        ),
                        Text("Gallert"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          size: 70,
                        ),
                        Text("Camera"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
// Future _pickImageFromGallery() async {
//   final returnImage =
//       await ImagePicker().pickImage(source: ImageSource.gallery);
//   if (returnImage == null) return;
//   setState(() {
//     selectedImage = File(returnImage.path);
//     _image = File(returnImage.path).readAsBytesSync();
//   });
//   Navigator.of(context).pop();
// }
}
