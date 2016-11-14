/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package ch.hegarc.ig.TP2016.presentation.events
{
	import starling.events.Event;
	
	/**
	 * This class defines custom events for navigation in the game. 
	 * @author hsharma
	 * 
	 */
	public class NavigationEvent extends Event {

		/** Change of a screen. */		
		public static const CONNECTION:String = "connection";
		public static const DECONNECTION:String = "deconnection";
		public static const CHANGE_SCREEN:String = "changeScreen";
		/** Custom object to pass parameters to the screens. */
        private var _params:Object;
		
		public function NavigationEvent(type:String, params:Object, bubbles:Boolean=false)
		{
			super(type, bubbles);
			this._params = params;
		}

        public function get params():Object {
            return _params;
        }
    }
}