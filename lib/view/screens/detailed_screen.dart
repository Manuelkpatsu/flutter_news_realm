import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  const DetailedScreen({Key? key}) : super(key: key);

  @override
  _DetailedScreenState createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            iconTheme: const IconThemeData(color: Colors.white),
            floating: true,
            pinned: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: IntrinsicWidth(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.purple,
                  ),
                  child: const Text(
                    'Entertainment',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
              background: Image.network(
                'https://images.unsplash.com/photo-1600250395178-40fe752e5189?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHNvY2NlcnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  const Text(
                    "No, staring at a screen won't damage your eyes",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      authorAndTime(),
                      readDuration()
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 0, thickness: 1),
                  const SizedBox(height: 20),
                  const Text(
                    "I'm here to quell your health concerns: staring at a screen doesn't damage your eyes. They won't make you go blind, and your doctor isn't going to worry about your health if he or she hears that you're spending a lot of time in front of them.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const Text(
                    "I'm here to quell your health concerns: staring at a screen doesn't damage your eyes. They won't make you go blind, and your doctor isn't going to worry about your health if he or she hears that you're spending a lot of time in front of them.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const Text(
                    "I'm here to quell your health concerns: staring at a screen doesn't damage your eyes. They won't make you go blind, and your doctor isn't going to worry about your health if he or she hears that you're spending a lot of time in front of them.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const Text(
                    "I'm here to quell your health concerns: staring at a screen doesn't damage your eyes. They won't make you go blind, and your doctor isn't going to worry about your health if he or she hears that you're spending a lot of time in front of them.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  Widget authorAndTime() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1513152697235-fe74c283646a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cHJvZmlsZSUyMHBob3RvfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
          ),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Sumanth MSV',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            Text(
              'posted: 3 days ago',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        )
      ],
    );
  }

  Widget readDuration() {
    return Row(
      children: const [
        Icon(Icons.access_time_rounded, color: Colors.red),
        SizedBox(width: 5),
        Text(
          '5 min',
          style: TextStyle(color: Colors.red),
        )
      ],
    );
  }
}
