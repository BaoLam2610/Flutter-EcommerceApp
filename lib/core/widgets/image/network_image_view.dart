import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  final double? _width;
  final double? _height;
  final String _imageUrl;
  final Widget? _imageBuilder;
  final Widget? _loadingBuilder;
  final Widget? _errorBuilder;
  final BorderRadius? _imageBorderRadius;
  final BoxFit? _fit;
  final BoxShape? _shape;
  final Color? _colorBgr;
  final EdgeInsetsGeometry? _margin;

  factory NetworkImageView.circle({
    Key? key,
    required String imageUrl,
    double? width,
    double? height,
    Widget? imageBuilder,
    Widget? loadingBuilder,
    Widget? errorBuilder,
    BoxFit? fit,
    Color? colorBgr,
    EdgeInsetsGeometry? margin,
  }) {
    return NetworkImageView(
      key: key,
      imageUrl: imageUrl,
      width: width,
      height: height,
      imageBuilder: imageBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      fit: fit,
      margin: margin,
      colorBgr: colorBgr,
      shape: BoxShape.circle,
    );
  }

  const NetworkImageView({
    super.key,
    required String imageUrl,
    double? width,
    double? height,
    Widget? imageBuilder,
    Widget? loadingBuilder,
    Widget? errorBuilder,
    BorderRadius? imageBorderRadius,
    BoxFit? fit,
    EdgeInsetsGeometry? margin,
    BoxShape? shape,
    Color? colorBgr,
  })  : _colorBgr = colorBgr,
        _shape = shape,
        _margin = margin,
        _fit = fit,
        _imageBorderRadius = imageBorderRadius,
        _errorBuilder = errorBuilder,
        _loadingBuilder = loadingBuilder,
        _imageBuilder = imageBuilder,
        _height = height,
        _width = width,
        _imageUrl = imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: _width,
      height: _height,
      imageUrl: _imageUrl,
      imageBuilder: (context, imageProvider) =>
          _buildImageWidget(imageProvider),
      progressIndicatorBuilder: (context, url, progress) => _buildLoadingWidget,
      errorWidget: (context, url, error) => _buildErrorWidget,
    );
  }

  Widget _buildImageWidget(ImageProvider<Object> imageProvider) =>
      _imageBuilder ??
      Container(
        margin: _margin,
        decoration: BoxDecoration(
          color: _colorBgr,
          image: DecorationImage(
            image: imageProvider,
            fit: _fit ?? BoxFit.fill,
          ),
          borderRadius: _imageBorderRadius,
          shape: _shape ?? BoxShape.rectangle,
        ),
      );

  Widget get _buildLoadingWidget =>
      _loadingBuilder ??
      _layoutImage(
        child: const Center(child: CircularProgressIndicator()),
      );

  Widget get _buildErrorWidget =>
      _errorBuilder ??
      _layoutImage(
        child: const Icon(Icons.error),
      );

  _layoutImage({
    Widget? child,
    DecorationImage? decorationImage,
  }) {
    return Container(
      margin: _margin,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.08),
        image: decorationImage,
        borderRadius: _imageBorderRadius,
        shape: _shape ?? BoxShape.rectangle,
      ),
      child: child,
    );
  }
}
