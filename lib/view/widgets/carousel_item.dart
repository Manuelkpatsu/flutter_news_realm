import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {},
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1513152697235-fe74c283646a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                colorBlendMode: BlendMode.darken,
                color: Colors.black.withOpacity(0.2),
              ),
              const Positioned(
                top: 10,
                left: 10,
                right: 10,
                child: Text(
                  '3 hours ago',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              const Positioned(
                bottom: 20,
                right: 10,
                left: 10,
                child: Text(
                  'Save the endangered sumatran elephant',
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
