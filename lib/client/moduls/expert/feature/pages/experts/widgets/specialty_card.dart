import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oria_pro/client/moduls/expert/feature/entity/specialty.dart';

import '../../../bloc/expert_bloc.dart';
import '../pages/find_specialist_page.dart';

class SpecialtyCard extends StatelessWidget {
  const SpecialtyCard({
    super.key,
    required this.specialty,
    required this.blocContext,
  });

  final Specialty specialty;
  final BuildContext blocContext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ExpertBloc>(blocContext)
            .add(FetchSpecialtyExperts(specialty: specialty, page: 1));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BlocProvider.value(
                  value: BlocProvider.of<ExpertBloc>(
                    blocContext,
                  ),
                  child: FindSpecialistPage(
                    specialty: specialty,
                  ));
            },
          ),
        );
      },
      child: Container(
        width: 115,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: specialty.color.withOpacity(0.1),
          border: Border.all(color: specialty.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            SvgPicture.network(
              specialty.icon,
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(specialty.color, BlendMode.srcIn),
              height: 40,
            ),
            const SizedBox(height: 24),
            Text(
              specialty.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: specialty.color,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
