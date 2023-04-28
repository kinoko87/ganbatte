package engine;

import hxColorToolkit.ColorToolkit;
import openfl.geom.ColorTransform;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import feathers.controls.Label;
import feathers.controls.Button;
import engine.XmlParser.XmlDataNode;

class PageCreator {

    public var state:State;

    public function new(state:State) {
        this.state = state;
    }

    public function createComponents(xdns:Array<XmlDataNode>) {
        for (x in xdns) {
            switch (x.name) {
                case 'Button':
                    var b = new Button(x.innerData);
                    b.x = x.attributes["x"];
                    b.y = x.attributes["y"];
                    b.scaleX = x.attributes["scaleX"] ?? 1;
                    b.scaleY = x.attributes["scaleY"] ?? 1;
                    state.add(b);
                case 'Label':
                    var l = new Label(x.innerData);
                    l.x = x.attributes["x"];
                    l.y = x.attributes["y"];
                    l.scaleX = x.attributes["scaleX"] ?? 1;
                    l.scaleY = x.attributes["scaleY"] ?? 1;
                    l.textFormat.font = x.attributes["font"];
                    l.textFormat.color = x.attributes["color"];
                    l.textFormat.bold = x.attributes["bold"];
                    l.textFormat.italic = x.attributes["italic"];    
                    l.textFormat.underline = x.attributes["underline"];
                    state.add(l);
                case 'Image':
                    var bm = new Bitmap(BitmapData.fromFile(x.attributes["path"]));
                    bm.x = x.attributes["x"];
                    bm.y = x.attributes["y"];
                    bm.scaleX = x.attributes["x"];
                    bm.scaleY = x.attributes["y"];

                    var color = ColorToolkit.toRGB(x.attributes["color"]);
                    bm.bitmapData.colorTransform(bm.bitmapData.rect, new ColorTransform(0, 0, 0, 1, ));
                    state.add(bm);
                }
        }
    }

}