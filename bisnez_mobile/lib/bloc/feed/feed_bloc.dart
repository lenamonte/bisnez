import 'dart:async';

import 'package:basic_login_page/repository/posts_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final PostsRepository _postsRepository;
  StreamSubscription _postsSubscription;

  FeedBloc({@required PostsRepository postsRepository})
      : assert(postsRepository != null),
        _postsRepository = postsRepository,
        super(FeedLoading());

  @override
  Stream<FeedState> mapEventToState(
    FeedEvent event,
  ) async* {
    if (event is LoadFeed) {
      yield* _mapLoadFeedToState();
    } else if (event is FeedUpdated) {
      yield* _mapFeedUpdateToState(event);
    }
  }

  Stream<FeedState> _mapLoadFeedToState() async* {
    _postsSubscription?.cancel();
    _postsSubscription = _postsRepository.posts().listen(
          (posts) => add(FeedUpdated(posts)),
        );
  }

  Stream<FeedState> _mapFeedUpdateToState(FeedUpdated event) async* {
    yield FeedLoaded(event.posts);
  }

  @override
  Future<void> close() {
    _postsSubscription?.cancel();
    return super.close();
  }
}
