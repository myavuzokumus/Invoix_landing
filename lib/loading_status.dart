import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invoix_landing/struct/states/loading_state.dart';

class LoadingAnimation extends ConsumerWidget {
  const LoadingAnimation({super.key, this.customHeight, this.message});

  final String? message;
  final double? customHeight;

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    final loadingState = ref.watch(loadingProvider);

    return SizedBox(
      height: customHeight ?? double.infinity,
      width: double.infinity,
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const LinearProgressIndicator(),
                Column(
                  children: [
                    Image.asset(
                      "assets/loading/InvoiceReadLoading.gif",
                      height: MediaQuery.of(context).size.height / 2.75,
                    ),
                    if (message != null) ...[
                      const SizedBox(height: 20),
                      Text(
                        message!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  loadingState.message,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
