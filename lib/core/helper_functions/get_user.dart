import 'dart:convert';

import 'package:fruits_app/core/services/shared_preference_singleton.dart';
import 'package:fruits_app/features/Auth/data/models/user_model.dart';
import 'package:fruits_app/features/Auth/domain/entities/user_entity.dart';

import '../constant.dart';
 
 
 UserEntity getUser() {
   var jsonString = Prefs.getString(kUserData);
   var userEntity = UserModel.fromJson(jsonDecode(jsonString));
   return userEntity;
 }