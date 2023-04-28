package engine;

import feathers.controls.Application;

class Utils {
    public static function parseString(s:String):Dynamic {
        var intEreg:EReg= ~/^-?\d+$/;
        var hexEreg:EReg = ~/0x[0-9a-f]+/i;
        var floatEreg:EReg = ~/^-?[0-9]\d*(\.\d+)?$/;

        if (s == "true" || s == "false")
            return s == "true";
        else if (intEreg.match(s) || hexEreg.match(s)) {
            return Std.parseInt(s);
        } else if (floatEreg.match(s)) {
            return Std.parseFloat(s);
        } else {
            return s;
        }
    }

    public static function changeTitle(nt:String) {
        Application.topLevelApplication.stage.window.title = nt;
    }
}