import 'package:easyflow/layers/data/model/representative_model.dart';
import 'package:easyflow/layers/widgets/circle_account_widget.dart';
import 'package:flutter/material.dart';

class RepresentativeWidget extends StatelessWidget {
  final RepresentativeModel representative;
  final void Function()? onTap;
  final bool? selected;
  const RepresentativeWidget(
      {super.key, required this.representative, this.onTap, this.selected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      selected: selected!,
      selectedTileColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      tileColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      leading: CircleAccountWidget(
        name: representative.name,
        urlPhoto: representative.imageUrl,
      ),
      title: Row(
        children: [
          Text(representative.name),
          const SizedBox(
            width: 16,
          ),
          const Icon(
            Icons.verified_outlined,
            size: 12,
            color: Color(0xFF0085FF),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            representative.area,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF0085FF),
              fontFamily: 'Segoe UI',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Text(representative.email),
    );
  }
}