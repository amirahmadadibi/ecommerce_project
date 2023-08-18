part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentLoading extends CommentState {}

class CommentResponse extends CommentState {
  Either<String, List<Comment>> response;
  CommentResponse(this.response);
}

class CommentPostLoading extends CommentState {
  final bool isLoading;

  CommentPostLoading(this.isLoading);
}


class CommentPostResponse extends CommentState {
  final Either<String,String> response;

  CommentPostResponse(this.response);
}
