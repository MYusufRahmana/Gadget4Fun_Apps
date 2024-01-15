import 'package:flutter/material.dart';
import 'package:pab_tean/model/forum_model.dart';

class ForumUlasanDetail extends StatefulWidget {
  final forum_model details;

  const ForumUlasanDetail({Key? key, required this.details}) : super(key: key);

  @override
  _ForumUlasanDetailState createState() => _ForumUlasanDetailState();
}

class _ForumUlasanDetailState extends State<ForumUlasanDetail> {
  List<bool> isLikedList = List.generate(comments.length, (index) => false);
  List<bool> isDislikedList = List.generate(comments.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.details.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Handphone
            Image.network(
              widget.details.imageAsset,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2.3,
            ),
            // Informasi Handphone
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.details.name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.details.Tahun,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            // Review/Komentar dari Pengguna
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Review/Komentar',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Informasi Pengguna (Foto Profil dan Komentar)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(comments[index].userImage),
                            ),
                            title: Text(
                              comments[index].userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              comments[index].comment,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isLikedList[index] = !isLikedList[index];
                                    if (isDislikedList[index]) {
                                      isDislikedList[index] = !isDislikedList[index];
                                    }
                                  });
                                },
                                child: Icon(
                                  isLikedList[index] ? Icons.favorite_border : Icons.favorite_border,
                                  color: isLikedList[index] ? Colors.red : Colors.grey,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isDislikedList[index] = !isDislikedList[index];
                                    if (isLikedList[index]) {
                                      isLikedList[index] = !isLikedList[index];
                                    }
                                  });
                                },
                                child: Icon(
                                  isDislikedList[index]
                                      ? Icons.thumb_down
                                      : Icons.thumb_down_alt_outlined,
                                  color: isDislikedList[index] ? Colors.black : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Comment {
  final String userName;
  final String userImage;
  final String comment;

  Comment({
    required this.userName,
    required this.userImage,
    required this.comment,
  });
}

List<Comment> comments = [
  Comment(
    userName: 'Bulan',
    userImage:
        'https://asset.kompas.com/crops/LSMN2A0Nb63c007RdtzkEHhuhGE=/0x0:0x0/375x240/data/photo/2023/04/11/6434da4f16377.jpeg',
    comment: 'Untuk kesan pengguna pertama handphone ini cukup worth it untuk harga segitu',
  ),
  Comment(
    userName: 'David',
    userImage:
        'https://thumb.zigi.id/frontend/thumbnail/2023/02/28/zigi-63fdc5d535f6f-david-gadgetin_910_512.jpeg',
    comment:
        'Untuk handphone seharga itu dan spesifikasi demikian mungkin untuk yang memiliki dana banyak sangat worth it tetapi untuk yang memiliki budget pas-pasan kurasa harus mikir ulang',
  ),
  Comment(
    userName: 'Tean',
    userImage:
        'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/04/10/bocoran-karakter-yang-akan-rilis-di-genshin-impact-5-3971527132.jpg',
    comment: 'Mantapppp',
  ),
  // Anda dapat menambahkan lebih banyak komentar sesuai kebutuhan
];
