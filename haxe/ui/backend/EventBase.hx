package haxe.ui.backend;

import nme.events.Event;
import haxe.ui.core.UIEvent;

@:allow(haxe.ui.backend.ScreenBase)
@:allow(haxe.ui.backend.ComponentBase)
class EventBase {
    private var _originalEvent:Event;
    
    public function new() {
    }
    
    public function cancel() {
         if (_originalEvent != null) {
            #if flash
            _originalEvent.preventDefault();
            #end
            _originalEvent.stopImmediatePropagation();
            _originalEvent.stopPropagation();
        }
   }
    
    private function postClone(event:UIEvent) {
        event._originalEvent = this._originalEvent;
    }
}