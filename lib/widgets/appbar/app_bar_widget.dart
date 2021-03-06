part of "../widgets.dart";

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double _prefferedHeight = 70;

  final String? title;
  final String? iconPath;
  final Function()? onPressed;
  final Color color;

  AppBarWidget({this.title, this.iconPath, this.onPressed, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: _prefferedHeight + statusBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: 12),
          IconButton(
            icon: Container(
              width: 32,
              height: 32,
              child: Image.asset(
                iconPath!,
                color: color,
              ),
            ),
            onPressed: onPressed,
          ),
          SizedBox(width: 12),
          Text(
            title ?? "",
            style: primaryTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}
