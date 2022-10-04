import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mac_address/mac_address.dart';

import '../../../model/users_model/users_model.dart';
import '../../../utilites/app_constants.dart';
import '../../../view/widgets/utils_widgets/alert_dialog.dart';
import '../../api_helper/local/shared_preferences.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitializedStates());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  static String? getLoggedInUser() {
    String cachedUid = CacheHelper.getData(key: uidKey);
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      uId = currentUser.uid;
    } else {
      cachedUid != null ? uId = cachedUid : null;
    }

    return uId;
  }

  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection(usersCollectionKey);
  var usersList = <UserModel>[];

  getUsers() {
    emit(GetUsersLoadingState());
    usersCollection.snapshots().listen((event) {
      usersList.clear();
      if (event.docs.isNotEmpty) {
        for (int i = 0; i < event.docs.length; i++) {
          usersList.add(UserModel.fromJson(event.docs[i]));
        }
        emit(GetUsersSuccessState());
      } else {
        emit(GetUsersErrorState());
      }
    });
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(LoadingRegisterState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      CacheHelper.saveData(key: uidKey, value: value.user!.uid);

      createUser(
        name: name,
        email: email,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRegisterState());
    });
  }

  void createUser({
    required String name,
    required String email,
    required String uId,
  }) async {
    var ip = await GetMac.macAddress;

    UserModel model = UserModel(
      ip: ip,
      name: name,
      email: email,
      uId: uId,
      phone: "0000000000",
      image:
          'https://media.istockphoto.com/photos/blue-open-sea-environmenttravel-and-nature-concept-picture-id1147989465?k=20&m=1147989465&s=612x612&w=0&h=nVI1UKhyr2WPZ5-gnFB3Q7jjToru4lg_ubBFx-Jomq0=',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SuccessCreateState(uId));
    }).catchError((error) {
      print(error.toString() + '**************');
      print(
          "RegisterScreen().confirmPasswordController.text.toString()*************************************");
      emit(ErrorCreateState());
    });
  }

    void userLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoadingState());
    await getUsers();
   await FirebaseFirestore.instance
        .collection("loginCheck")
        .doc("123")
        .get()
        .then((value) async {
      if (value.exists) {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          CacheHelper.saveData(key: uidKey, value: value.user!.uid);
          emit(LoginSuccessState());
        }).catchError((error) {
          emit(LoginErrorState(error.toString()+">>>>>>>>>>>"));
        });
      } else {
        var myIp = await GetMac.macAddress;
        if (usersList.any((element) {
              return element.ip == myIp &&element.email == email;
            })
            // &&
            // usersList.any((element) {
            //   return element.email == email;
            // })
        ) {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password)
              .then((value) {
            CacheHelper.saveData(key: uidKey, value: value.user!.uid);
            emit(LoginSuccessState());
          }).catchError((error) {
            emit(LoginErrorState(error.toString()));
          });
        } else {
          emit(LoginErrorState(
              "conflict email found, try to login with your mobile"));
      }
     }
    }
    );
  }
}
