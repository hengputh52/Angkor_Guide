// import 'package:flutter/material.dart';

// class AudioGuideItem extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final VoidCallback onTap;
//   final int number; // Add this

//   const AudioGuideItem({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.onTap,
//     required this.number, // Add this
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       height: 80,
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(color: Colors.black12))
//       ),
//       child: ListTile(
//         leading: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               number.toString(),
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(width: 8),
//             ClipRRect(
//               borderRadius: BorderRadius.circular(5),
//               child: Image.asset(imagePath, width: 60, fit: BoxFit.cover),
//             ),
//           ],
//         ),
//         title: Text(title),
//         //subtitle: Text(type.toUpperCase()),
//         trailing: const Icon(Icons.play_circle),
//         onTap: onTap,
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'favorite/favorite_button.dart';

// class AudioGuideItem extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final String poiId;
//   final VoidCallback onTap;
//   final int number;

//   const AudioGuideItem({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.poiId,
//     required this.onTap,
//     required this.number,
    
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Row(
//         children: [
//           // Image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.asset(
//               imagePath,
//               width: 70,
//               height: 50,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) {
//                 return Container(
//                   width: 70,
//                   height: 50,
//                   color: Colors.grey.shade200,
//                   child: const Icon(Icons.image, color: Colors.grey),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(width: 12),

//           // Title & Duration
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '$number. $title',
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   duration,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey.shade500,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Bookmark Button
//           FavoriteButton(poiId: poiId, size: 22),
//           const SizedBox(width: 8),

//           // Play Button
//           GestureDetector(
//             onTap: onTap,
//             child: Container(
//               width: 32,
//               height: 32,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.black, width: 1.5),
//               ),
//               child: const Icon(
//                 Icons.play_circle,
//                 size: 18,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'favorite/favorite_button.dart';

class AudioGuideItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final String poiId;
  final VoidCallback onTap;
  final int number;

  const AudioGuideItem({
    super.key,
    required this.title,
    required this.imagePath,
    required this.poiId,
    required this.onTap,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12)),
      ),
      child: ListTile(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(imagePath, width: 60, fit: BoxFit.cover),
            ),
          ],
        ),
        title: Text(title),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Bookmark Button
            FavoriteButton(poiId: poiId, size: 22),
            const SizedBox(width: 8),
            // Play Button
            GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.play_circle, size: 28),
            ),
          ],
        ),
      ),
    );
  }
}