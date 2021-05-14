part of 'feed_bloc.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedLoading extends FeedState {}

class FeedLoaded extends FeedState {
  final List posts;
  const FeedLoaded([this.posts = const []]);

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'PostsLoaded { todos: $posts }';
}

class FeedLoadingFailed extends FeedState {}
