import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  moviesEvent();
}


class LoadMoviesEvent extends MoviesEvent {
  @override
  List<Object?> get props => [];
  
  @override
  moviesEvent() {
    throw UnimplementedError();
  }
}
