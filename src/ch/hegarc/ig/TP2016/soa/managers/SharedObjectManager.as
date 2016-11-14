/**
 *
 * MTIS Mobile
 * http://mtis.ig.he-arc.ch
 * version 1.0
 * 
 * Copyright (c) 2014 MTIS. All rights reserved.
 *  
 */
package ch.hegarc.ig.TP2016.soa.managers
{
	import flash.net.SharedObject;

	/**
	 * Classe permettant de sauvegarder temporairement des informations en local
	 * Cette classe est singleton
	 * @author Jonathan Tarabbia
	 * 
	 */
	public class SharedObjectManager
	{
		public static const SHARED_SESSION:String = "session";

		/** Constantes liées à l'utilisateur */
		public static const KEY_CURRENT_USER:String ="current_user";
		public static const KEY_CURRENT_USER_TOKEN:String ="current_user_token";
		public static const KEY_CURRENT_USER_EMAIL:String ="current_user_email";
		public static const KEY_CURRENT_USER_ID:String ="current_user_id";

		/** Préférence, se souvenir de moi */
		public static const KEY_REMEMBER_USER:String ="remember_user";

		public static const KEY_DEBUG_ENABLED:String = "debugEnabled";
		
		private static var instanceSession:SharedObjectManager = null;
		
		private var sharedObjectSession:SharedObject;
		
		public function SharedObjectManager(name:String){
			if(instanceSession != null){
				throw new Error("Error, SharedObjectManager is a singleton. Please use the method getInstance instead");
			}
			this.sharedObjectSession = SharedObject.getLocal(name);
			
		}
		
		public static function getInstance(name:String = SHARED_SESSION):SharedObjectManager{
			if(instanceSession == null){
				instanceSession = new SharedObjectManager(name);
			}
			
			return instanceSession;
		}
		
		public static function getData(key:String):Object{
			return getInstance().getData(key);
		}
		
		public static function setData(key:String, val:*):void{
			getInstance().setData(key, val);
		}
		
		public static function save():void{
			getInstance().save();
		}
		
		/**
		 * récupère l'object de la valeur de la clé spécifiée. cela peut être un entier, une chaîne de caractères, etc.
		 * @param key 		: la clé de la pair clé/valeur
		 * @returns  		: retourne l'oject de la clé spécifiée
		 * 
		 */
		public function getData(key:String):Object {
			var _data:Object = sharedObjectSession.data[key];
			return _data
		}
		
		/**
		 * écrit l'object pour la valeur et la clé spécifiée. cela peut être un entier, une chaîne de caractères, etc.
		 * @param key 		: la clé de la pair clé/valeur
		 * @param val 		: la valeur de la pair clé/valeur
		 * 
		 */
		public function setData(key:String,val:*):void {
			this.sharedObjectSession.data[key] = val
		}
		
		/**
		 * Persiste l'état de l'objet partagé
		 * 
		 */
		public function save():void {
			this.sharedObjectSession.flush()
		}
		
		/**
		 * supprime l'objet partagé du disque
		 * 
		 */
		public function clear():void {
			this.sharedObjectSession.clear()
		}
	}
}