part of 'feed_bloc.dart';

abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object> get props => [];
}

class LoadFeed extends FeedEvent {}

class FeedUpdated extends FeedEvent {
  final List posts;
  const FeedUpdated(this.posts);

  @override
  List<Object> get props => [posts];
}
