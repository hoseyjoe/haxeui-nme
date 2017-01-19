package haxe.ui.backend;

import haxe.ui.util.Rectangle;
import haxe.ui.assets.ImageInfo;
import haxe.ui.core.Component;
import nme.display.Bitmap;
import nme.display.Sprite;

class ImageDisplayBase extends Sprite {
    public var parentComponent:Component;
    public var aspectRatio:Float = 1; // width x height
    private var _bmp:Bitmap;

    public function new() {
        super();
    }

    public var left(get, set):Float;
    private function get_left():Float {
        return this.x;
    }
    private function set_left(value:Float):Float {
        this.x = value;
        return value;
    }

    public var top(get, set):Float;
    private function get_top():Float {
        return this.y;
    }
    private function set_top(value:Float):Float {
        this.y = value;
        return value;
    }

    public var imageWidth(get, set):Float;
    private function set_imageWidth(value:Float):Float {
        _bmp.width = value;
        return value;
    }

    private function get_imageWidth():Float {
        if (_bmp == null) {
            return 0;
        }
        return _bmp.width;
    }

    public var imageHeight(get, set):Float;
    private function set_imageHeight(value:Float):Float {
        _bmp.height = value;
        return value;
    }

    private function get_imageHeight():Float {
        if (_bmp == null) {
            return 0;
        }
        return _bmp.height;
    }

    private var _imageInfo:ImageInfo;
    public var imageInfo(get, set):ImageInfo;
    private function get_imageInfo():ImageInfo {
        return _imageInfo;
    }
    private function set_imageInfo(value:ImageInfo):ImageInfo {
        _imageInfo = value;
        aspectRatio = value.width / value.height;

        if (_bmp != null && contains(_bmp) == true) {
            removeChild(_bmp);
            //_bmp.bitmapData.dispose();
        }

        _bmp = new Bitmap(_imageInfo.data);
        addChild(_bmp);
        return value;
    }

    public var imageClipRect(get, set):Rectangle;
    private var _imageClipRect:Rectangle;
    public function get_imageClipRect():Rectangle {
        return _imageClipRect;
    }
    private function set_imageClipRect(value:Rectangle):Rectangle {
        _imageClipRect = value;

        if (value == null) {
            this.scrollRect = null;
        } else {
            this.scrollRect = new nme.geom.Rectangle(-left, -top, Math.fround(value.width), Math.fround(value.height));
            left = value.left;
            top = value.top;
        }

        return value;
    }

    public function dispose():Void {
        if (_bmp != null) {
            //_bmp.bitmapData.dispose();
        }
    }
}
