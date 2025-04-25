import 'package:cached_network_image/cached_network_image.dart';
import 'package:list_data_riverpod/modules/properties/presentation/provider/properties_controller.dart';
import 'package:list_data_riverpod/modules/properties/presentation/wigets/empty_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_data_riverpod/modules/properties/presentation/wigets/error_state_widget.dart';
import 'package:list_data_riverpod/utils/currency_extension.dart';

class ListPropertiesPage extends ConsumerStatefulWidget {
  const ListPropertiesPage({super.key});

  @override
  ConsumerState<ListPropertiesPage> createState() => _ListPropertiesPageState();
}

class _ListPropertiesPageState extends ConsumerState<ListPropertiesPage> {
  @override
  Widget build(BuildContext context) {
    final propertiesProvider = ref.watch(propertiesControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Propriedades')),
      body: propertiesProvider.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (properties) {
          if (properties.isEmpty) {
            return const EmptyStateWidget();
          }
          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:
                    properties[index].picture != null
                        ? CachedNetworkImage(
                          imageUrl: properties[index].picture!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                        : Icon(Icons.image, size: 50),
                title: Text(properties[index].address),
                subtitle: Text(
                  properties[index].price.toCurrency(
                    locale: 'pt_BR',
                    symbol: 'R\$',
                  ),
                ),
              );
            },
          );
        },
        error:
            (error, stackTrace) => ErrorStateWidget(
              errorMessage: error.toString(),
              onRetry:
                  () =>
                      ref.read(propertiesControllerProvider.notifier).refresh(),
            ),
      ),
    );
  }
}
