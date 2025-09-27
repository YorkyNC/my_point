import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_point/src/core/extensions/build_context_extension.dart';
import 'package:my_point/src/features/create_delivery/presentation/bloc/create_delivery_bloc.dart';

class AirportSelectionSheet extends StatelessWidget {
  final bool isFromAirport;

  const AirportSelectionSheet({super.key, required this.isFromAirport});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateDeliveryBloc, CreateDeliveryState>(
      builder: (context, state) {
        final isLoading = state.isLoadingAirports;
        final airports = state.airports;

        if (airports.isEmpty && !isLoading) {
          context.read<CreateDeliveryBloc>().add(CreateDeliveryLoadAirports());
        }

        if (isLoading) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.all(16),
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: airports.length,
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final airport = airports[index];
                  return ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    tileColor: context.colors.gray100,
                    leading: Icon(Icons.location_on_outlined, color: context.colors.black),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    title: Text(
                      airport.name,
                      style: context.typography.interText16.copyWith(
                        color: context.colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // subtitle: Text(
                    //   '${airport.city}, ${airport.country} (${airport.code})',
                    //   style: context.typography.interText14.copyWith(color: context.colors.textGray),
                    // ),
                    onTap: () {
                      context.pop();
                      if (isFromAirport) {
                        context.read<CreateDeliveryBloc>().add(CreateDeliveryFromAirportSelected(airport));
                      } else {
                        context.read<CreateDeliveryBloc>().add(CreateDeliveryToAirportSelected(airport));
                      }
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
