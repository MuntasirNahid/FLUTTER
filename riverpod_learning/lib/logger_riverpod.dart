import 'package:flutter_riverpod/flutter_riverpod.dart';

//this helps to keep track of what provider is doing what and vice versa

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    // TODO: implement didUpdateProvider
    super.didUpdateProvider(
      provider, //what kind of provider
      previousValue, //prev value of our provider
      newValue, //new val of the provider
      container, //what is under the providerScope
    );
    print('$provider, $previousValue, $newValue, $container');
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    // TODO: implement didAddProvider
    super.didAddProvider(
      provider,
      value,
      container,
    );
  }

}
