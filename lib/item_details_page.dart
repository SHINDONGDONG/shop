import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants.dart';


class ItemDetailPage extends StatefulWidget {
  ItemDetailPage({Key? key, required this.productName, required this.productImageUrl, required this.productNo, required this.price}) : super(key: key);
  String productName;
  String productImageUrl;
  int productNo;
  double price;

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("제품 상세 페이지"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            Hero(
              tag: widget.productNo,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width * .8,
                  imageUrl: widget.productImageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context,url){
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                      ),
                    );
                  },
                  errorWidget: (context,url,error){
                    return const Center(
                      child: Text("오류발생"),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
              widget.productName,
              textScaleFactor: 1.5,
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "${numberFormat.format(widget.price)}원",
                textScaleFactor: 1.3,
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                )

              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: (){},
          child: const Text("장바구니 담기"),
        ),
      ),
    );

  }
}
