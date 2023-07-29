part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentLoading extends CommentState {}

class CommentResponse extends CommentState {
  Either<String, List<Comment>> response;
  CommentResponse(this.response);
}
