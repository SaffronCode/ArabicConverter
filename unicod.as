package
{
	import appManager.displayContentElemets.TitleText;
	
	import dynamicFrame.FrameGenerator;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class unicod extends Sprite
	{
		private var matnMC:Object ;
		private var matn2MC:TextField ;
		
		private var matnWidth0:Number,matnX0:Number ;
		
		private var alignMC:MovieClip ;
		
		private var newSliderMC:MovieClip,
					sliderX0:Number;
		
		private var uni:Unicode;
		
		private var fontSizeTF:TitleText,
					fontSizeMC:MovieClip;
					
		private var fontSizeMinY:Number,
					fontSizeMaxY:Number,
					
					fontMinSize:uint = 5,
					fontMaxSize:uint=50,
					fontMidSize:uint;

		public function unicod()
		{
			super();
			
			uni = new Unicode();
			
			matnMC = Obj.get("matn",this);
			matn2MC = Obj.get("matn2",this);
			matn2MC.border = false ;
			
			FrameGenerator.createFrame(stage,-1,this);
			
			/**Font size ↓*/
				fontMidSize = matn2MC.defaultTextFormat.size as uint ;
				
				fontSizeMC = Obj.get("font_size_mc",this);
				fontSizeTF = Obj.get("font_size_tf",fontSizeMC);
				fontSizeMC.buttonMode = true ;
				fontSizeMinY = fontSizeMC.y ;
				fontSizeMaxY = 388 ;
				
				fontSizeMC.y = fontSizeMaxY-((fontMidSize-fontMinSize)/(fontMaxSize-fontMinSize))*(fontSizeMaxY-fontSizeMinY);
				fontSizeTF.text = fontMidSize.toString();
				
				fontSizeMC.addEventListener(MouseEvent.MOUSE_DOWN,startChangeFontSize);
			/**Font size ↑*/
			
			matnWidth0 = matn2MC.width ;
			matnX0 = matn2MC.x ;
			
			newSliderMC = Obj.get("new_slider_mc",this);
			newSliderMC.buttonMode = true ;
			sliderX0 = newSliderMC.x ;
			
			alignMC = Obj.get("alin",this);
			
			matnMC.text = '';
			matnMC.addEventListener(Event.CHANGE,chang)
			
			
			newSliderMC.addEventListener(MouseEvent.MOUSE_DOWN,startDragSlider);
			
			matn2MC.x = newSliderMC.x ;
			matn2MC.width = matnWidth0-(newSliderMC.x-matnX0);
		}
		
		
		protected function startChangeFontSize(event:MouseEvent):void
		{
			stage.addEventListener(Event.ENTER_FRAME,changeFontSize);
			stage.addEventListener(MouseEvent.MOUSE_UP,stopFontSizeChange);
		}
		
			protected function stopFontSizeChange(event:MouseEvent):void
			{
				stage.removeEventListener(Event.ENTER_FRAME,changeFontSize);
				stage.removeEventListener(MouseEvent.MOUSE_UP,stopFontSizeChange);
				updateFarsiNevisText();
			}
			
			protected function changeFontSize(event:Event):void
			{
				fontSizeMC.y += fontSizeMC.mouseY/4;
				fontSizeMC.y = Math.max(fontSizeMinY,Math.min(fontSizeMC.y,fontSizeMaxY));
				
				fontMidSize = Math.round((1-(fontSizeMC.y-fontSizeMinY)/(fontSizeMaxY-fontSizeMinY))*(fontMaxSize-fontMinSize))+fontMinSize ;
				fontSizeTF.text = fontMidSize.toString();
				
				var textFormat:TextFormat = matn2MC.defaultTextFormat ;
				textFormat.size = fontMidSize ;
				matn2MC.setTextFormat(textFormat);
				matn2MC.defaultTextFormat = textFormat ;
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
				
				updateFarsiNevisText();
			}
			
			protected function slideTheTextField(event:Event):void
			{
				newSliderMC.x += (stage.mouseX-newSliderMC.x)/2;
				newSliderMC.x = Math.max(sliderX0,Math.min(matnWidth0+matnX0-20,newSliderMC.x));
				matn2MC.x = newSliderMC.x ;
				matn2MC.width = matnWidth0-(newSliderMC.x-matnX0);
			}
			
		private function updateFarsiNevisText():void
		{
			var textFormat:TextFormat = matn2MC.defaultTextFormat ;
			textFormat.size = fontMidSize ;
			matn2MC.setTextFormat(textFormat);
			matn2MC.defaultTextFormat = textFormat ;
			try
			{
				uni.HTMLfastUnicodeOnLines(matn2MC,matnMC.text,true);
			}catch(e){};
		}
	}
}