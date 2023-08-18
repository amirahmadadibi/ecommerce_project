part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class CommentInitilzeEvent extends CommentEvent {
  final String productID;
  CommentInitilzeEvent(this.productID);
}

class CommentPostEvent extends CommentEvent {
  final String productId;
  final String comment;
  CommentPostEvent(this.productId, this.comment);
}
