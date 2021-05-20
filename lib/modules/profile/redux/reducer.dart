import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sushi_food_app/modules/profile/helper/check_data.dart';
import 'package:sushi_food_app/modules/profile/helper/save_data.dart';
import 'package:sushi_food_app/modules/profile/models/user_info.dart';
import 'package:sushi_food_app/modules/profile/redux/action.dart';
import 'package:sushi_food_app/redux/IStore.dart';

final Reducer<UserInfo> userInfoReducer =
    combineReducers(<UserInfo Function(UserInfo, dynamic)>[
  TypedReducer<UserInfo, SetImage>(onSetImage),
  TypedReducer<UserInfo, SetEmail>(onSetEmail),
  TypedReducer<UserInfo, SetPassword>(onSetPassword),
  TypedReducer<UserInfo, SetFullName>(onSetFullName),
  TypedReducer<UserInfo, SetPhone>(onSetPhone),
  TypedReducer<UserInfo, SetJob>(onSetJob),
  TypedReducer<UserInfo, SetLocation>(onSetLocation),
  TypedReducer<UserInfo, SaveInfo>(onSaveInfo)
]);

UserInfo onSetEmail(UserInfo state, SetEmail action) {
  state = state.copyWith(fullName: action.email);
  return state;
}

UserInfo onSetPassword(UserInfo state, SetPassword action) {
  state = state.copyWith(fullName: action.password);
  return state;
}

UserInfo onSetFullName(UserInfo state, SetFullName action) {
  state = state.copyWith(fullName: action.fullName);
  return state;
}

UserInfo onSetImage(UserInfo state, SetImage action) {
  state = state.copyWith(image: action.image);
  return state;
}

UserInfo onSetPhone(UserInfo state, SetPhone action) {
  state = state.copyWith(phone: action.phone);
  return state;
}

UserInfo onSetLocation(UserInfo state, SetLocation action) {
  state = state.copyWith(location: action.location);
  return state;
}

UserInfo onSetJob(UserInfo state, SetJob action) {
  state = state.copyWith(job: action.job);
  return state;
}

UserInfo onSaveInfo(UserInfo state, SaveInfo action) {
  state = state.copyWith(
    fullName: action.fullName,
    image: action.image,
    email: action.email,
    phone: action.phone,
    password: action.password,
    location: action.location,
    job: action.job,
  );
  return state;
}

ThunkAction<AppState> setUserInfoActions({
  String fullName,
  String image,
  String phone,
  String email,
  String password,
  String location,
  String job,
}) {
  return (Store<AppState> store) async {
    await store.dispatch(SaveInfo(
      fullName: getString(fullName),
      image: getString(image),
      phone: getString(phone),
      location: getString(location),
      job: getString(job),
      email: getString(email),
      password: getString(password),
    ));
    await saveData(
      fullName: fullName,
      image: image,
      email: email,
      password: password,
      phone: phone,
      location: location,
      job: job,
    );
  };
}
