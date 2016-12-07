/**
 * Created by julien.schneide on 07.12.2016.
 */
package ch.hegarc.ig.TP2016.business {
public class Discussion {

    private var _id:int;
    private var _name:String;
    private var _body:String;
    private var _url:String;
    private var _category:String;


    public function Discussion() {

    }

    public function get id():int {
        return _id;
    }

    public function set id(value:int):void {
        _id = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }

    public function get body():String {
        return _body;
    }

    public function set body(value:String):void {
        _body = value;
    }

    public function get url():String {
        return _url;
    }

    public function set url(value:String):void {
        _url = value;
    }

    public function get category():String {
        return _category;
    }

    public function set category(value:String):void {
        _category = value;
    }
}
}
