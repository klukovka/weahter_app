import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBlocWidget<B extends Bloc<E, S>, S, E>
    extends StatelessWidget {
  const BaseBlocWidget({Key? key}) : super(key: key);

  void sendEvent(BuildContext context, E event) {
    BlocProvider.of<B>(context).add(event);
  }

  Widget observe({
    required BlocWidgetBuilder<S> builder,
    bool Function(S, S)? buildWhen,
  }) {
    return BlocBuilder<B, S>(
      builder: builder,
      buildWhen: buildWhen
    );
  }

  Widget addListener({
    required void Function(BuildContext, S) listener,
    required Widget child,
    bool Function(S, S)? listenWhen,
  }) {
    return BlocListener<B, S>(
      listener: listener,
      listenWhen: listenWhen,
      child: child,
    );
  }

}
