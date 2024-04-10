import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class GeoMap extends StatefulWidget {
  final LatLng initialLatLng;

  const GeoMap({
    super.key,
    required this.initialLatLng,
  });

  @override
  State<GeoMap> createState() => _GeoMapState();
}

class _GeoMapState extends State<GeoMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      // key: mapKey,
      options: MapOptions(
        initialCenter: widget.initialLatLng,
        initialZoom: 0.5,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.planetprotector.planet_protector',
        ),
      ],
    );
  }
}
