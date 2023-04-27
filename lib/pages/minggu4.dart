import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insomnia/common/subjects.dart';
import 'package:insomnia/pages/minggu4list.dart';
import 'package:insomnia/pages/minggu4provider.dart';
import 'package:provider/provider.dart';

class MingguEmpat extends StatefulWidget {
  const MingguEmpat({super.key});

  @override
  State<MingguEmpat> createState() => _MingguEmpatState();
}

class _MingguEmpatState extends State<MingguEmpat> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  bool ? isTitleEmpty ;
  bool ? isDescriptionEmpty;
  bool ? isStockEmpty;

  bool formChecker(){
    int errCount = 0;
    if (titleController.text.isEmpty){
      setState(() {
        isTitleEmpty = true;
      });
      errCount++;
    }
    else{
      setState(() {
        isTitleEmpty = false;
      });
    }
    if (descriptionController.text.isEmpty){
      setState(() {
        isDescriptionEmpty = true;
      });
      errCount++;
    }
    else{
      setState(() {
        isDescriptionEmpty = false;
      });
    }
    if (stockController.text.isEmpty || int.parse(stockController.text) == 0){
      setState(() {
        isStockEmpty = true;
      });
      errCount++;
    }
    else{
      setState(() {
        isStockEmpty = false;
      });
    }
    if (errCount > 0){
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    final provide = Provider.of<MingguEmpatProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/wallpaper.png"),
              fit: BoxFit.cover
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: FloatingActionButton(
                    heroTag: "backBtn",
                    onPressed: ()=>{
                      Navigator.pop(context)
                    },
                    backgroundColor: Colors.black26,
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
          
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 25, left: 25, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    "${subjects[3].week}\n${subjects[3].title}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 25, left: 25, bottom: 25),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Input Produk",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold
                        ),
                      ),
    
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                      ),
            
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.white
                              ),
                              controller: titleController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                labelText: "Produk",
                                hintText: "Nama Produk",
                                labelStyle: TextStyle(
                                  color: isTitleEmpty == true ? Colors.red : Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ) ,
                                hintStyle: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20
                                ),
                                errorText: isTitleEmpty == true ? "Nama Produk Harus Diisi" : null,
                                errorStyle: const TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
    
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                      ),
    
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.white
                              ),
                              controller: descriptionController,
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                labelText: "Deskripsi",
                                hintText: "Deskripsi Produk",
                                labelStyle: TextStyle(
                                  color: isDescriptionEmpty == true? Colors.red : Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ) ,
                                hintStyle: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20
                                ),
                                errorText: isDescriptionEmpty == true ? "Deskripsi Harus Diisi" : null,
                                errorStyle: const TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              minLines: 3,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
    
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                      ),
    
                      Row(
                        children: [
                          const Text(
                            "Stok :",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),
                          ),
    
                          const Padding(
                            padding: EdgeInsets.only(right: 30),
                          ),
    
                          SizedBox(
                            width: 100,
                            child: TextField(
                              style: const TextStyle(
                                color: Colors.white
                              ),
                              controller: stockController,
                              decoration: InputDecoration(
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white
                                  )
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white
                                  )
                                ),
                                hintText: "Stok Produk",
                                hintStyle: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 20
                                ),
                                errorText: isStockEmpty == true ? "Stok Harus Diisi" : null,
                                errorStyle: const TextStyle(
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            ),
                          ),
    
                        ],
                      ),
    
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                      ),
    
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: (){
                                bool valid = formChecker();
                                if(valid == true){
                                  Map <String, String> data = {
                                    "produk" : titleController.text,
                                    "description" : descriptionController.text,
                                    "stok" : stockController.text
                                  };
                                  provide.addProduk(data);
                                  Navigator.pushReplacement(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) => const MingguEmpatList()
                                    )
                                  );
                                }
                              }, 
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  const Size.fromHeight(50)
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.blue
                                ),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)
                                  )
                                )
                              ),
                              child: const Text(
                                "Tambah Produk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "btnList",
          onPressed: ()=>{
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const MingguEmpatList()
              )
            )
          }, 
          label: const Text(
            "List Produk",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          icon: const Icon(Icons.list),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}