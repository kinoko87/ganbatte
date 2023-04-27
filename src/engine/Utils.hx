package engine;

class Utils {
    public static function parseString(s:String):Dynamic {
        var intEreg:EReg= ~/^-?\d+$/;
        var floatEreg:EReg = ~/^-?[0-9]\d*(\.\d+)?$/;

        if (s == "true" || s == "false")
            return s == "true";
        else if (intEreg.match(s)) {
            return Std.parseInt(s);
        } else if (floatEreg.match(s)) {
            return Std.parseFloat(s);
        } else {
            return s;
        }
    }
}