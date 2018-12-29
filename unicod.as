package
{
	import appManager.displayContentElemets.TitleText;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class unicod extends Sprite
	{
		private var matnMC:Object ;
		private var matn2MC:TextField ;
		
		private var matnWidth0:Number,matnX0:Number ;
		
		private var alignMC:MovieClip ;
		
		private var newSliderMC:MovieClip ;
		
		private var uni:Unicode;
		
		private var fontSizeTF:TitleText,
					fontSizeMC:MovieClip;
					
		private var fontSizeMinY:Number,
					fontSizeMaxY:Number;

		public function unicod()
		{
			super();
			
			uni = new Unicode();
			
			matnMC = Obj.get("matn",this);
			matn2MC = Obj.get("matn2",this);
			matn2MC.border = false ;
			
			fontSizeMC = Obj.get("font_size_mc",this);
			fontSizeTF = Obj.get("font_size_tf",fontSizeMC);
			
			matnWidth0 = matn2MC.width ;
			matnX0 = matn2MC.x ;
			
			newSliderMC = Obj.get("new_slider_mc",this);
			newSliderMC.buttonMode = true ;
			
			alignMC = Obj.get("alin",this);
			
			matnMC.text = '';
			matnMC.addEventListener(Event.CHANGE,chang)
			
			
			newSliderMC.addEventListener(MouseEvent.MOUSE_DOWN,startDragSlider);
			
			matn2MC.x = newSliderMC.x ;
			matn2MC.width = matnWidth0-(newSliderMC.x-matnX0);
		}
		
		private function chang(e){
			var myText = String(matnMC.text).split(String.fromCharCode(13)).join(String.fromCharCode(10)).split(String.fromCharCode(10));
			var myText2=''
			for(var i=myText.length-1;i>=0;i--){
				myText2 += myText[i]+'\n';
			}
			myText2 = myText2.substring(0,myText2.length-1)
			matn2MC.text = uni.toUnicode(myText2)
		}
		
		protected function startDragSlider(event:MouseEvent):void
		{
			stage.addEventListener(Event.ENTER_FRAME,slideTheTextField);
			stage.addEventListener(MouseEvent.MOUSE_UP,stopDragSlider);
		}
		
			protected function stopDragSlider(event:MouseEvent):void
			{
				stage.removeEventListener(Event.ENTER_FRAME,slideTheTextField);
				stage.removeEventListener(MouseEvent.MOUSE_UP,stopDragSlider);
				
				uni.HTMLfastUnicodeOnLines(matn2MC,matnMC.text,true);
			}
		
			protected function slideTheTextField(event:Event):void
			{
				newSliderMC.x += (stage.mouseX-newSliderMC.x)/2;
				matn2MC.x = newSliderMC.x ;
				matn2MC.width = matnWidth0-(newSliderMC.x-matnX0);
			}
	}
}