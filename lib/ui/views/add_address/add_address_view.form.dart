// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String StreetValueKey = 'street';
const String HouseValueKey = 'house';
const String FlatValueKey = 'flat';
const String EntranceValueKey = 'entrance';
const String FloorValueKey = 'floor';
const String CommentValueKey = 'comment';

final Map<String, TextEditingController> _AddAddressViewTextEditingControllers =
    {};

final Map<String, FocusNode> _AddAddressViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddAddressViewTextValidations = {
  StreetValueKey: null,
  HouseValueKey: null,
  FlatValueKey: null,
  EntranceValueKey: null,
  FloorValueKey: null,
  CommentValueKey: null,
};

mixin $AddAddressView on StatelessWidget {
  TextEditingController get streetController =>
      _getFormTextEditingController(StreetValueKey);
  TextEditingController get houseController =>
      _getFormTextEditingController(HouseValueKey);
  TextEditingController get flatController =>
      _getFormTextEditingController(FlatValueKey);
  TextEditingController get entranceController =>
      _getFormTextEditingController(EntranceValueKey);
  TextEditingController get floorController =>
      _getFormTextEditingController(FloorValueKey);
  TextEditingController get commentController =>
      _getFormTextEditingController(CommentValueKey);
  FocusNode get streetFocusNode => _getFormFocusNode(StreetValueKey);
  FocusNode get houseFocusNode => _getFormFocusNode(HouseValueKey);
  FocusNode get flatFocusNode => _getFormFocusNode(FlatValueKey);
  FocusNode get entranceFocusNode => _getFormFocusNode(EntranceValueKey);
  FocusNode get floorFocusNode => _getFormFocusNode(FloorValueKey);
  FocusNode get commentFocusNode => _getFormFocusNode(CommentValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_AddAddressViewTextEditingControllers.containsKey(key)) {
      return _AddAddressViewTextEditingControllers[key]!;
    }
    _AddAddressViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddAddressViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddAddressViewFocusNodes.containsKey(key)) {
      return _AddAddressViewFocusNodes[key]!;
    }
    _AddAddressViewFocusNodes[key] = FocusNode();
    return _AddAddressViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    streetController.addListener(() => _updateFormData(model));
    houseController.addListener(() => _updateFormData(model));
    flatController.addListener(() => _updateFormData(model));
    entranceController.addListener(() => _updateFormData(model));
    floorController.addListener(() => _updateFormData(model));
    commentController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    streetController.addListener(() => _updateFormData(model));
    houseController.addListener(() => _updateFormData(model));
    flatController.addListener(() => _updateFormData(model));
    entranceController.addListener(() => _updateFormData(model));
    floorController.addListener(() => _updateFormData(model));
    commentController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          StreetValueKey: streetController.text,
          HouseValueKey: houseController.text,
          FlatValueKey: flatController.text,
          EntranceValueKey: entranceController.text,
          FloorValueKey: floorController.text,
          CommentValueKey: commentController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        StreetValueKey: _getValidationMessage(StreetValueKey),
        HouseValueKey: _getValidationMessage(HouseValueKey),
        FlatValueKey: _getValidationMessage(FlatValueKey),
        EntranceValueKey: _getValidationMessage(EntranceValueKey),
        FloorValueKey: _getValidationMessage(FloorValueKey),
        CommentValueKey: _getValidationMessage(CommentValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _AddAddressViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_AddAddressViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddAddressViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddAddressViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddAddressViewTextEditingControllers.clear();
    _AddAddressViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get streetValue => this.formValueMap[StreetValueKey] as String?;
  String? get houseValue => this.formValueMap[HouseValueKey] as String?;
  String? get flatValue => this.formValueMap[FlatValueKey] as String?;
  String? get entranceValue => this.formValueMap[EntranceValueKey] as String?;
  String? get floorValue => this.formValueMap[FloorValueKey] as String?;
  String? get commentValue => this.formValueMap[CommentValueKey] as String?;

  set streetValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          StreetValueKey: value,
        }),
    );

    if (_AddAddressViewTextEditingControllers.containsKey(StreetValueKey)) {
      _AddAddressViewTextEditingControllers[StreetValueKey]?.text = value ?? '';
    }
  }

  set houseValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          HouseValueKey: value,
        }),
    );

    if (_AddAddressViewTextEditingControllers.containsKey(HouseValueKey)) {
      _AddAddressViewTextEditingControllers[HouseValueKey]?.text = value ?? '';
    }
  }

  set flatValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          FlatValueKey: value,
        }),
    );

    if (_AddAddressViewTextEditingControllers.containsKey(FlatValueKey)) {
      _AddAddressViewTextEditingControllers[FlatValueKey]?.text = value ?? '';
    }
  }

  set entranceValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          EntranceValueKey: value,
        }),
    );

    if (_AddAddressViewTextEditingControllers.containsKey(EntranceValueKey)) {
      _AddAddressViewTextEditingControllers[EntranceValueKey]?.text =
          value ?? '';
    }
  }

  set floorValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          FloorValueKey: value,
        }),
    );

    if (_AddAddressViewTextEditingControllers.containsKey(FloorValueKey)) {
      _AddAddressViewTextEditingControllers[FloorValueKey]?.text = value ?? '';
    }
  }

  set commentValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          CommentValueKey: value,
        }),
    );

    if (_AddAddressViewTextEditingControllers.containsKey(CommentValueKey)) {
      _AddAddressViewTextEditingControllers[CommentValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasStreet =>
      this.formValueMap.containsKey(StreetValueKey) &&
      (streetValue?.isNotEmpty ?? false);
  bool get hasHouse =>
      this.formValueMap.containsKey(HouseValueKey) &&
      (houseValue?.isNotEmpty ?? false);
  bool get hasFlat =>
      this.formValueMap.containsKey(FlatValueKey) &&
      (flatValue?.isNotEmpty ?? false);
  bool get hasEntrance =>
      this.formValueMap.containsKey(EntranceValueKey) &&
      (entranceValue?.isNotEmpty ?? false);
  bool get hasFloor =>
      this.formValueMap.containsKey(FloorValueKey) &&
      (floorValue?.isNotEmpty ?? false);
  bool get hasComment =>
      this.formValueMap.containsKey(CommentValueKey) &&
      (commentValue?.isNotEmpty ?? false);

  bool get hasStreetValidationMessage =>
      this.fieldsValidationMessages[StreetValueKey]?.isNotEmpty ?? false;
  bool get hasHouseValidationMessage =>
      this.fieldsValidationMessages[HouseValueKey]?.isNotEmpty ?? false;
  bool get hasFlatValidationMessage =>
      this.fieldsValidationMessages[FlatValueKey]?.isNotEmpty ?? false;
  bool get hasEntranceValidationMessage =>
      this.fieldsValidationMessages[EntranceValueKey]?.isNotEmpty ?? false;
  bool get hasFloorValidationMessage =>
      this.fieldsValidationMessages[FloorValueKey]?.isNotEmpty ?? false;
  bool get hasCommentValidationMessage =>
      this.fieldsValidationMessages[CommentValueKey]?.isNotEmpty ?? false;

  String? get streetValidationMessage =>
      this.fieldsValidationMessages[StreetValueKey];
  String? get houseValidationMessage =>
      this.fieldsValidationMessages[HouseValueKey];
  String? get flatValidationMessage =>
      this.fieldsValidationMessages[FlatValueKey];
  String? get entranceValidationMessage =>
      this.fieldsValidationMessages[EntranceValueKey];
  String? get floorValidationMessage =>
      this.fieldsValidationMessages[FloorValueKey];
  String? get commentValidationMessage =>
      this.fieldsValidationMessages[CommentValueKey];
  void clearForm() {
    streetValue = '';
    houseValue = '';
    flatValue = '';
    entranceValue = '';
    floorValue = '';
    commentValue = '';
  }
}

extension Methods on FormViewModel {
  setStreetValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[StreetValueKey] = validationMessage;
  setHouseValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[HouseValueKey] = validationMessage;
  setFlatValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FlatValueKey] = validationMessage;
  setEntranceValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EntranceValueKey] = validationMessage;
  setFloorValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FloorValueKey] = validationMessage;
  setCommentValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CommentValueKey] = validationMessage;
}
