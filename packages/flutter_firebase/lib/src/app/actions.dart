class PushRouteAction {
  final String path;
  PushRouteAction(this.path);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'action': 'PushRouteAction($path)',
      };

  @override
  String toString() => 'PushRouteAction($path)';
}
