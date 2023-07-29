part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class CommentInitilzeEvent extends CommentEvent {
  String productID;
  CommentInitilzeEvent(this.productID);
}
