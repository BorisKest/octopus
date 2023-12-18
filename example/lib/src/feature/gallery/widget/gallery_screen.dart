import 'package:example/src/common/widget/scaffold_padding.dart';
import 'package:flutter/material.dart';

/// {@template gallery_screen}
/// GalleryScreen widget.
/// {@endtemplate}
class GalleryScreen extends StatelessWidget {
  /// {@macro gallery_screen}
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Gallery'),
        ),
        body: SafeArea(
          child: GridView.builder(
            padding: ScaffoldPadding.of(context),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 152,
              //mainAxisExtent: 180,
              childAspectRatio: 152 / 180,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: 1000,
            itemBuilder: (context, index) {
              final id = index;
              return _GalleryTile(id: id, key: ValueKey(id));
            },
          ),
        ),
      );
}

class _GalleryTile extends StatelessWidget {
  const _GalleryTile({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context) => Card(
        color: const Color(0xFFcfd8dc),
        margin: EdgeInsets.zero,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            /* Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const GalleryDetailScreen(),
              ),
            ); */
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8),
                          child: Placeholder(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 36,
                  child: Center(
                    child: Text(
                      'Id#$id',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
