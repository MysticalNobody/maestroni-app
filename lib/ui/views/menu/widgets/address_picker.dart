// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';

// import '../../../../data/models/delivery_address_model.dart';
// import '../../../../res/theme/app_colors.dart';
// import '../../../../res/theme/app_typography.dart';

// class AddressesPicker extends StatelessWidget {
//   const AddressesPicker(
//       {required this.changeCurrentAddress,
//       this.addresses,
//       this.currentAddress,
//       Key? key})
//       : super(key: key);
//   final List<AddressModel>? addresses;
//   final AddressModel? currentAddress;
//   final Function(AddressModel) changeCurrentAddress;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: DropdownButton2(
//         onChanged: (_) {},
//         buttonStyleData: ButtonStyleData(
//           decoration: BoxDecoration(color: AppColors.white),
//         ),
//         iconStyleData: IconStyleData(iconEnabledColor: AppColors.black),
//         dropdownStyleData: DropdownStyleData(
//             decoration: BoxDecoration(
//               color: AppColors.lightGrey,
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(4),
//                 topRight: Radius.circular(18),
//                 bottomLeft: Radius.circular(18),
//                 bottomRight: Radius.circular(18),
//               ),
//             ),
//             elevation: 0),
//         isExpanded: true,
//         value: currentAddress?.street,
//         hint: Row(
//           children: [
//             Expanded(
//               child: AutoSizeText(
//                 'Выберите адрес',
//                 style: AppTypography.med16.copyWith(color: AppColors.black),
//                 maxLines: 2,
//               ),
//             ),
//           ],
//         ),
//         items: List.generate(
//           addresses?.length ?? 0,
//           (index) => DropdownMenuItem(
//             onTap: () => changeCurrentAddress(addresses![index]),
//             value: addresses![index].street,
//             child: Text(
//               addresses![index].street,
//               style: addresses![index] == currentAddress
//                   ? AppTypography.med16
//                   : AppTypography.med16Grey,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
