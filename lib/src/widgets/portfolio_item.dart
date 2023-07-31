import 'package:flutter/material.dart';
import 'package:hrushikesh_portfolio/src/data/project.dart';
import 'package:hrushikesh_portfolio/src/utils/responsive_util.dart';
import 'package:hrushikesh_portfolio/src/widgets/portfolio_item_dialog.dart';
import 'package:hrushikesh_portfolio/theme.dart';

class PortfolioItem extends StatefulWidget {
  const PortfolioItem({super.key, required this.projectData});

  final ProjectData projectData;

  @override
  State<PortfolioItem> createState() => _PortfolioItemState();
}

class _PortfolioItemState extends State<PortfolioItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final isMediumScreenOrSmaller = Responsive.isMediumScreenOrSmaller(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        isMediumScreenOrSmaller
            ? _ItemContent(widget: widget, hovered: hovered)
            : MouseRegion(
                onHover: (event) {
                  setState(() {
                    hovered = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    hovered = false;
                  });
                },
                cursor: SystemMouseCursors.click,
                child: _ItemContent(widget: widget, hovered: hovered),
              ),
        SizedBox(height: Responsive.maxSmallSpacing(context)),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.projectData.name,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 4),
              Text(
                widget.projectData.tags.join(", "),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      height: 1.5,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ItemContent extends StatelessWidget {
  const _ItemContent({
    Key? key,
    required this.widget,
    required this.hovered,
  }) : super(key: key);

  final PortfolioItem widget;
  final bool hovered;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showProjectDialog(context, widget.projectData);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: borderColor(context), width: 1),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
              opacity: hovered ? 0.2 : 1,
              duration: Duration(milliseconds: 200),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  widget.projectData.previewImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: hovered ? 1 : 0,
              duration: Duration(milliseconds: 200),
              child: Icon(
                Icons.remove_red_eye,
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
