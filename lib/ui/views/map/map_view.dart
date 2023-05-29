import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:maestroni/res/assets/assets.gen.dart';
import 'package:maestroni/res/theme/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/app_back_button.dart';
import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MapViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: viewModel.controller,
            mapIsLoading: Center(
              child: CircularProgressIndicator(
                color: AppColors.red,
              ),
            ),
            trackMyPosition: false,
            staticPoints: List.generate(
                viewModel.rests.length,
                (index) => StaticPositionGeoPoint(
                        viewModel.rests[index].objectId,
                        MarkerIcon(
                          iconWidget: Assets.icons.iconPng.image(height: 128, width: 128),
                        ),
                        [
                          GeoPoint(
                              latitude: viewModel.rests[index].actualAddressLat!,
                              longitude: viewModel.rests[index].actualAddressLon!)
                        ])),
            initZoom: 12,
            minZoomLevel: 8,
            maxZoomLevel: 18,
            stepZoom: 1.0,
          ),
          Positioned(
            left: 16,
            top: MediaQuery.of(context).padding.top + 16,
            child: const ABackButton(),
          ),
        ],
      ),
    );
  }

  @override
  MapViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MapViewModel();
}
