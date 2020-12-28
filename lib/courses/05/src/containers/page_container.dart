part of containers;

class PageContainer extends StatelessWidget {
  const PageContainer({
    Key key,
    @required this.builder,
  }) : super(key: key);

  final ViewModelBuilder<int> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
      converter: (Store<AppState> store) => store.state.nextPage,
      builder: builder,
    );
  }
}
