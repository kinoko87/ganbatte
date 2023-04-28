package engine.gl;

import haxe.Json;
import haxe.zip.Reader;
import haxe.io.BytesInput;
import sys.io.File;
import sys.FileSystem;

class GLArchive {
    public static function cacheEntries(path:String) {
        if (!FileSystem.exists(path)) {
            trace("[GLArchive] Could not find " + path);
            return;
        }

        var entries = new Reader(new BytesInput(File.getBytes(path))).read().iterator();

        
        var pathsplit = path.split('/');

        var cacheFileName:String = pathsplit[pathsplit.length-1];

        for (e in entries) {
            if (e.fileName == "lesson.json") {
                var json:Dynamic = Json.parse(e.data.toString());
                cacheFileName = json.lessonName;
            }
        }

        FileSystem.createDirectory("cache/"+cacheFileName);

        for (e in entries) {
            var p = "cache/"+cacheFileName+"/";
            File.saveContent(p+e.fileName, e.data.toString());
        }
    }
}

class GLFolder {
    public static function cacheEntries(path:String) {
        if (!FileSystem.exists(path) || !FileSystem.isDirectory(path)) {
            trace ("[GLFolder] Could not open " + path + " (path is invalid or path does not lead to a directory)");
            return;
        }

        var entries = [for (f in FileSystem.readDirectory(path)) f];

        var pathsplit = path.split('/');

        var cacheFileName = pathsplit[path.length-1];

        if (entries.contains("lesson.json")) {
            var json = Json.parse(File.getContent(path+"lesson.json"));
            cacheFileName = json.lessonName;
        }

        for (e in entries) {
            var p = "cache"+cacheFileName+"/";
            File.saveContent(p+e, File.getContent(p+e));
        }
    }
}

class GFiles {
    public static inline function getLessonFile(dir:String):GLesson
       return FileSystem.exists('cache'+dir+'/lesson.json') ? cast (Json.parse(File.getContent('cache/'+dir+'/lesson.json'))) : null;
}