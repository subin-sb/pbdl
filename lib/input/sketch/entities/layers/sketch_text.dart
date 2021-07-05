import 'package:pbdl/input/sketch/entities/abstract_sketch_node_factory.dart';
import 'package:pbdl/input/sketch/entities/layers/abstract_layer.dart';
import 'package:pbdl/input/sketch/entities/layers/flow.dart';
import 'package:pbdl/input/sketch/entities/objects/frame.dart';
import 'package:pbdl/input/sketch/entities/style/style.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pbdl/pbdl/pbdl_node.dart';

part 'sketch_text.g.dart';

// title: Text Layer
// description: A text layer represents a discrete block or line of text
@JsonSerializable()
class SketchText extends SketchNode implements SketchNodeFactory {
  @override
  String CLASS_NAME = 'text';

  @override
  final bool automaticallyDrawOnUnderlyingPath;
  @override
  final bool dontSynchroniseWithSymbol;
  @override
  final dynamic lineSpacingBehaviour;
  @override
  final dynamic textBehaviour;
  @override
  final dynamic glyphBounds;

  @override
  @JsonKey(name: 'frame')
  var boundaryRectangle;

  @override
  @JsonKey(name: 'do_objectID')
  String UUID;

  @override
  @JsonKey(name: '_class')
  String type;
  bool _isVisible;

  Style _style;

  @override
  void set isVisible(bool _isVisible) => this._isVisible = _isVisible;

  @override
  bool get isVisible => _isVisible;

  @override
  void set style(_style) => this._style = _style;

  @override
  Style get style => _style;

  SketchText(
      {this.UUID,
      booleanOperation,
      exportOptions,
      Frame this.boundaryRectangle,
      Flow flow,
      bool isFixedToViewport,
      bool isFlippedHorizontal,
      bool isFlippedVertical,
      bool isLocked,
      bool isVisible,
      layerListExpandedType,
      String name,
      bool nameIsFixed,
      resizingConstraint,
      resizingType,
      double rotation,
      sharedStyleID,
      bool shouldBreakMaskChain,
      bool hasClippingMask,
      int clippingMaskMode,
      userInfo,
      Style style,
      bool maintainScrollPosition,
      this.attributedString,
      this.automaticallyDrawOnUnderlyingPath,
      this.dontSynchroniseWithSymbol,
      this.lineSpacingBehaviour,
      this.textBehaviour,
      this.glyphBounds})
      : _isVisible = isVisible,
        _style = style,
        super(
            UUID,
            booleanOperation,
            exportOptions,
            boundaryRectangle,
            flow,
            isFixedToViewport,
            isFlippedHorizontal,
            isFlippedVertical,
            isLocked,
            isVisible,
            layerListExpandedType,
            name,
            nameIsFixed,
            resizingConstraint,
            resizingType,
            rotation,
            sharedStyleID,
            shouldBreakMaskChain,
            hasClippingMask,
            clippingMaskMode,
            userInfo,
            style,
            maintainScrollPosition) {
    content = attributedString == null ? '' : attributedString['string'];
  }

  @override
  SketchNode createSketchNode(Map<String, dynamic> json) =>
      SketchText.fromJson(json);
  factory SketchText.fromJson(Map<String, dynamic> json) =>
      _$SketchTextFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$SketchTextToJson(this);

  @override
  Future<PBDLNode> interpretNode() {
    // Future.value(InjectedContainer(
    //   Point(boundaryRectangle.x + boundaryRectangle.width,
    //       boundaryRectangle.y + boundaryRectangle.height),
    //   Point(boundaryRectangle.x, boundaryRectangle.y),
    //   name,
    //   Uuid().v4(),
    //   currentContext: currentContext,
    // )..addChild(
    //     InheritedText(this, name, currentContext: currentContext),
    //   ));
  }

  @override
  @JsonKey(ignore: true)
  String content;

  @override
  Map<String, dynamic> toPBDF() => <String, dynamic>{
        'booleanOperation': booleanOperation,
        'exportOptions': exportOptions,
        'flow': flow,
        'isFixedToViewport': isFixedToViewport,
        'isFlippedHorizontal': isFlippedHorizontal,
        'isFlippedVertical': isFlippedVertical,
        'isLocked': isLocked,
        'layerListExpandedType': layerListExpandedType,
        'name': name,
        'nameIsFixed': nameIsFixed,
        'resizingConstraint': resizingConstraint,
        'resizingType': resizingType,
        'rotation': rotation,
        'sharedStyleID': sharedStyleID,
        'shouldBreakMaskChain': shouldBreakMaskChain,
        'hasClippingMask': hasClippingMask,
        'clippingMaskMode': clippingMaskMode,
        'userInfo': userInfo,
        'maintainScrollPosition': maintainScrollPosition,
        'prototypeNodeUUID': prototypeNodeUUID,
        'CLASS_NAME': CLASS_NAME,
        'attributedString': attributedString,
        'automaticallyDrawOnUnderlyingPath': automaticallyDrawOnUnderlyingPath,
        'dontSynchroniseWithSymbol': dontSynchroniseWithSymbol,
        'lineSpacingBehaviour': lineSpacingBehaviour,
        'textBehaviour': textBehaviour,
        'glyphBounds': glyphBounds,
        'absoluteBoundingBox': boundaryRectangle,
        'id': UUID,
        'type': type,
        'visible': isVisible,
        'style': style,
        'pbdfType': pbdfType,
      };

  @override
  @JsonKey(ignore: true)
  String pbdfType = 'text';

  @override
  var attributedString;

  @override
  void set automaticallyDrawOnUnderlyingPath(
      _automaticallyDrawOnUnderlyingPath) {
    // TODO: implement automaticallyDrawOnUnderlyingPath
  }

  @override
  void set dontSynchroniseWithSymbol(_dontSynchroniseWithSymbol) {
    // TODO: implement dontSynchroniseWithSymbol
  }

  @override
  void set glyphBounds(_glyphBounds) {
    // TODO: implement glyphBounds
  }

  @override
  void set lineSpacingBehaviour(_lineSpacingBehaviour) {
    // TODO: implement lineSpacingBehaviour
  }

  @override
  void set textBehaviour(_textBehaviour) {
    // TODO: implement textBehaviour
  }
}
