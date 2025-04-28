// import 'package:flutter/material.dart';

// class CustomCard extends StatelessWidget {
//   final Widget? leading;
//   final Widget? title;
//   final Widget? subtitle;
//   final Widget? trailing;
//   final VoidCallback? onTap;
//   final Color? color;
//   final double elevation;
//   final EdgeInsetsGeometry padding;

//   const CustomCard({
//     super.key,
//     this.leading,
//     this.title,
//     this.subtitle,
//     this.trailing,
//     this.onTap,
//     this.color,
//     this.elevation = 2,
//     this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: color,
    
//       elevation: elevation,
//       child: ListTile(
        
//         leading: leading,
//         title: title,
//         subtitle: subtitle,
//         trailing: trailing,
//         contentPadding: padding,
//         onTap: onTap,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class GradientTopCard extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  
  final dynamic Icon;

  const GradientTopCard({
    Key? key,
     this.leading,
     this.title,
     this.subtitle,
    this.padding,
    this.trailing,
    this.onTap, 
    this.Icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: Column(
        children: [
          // Top Gradient Bar
          Container(
            height: 40,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFFF00), Color(0xFFFF9800)], // yellow to orange
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          // White Content Area
          ListTile(
            contentPadding: padding ?? const EdgeInsets.all(16),
            leading: leading,
            title: title,
            subtitle: subtitle,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
