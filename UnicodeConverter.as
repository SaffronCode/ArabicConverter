package
{
	import appManager.displayContentElemets.TitleText;
	
	import dynamicFrame.FrameGenerator;
	
	import flash.desktop.Clipboard;
	import flash.desktop.ClipboardFormats;
	import flash.desktop.NativeApplication;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.filesystem.File;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.setTimeout;
	
	import flashx.textLayout.formats.TextAlign;
	
	import popForm.PopField;
	import popForm.PopFieldBoolean;
	
	public class UnicodeConverter extends Sprite
	{
		private var matn2MC:TextField ;
		
		private var matnWidth0:Number,matnX0:Number ;
		
		private var alignMC:MovieClip ;
		
		private var newSliderMC:MovieClip,
					sliderX0:Number,
					sliderValueTD:TitleText;
		
		private var uni:Unicode;
		
		private var fontSizeTF:TitleText,
					fontSizeMC:MovieClip;
					
		private var fontSizeMinY:Number,
					fontSizeMaxY:Number,
					
					fontMinSize:uint = 5,
					fontMaxSize:uint=50,
					fontMidSize:uint;
					
		private var newInputTF:TextField ;
		
		private var fontNameField:PopField,
					alignField:PopFieldBoolean;
		
		private var defaultFont:String,
					lastFont:String ;
					
		private var clipboardMC:MovieClip ;

		private var copyMC:MovieClip ;
		
		private var typeHereMC:MovieClip ;
					
		public function UnicodeConverter()
		{
			super();
			
			
			var newVersionMC:MovieClip = Obj.get("new_version_mc",this);
			var hintTF:TextField = Obj.get("hint_mc",newVersionMC);
			newVersionMC.addEventListener(MouseEvent.CLICK,openUpdator);
			
			const fileURL:String = "https://github.com/SaffronCode/ArabicConverter/raw/master/ArabicConverter.air" ;
			
			function openUpdator(e:MouseEvent):void
			{
				newVersionMC.removeEventListener(MouseEvent.CLICK,openUpdator);
				var loader:URLLoader = new URLLoader(new URLRequest(fileURL));
				loader.dataFormat = URLLoaderDataFormat.BINARY ;
				
				loader.addEventListener(Event.COMPLETE,loaded);
				loader.addEventListener(ProgressEvent.PROGRESS,progress)
				
				hintTF.text = "Please wait ..." ;
				
				function progress(e:ProgressEvent):void
				{
					hintTF.text = "Please wait ...(%"+Math.round((e.bytesLoaded/e.bytesTotal)*100)+")" ;
				}
				
				function loaded(e:Event):void
				{
					var fileTarget:File = File.createTempDirectory().resolvePath('SaffronAppGenerator.air') ;
					FileManager.seveFile(fileTarget,loader.data);
					
					fileTarget.openWithDefaultApplication();
					
					hintTF.text = "The installer should be open now...";
					
					setTimeout(function(e){
						NativeApplication.nativeApplication.exit();
					},2000);
					
					newVersionMC.addEventListener(MouseEvent.CLICK,function(e)
					{
						//navigateToURL(new URLRequest(fileTarget.url));
						navigateToURL(new URLRequest(fileURL));
					});
				}
				
			}
			
			newVersionMC.visible = false ;
			var urlLoader:URLLoader = new URLLoader(new URLRequest("https://raw.githubusercontent.com/SaffronCode/ArabicConverter/master/Unicode-app.xml?"+new Date().time));
			urlLoader.dataFormat = URLLoaderDataFormat.TEXT ;
			urlLoader.addEventListener(Event.COMPLETE,function(e){
				var versionPart:Array = String(urlLoader.data).match(/<versionNumber>.*<\/versionNumber>/gi);
				trace("Version loaded : "+versionPart);
				if(versionPart.length>0)
				{
					versionPart[0] = String(versionPart[0]).split('<versionNumber>').join('').split('</versionNumber>').join('');
					trace("version loaded : "+versionPart[0]+' > '+(DevicePrefrence.appVersion==versionPart[0]));
					trace("DevicePrefrence.appVersion : "+DevicePrefrence.appVersion);
					if(!(DevicePrefrence.appVersion==versionPart[0]))
					{
						newVersionMC.visible = true ;
						newVersionMC.alpha = 0 ;
						AnimData.fadeIn(newVersionMC);
					}
				}
			});
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR,function(e){trace("Load error:"+e)});
			
			
			
			
			
			
			
			
			
			
			
			//////////////////
			
			uni = new Unicode();
			
			var cashedMatn:TextField = Obj.get("matn2",this);
			matn2MC = new TextField();
			this.addChild(matn2MC);
			matn2MC.x = cashedMatn.x;
			matn2MC.y = cashedMatn.y;
			matn2MC.width = cashedMatn.width ;
			matn2MC.height = cashedMatn.height ;
			matn2MC.embedFonts = true ;
			var textFormat:TextFormat = new TextFormat(cashedMatn.defaultTextFormat.font,cashedMatn.defaultTextFormat.size,null,null,null,null,null,null,TextAlign.RIGHT);
			matn2MC.defaultTextFormat = textFormat ;
			matn2MC.border = false ;
			Obj.remove(cashedMatn);
			
			newInputTF = Obj.get("input_txt",this);
			newInputTF.text = '' ;
			newInputTF.addEventListener(Event.CHANGE,updateFarsiNevisText);
			var inputarea:FarsiInputCorrection = FarsiInputCorrection.setUp(newInputTF,null,true,true,false,true);
			
			
			typeHereMC = Obj.get("type_here_area",this);
			typeHereMC.buttonMode = true ;
			typeHereMC.addEventListener(MouseEvent.CLICK,function(e){
				inputarea.focuseOnStageText();
			});
			
			clipboardMC = Obj.get("clipboard_mc",this);
			clipboardMC.mouseChildren = clipboardMC.mouseEnabled = false ;
			clipboardMC.alpha = 0;
			
			lastFont = defaultFont = matn2MC.defaultTextFormat.font ;
			
			fontNameField = Obj.get("font_name_text",this);
			fontNameField.setUp('Font:',defaultFont,null,false,true,false);
			fontNameField.addEventListener(Event.CHANGE,changeDefaultText);
			
			alignField = Obj.get("align_txt",this);
			alignField.setUp("Justify:",true,false);
			alignField.addEventListener(Event.CHANGE,updateFarsiNevisText);
			
			FrameGenerator.createFrame(stage,-1,this);
			
			copyMC = Obj.get("clipboard_button_mc",this);
			copyMC.buttonMode = true ;
			copyMC.addEventListener(MouseEvent.CLICK,copyText);
			
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
			sliderValueTD = Obj.get("width_size_tf",newSliderMC);
			newSliderMC.buttonMode = true ;
			sliderX0 = newSliderMC.x ;
			
			alignMC = Obj.get("alin",this);
			
			
			
			newSliderMC.addEventListener(MouseEvent.MOUSE_DOWN,startDragSlider);
			
			matn2MC.x = newSliderMC.x ;
			matn2MC.width = matnWidth0-(newSliderMC.x-matnX0);
			
			sliderValueTD.text = Math.round(matn2MC.width).toString();
		}
		
		protected function copyText(event:MouseEvent):void
		{
			Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT,matn2MC.text);
			clipboardMC.alpha = 2 ;
			//AnimData.fadeIn(clipboardMC,function(){
				AnimData.fadeOut(clipboardMC);
			//});
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
		
		/*private function chang(e){
			var myText = String(matnMC.text).split(String.fromCharCode(13)).join(String.fromCharCode(10)).split(String.fromCharCode(10));
			var myText2=''
			for(var i=myText.length-1;i>=0;i--){
				myText2 += myText[i]+'\n';
			}
			myText2 = myText2.substring(0,myText2.length-1)
			matn2MC.text = uni.toUnicode(myText2)
		}*/
		
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
				sliderValueTD.text = Math.round(matn2MC.width).toString();
			}
			
		private function changeDefaultText(e:*):void
		{
			var textFormat:TextFormat = matn2MC.defaultTextFormat ;
			if(fontNameField.text=='' || fontNameField.text==defaultFont)
			{
				matn2MC.embedFonts = true ;
				lastFont = defaultFont ;
			}
			else
			{
				matn2MC.embedFonts = false ;
				lastFont = fontNameField.text ;
			}
			textFormat.font = lastFont ;
			trace("Font changed to : "+textFormat.font);
			matn2MC.setTextFormat(textFormat);
			matn2MC.defaultTextFormat = textFormat ;
			//matn2MC.text = UnicodeStatic.convert('تست فونت')
			updateFarsiNevisText();
		}
			
		private function updateFarsiNevisText(e:Event=null):void
		{
			var textFormat:TextFormat = matn2MC.defaultTextFormat ;
			textFormat.size = fontMidSize ;
			if(lastFont==defaultFont)
				matn2MC.embedFonts = true ;
			else
				matn2MC.embedFonts = false ;
			textFormat.font = lastFont ;
			matn2MC.setTextFormat(textFormat);
			matn2MC.defaultTextFormat = textFormat ;
			trace("The font is : "+textFormat.font);
			try
			{
				uni.HTMLfastUnicodeOnLines(matn2MC,newInputTF.text,alignField.data);
			}catch(e){};
		}
	}
}