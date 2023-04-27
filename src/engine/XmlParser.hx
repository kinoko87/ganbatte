package engine;

import haxe.xml.Access;

typedef XmlDataNode = {name:String, attributes:Map<String, Dynamic>, innerData:Dynamic, instance:Xml};

class XmlParser {
    public static function parse(content:String) {
        var xml = Xml.parse(content);
        var firstElement = xml.firstElement();

        var xmlDataNodes:Array<XmlDataNode> = [];

        for (e in xml.firstElement().elements()) {

            var access = new Access(e);
            var it = e.attributes();
            var attributes:Map<String, String> = [];

            while (it.hasNext()) {
                var attr = it.next();
                var val:Dynamic = Utils.parseString(access.att.resolve(attr));

                attributes.set(attr, val);
            }

            var xdn:XmlDataNode = {
                name: e.nodeName,
                attributes: attributes,
                innerData: Utils.parseString(access.innerData),
                instance: e
            };

            xmlDataNodes.push(xdn);
        }

        return xmlDataNodes;
    }
}