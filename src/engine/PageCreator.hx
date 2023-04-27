package engine;

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
            }
        }
    }

}