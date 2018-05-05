//by Mohammad Ebrahim -Motahar Parrs Co
//last edit 6/1/2013
//10/14/2013 : . character removed from estesna list for converting float Numbers like 15.5
///11/24/2013  fast html unicode added : HTMLfastUnicodeOnLines();  2 time slower than 
//				fastUnicodeOnLines but it can support coloring texts and justify paraphs
package  {
	import flash.text.*;
	import flash.utils.getTimer;
	

	public class Unicode {
		private var splitters:Array = new Array(',','.',' ','-',')',':')
		private var adad = '٠١٢٣٤٥٦٧٨٩۰۱۲۳۴۵۶۷۸۹٠١٢٣٤٥٦٧٨٩٠١٢٣٤٥٦٧٨٩۰۱۲۳۴۵۶۷۸۹۰۱۲۳۴۵۶۷۸۹����٪٪'
		private var estesna = '-[]»«)("/\\:'
		private var MESlistChr:Object = {};
		
		public function Unicode(numCorrection:Boolean = true){
			
			MESlistChr['پ'] = "ﭖ ﭗﺘﭙﺘﭘ";
			MESlistChr['ض'] = "ﺽ ﺾﺘﻀﺘﺿ";
			MESlistChr['ص'] = "ﺹ ﺺﺘﺼﺘﺻ";
			MESlistChr['ث'] = "ﺙ ﺚﺘﺜﺘﺛ";
			MESlistChr['ق'] = "ﻕ ﻖﺘﻘﺘﻗ";
			MESlistChr['ف'] = "ﻑ ﻒﺘﻔﺘﻓ";
			MESlistChr['غ'] = "ﻍ ﻎﺘﻐﺘﻏ";
			MESlistChr['ع'] = "ﻉ ﻊﺘﻌﺘﻋ";
			MESlistChr['ه'] = "ه ﻪﺘﻬﺘﻫ";
			MESlistChr['خ'] = "ﺥ ﺦﺘﺨﺘﺧ";;
			MESlistChr['ح'] = "ﺡ ﺢﺘﺤﺘﺣ";
			MESlistChr['ج'] = "ﺝ ﺞﺘﺠﺘﺟ";
			MESlistChr['چ'] = "ﭺ ﭻﺘﭽﺘﭼ";
			MESlistChr['ژ'] = "ﮊ ﮋﺗﮋﺗﮊ";
			MESlistChr['ش'] = "ﺵ ﺶﺘﺸﺘﺷ";
			MESlistChr['س'] = "ﺱ ﺲﺘﺴﺘﺳ";
			MESlistChr['ی'] = "ﯼ ﯽﺘﻴﺘﯾ";
			MESlistChr['ى'] = "ﯼ ﯽﺘﻴﺘﯾ";
			MESlistChr['ي'] = "ﯼ ﯽﺘﻴﺘﯾ";
			MESlistChr['ێ'] = "ێ ﯽﺘﻴﺘﯾ";
			MESlistChr['ب'] = "ﺏ ﺐﺘﺒﺘﺑ";
			MESlistChr['ل'] = "ﻝ ﻞﺘﻠﺘﻟ";
			MESlistChr['ڵ'] = "ڵ ﻞﺘﻠﺘﻟ";
			MESlistChr['ا'] = "ﺍ ﺎﺗﺎﺗﺍ";
			MESlistChr['ت'] = "ﺕ ﺖﺘﺘﺘﺗ";
			MESlistChr['ن'] = "ﻥ ﻦﺘﻨﺘﻧ";
			MESlistChr['م'] = "ﻡ ﻢﺘﻤﺘﻣ";
			MESlistChr['ظ'] = "ﻅ ﻆﺘﻈﺘﻇ";
			MESlistChr['ط'] = "ﻁ ﻂﺘﻄﺘﻃ";
			MESlistChr['ز'] = "ﺯ ﺰﺗﺰﺗﺯ";
			MESlistChr['ر'] = "ﺭ ﺮﺗﺮﺗﺭ";
			MESlistChr['ڕ'] = "ڕ ﺮﺗﺮﺗﺭ";
			MESlistChr['ذ'] = "ﺫ ﺬﺗﺬﺗﺫ";
			MESlistChr['د'] = "ﺩ ﺪﺗﺪﺗﺩ";
			MESlistChr['ئ'] = "ء ﺊﺘﺌﺘﺋ";
			MESlistChr['و'] = "ﻭ ﻮﺗﻮﺗﻭ";
			MESlistChr['ۆ'] = "ۆ ﻮﺗﻮﺗۆ";
			MESlistChr['ک'] = "ﮎ ﮏﺘﮑﺘﮐ";
			MESlistChr['ك'] = "ﮎ ﮏﺘﮑﺘﮐ";
			MESlistChr['گ'] = "ﮒ ﮓﺘﮕﺘﮔ";
			MESlistChr['آ'] = "ﺁ ﺂﺗﺂﺗﺁ";
			MESlistChr['أ'] = "ﺃ ﺄﺗﺄﺗﺃ";
			MESlistChr['إ'] = "ﺇ ﺈﺗﺈﺗﺇ";
			MESlistChr['ؤ'] = "ﺅ ﺆﺗﺆﺗﺅ";
			MESlistChr['؟'] = "؟";		//manande و , be hichi nemichasbe
			MESlistChr['ـ'] = "ــــــ";	//manande ـ be hame michasbe
			MESlistChr['«'] = "»";
			MESlistChr['»'] = "«";
			MESlistChr['['] = "]";
			MESlistChr[']'] = "[";
			MESlistChr['('] = ")";
			MESlistChr[')'] = "(";
			MESlistChr['٪'] = "%";
			MESlistChr['ً'] = "ًً";		//bi khasiate va az ghabli va badish asar migire
			MESlistChr['ٌ'] = "ÓÓ";
			MESlistChr['ٍ'] = "ٍٍ";
			MESlistChr['َ'] = "ََ";
			MESlistChr['ُ'] = "ُُ";
			MESlistChr['ِ'] = "ِِ";
			MESlistChr['ّ'] = "ّّ";
			MESlistChr['ة'] = "ﺓ ﺔﺘﻬﺘﻫ";
			MESlistChr[','] = ",";
			if(numCorrection){
				MESlistChr['۰'] = "0";
				MESlistChr['۱'] = "1";
				MESlistChr['۲'] = "2";
				MESlistChr['۳'] = "3";
				MESlistChr['۴'] = "4";
				MESlistChr['۵'] = "5";
				MESlistChr['۶'] = "6";
				MESlistChr['۷'] = "7";
				MESlistChr['۸'] = "8";
				MESlistChr['۹'] = "9";
				MESlistChr['٤'] = "4";
				MESlistChr['٥'] = "5";
				MESlistChr['٦'] = "6";
				MESlistChr['٧'] = "7";
				MESlistChr['٨'] = "8";
				MESlistChr['٩'] = "9";
				MESlistChr['٣'] = "3";
				MESlistChr['٢'] = "2";
				MESlistChr['١'] = "1";
				MESlistChr['٠'] = "0";
			}
			MESlistChr[','] = "،";
		}
		
		
		public function numCorrection(str:String){
			var I = String('۰').charCodeAt(0);
			for(var i=I ; i<I+10 ; i++){
				str = str.split(String.fromCharCode(i)).join(String(i-I));
			}
			I = String('٠').charCodeAt(0);
			for(i=I ; i<I+10 ; i++){
				str = str.split(String.fromCharCode(i)).join(String(i-I));
			}
			return str ;
		}
		
		public function entersCorrection(str:String):String{
			return String(str).split(String.fromCharCode(13)).join(String.fromCharCode(10)).split(String.fromCharCode(10)+String.fromCharCode(10)).join(String.fromCharCode(10));
		}
		
		//92-8-30
		/**if html boolean set to true , it will act on input tex as a HTML text*/
		public function fastUnicodeOnLines(yourTextField:TextField,tex:String,detectLanguage:Boolean = true){
			var myTextcash = entersCorrection(tex).split(String.fromCharCode(10));
			tex = '' ;
			var i ;
			for(i=0;i<myTextcash.length;i++){
				tex += toUnicode(myTextcash[i])+'\n';
			}
			tex = tex.substring(0,tex.length-1);
			var myText:String = (tex);
			//debug
				//yourTextField.text = myText;
				//return
			//debug end
			var parag:Array = myText.split('\n');
			var linesTest:Array = new Array();
			for(var j =0 ;j<parag.length;j++){
				yourTextField.text = parag[j] ;
				if(yourTextField.numLines==1){
					linesTest.push(parag[j]);
					continue;
				}//else V
				var lastNumLines:uint;
				var spaces;
				var cnt=0;
				while((lastNumLines = yourTextField.numLines)>1 && cnt<1000){
					cnt++;
					spaces = '' ;
					do{
						spaces+='-';
						yourTextField.text = spaces+parag[j] ;
					}while(lastNumLines == yourTextField.numLines) ;
					spaces = spaces.substring(1) ;
					yourTextField.text = spaces+parag[j] ;
					var cashedText:String = yourTextField.getLineText(lastNumLines-1);
					var lineIndex = yourTextField.getLineOffset(lastNumLines-1);
					
					var indexOfSplitters = Infinity ;
					for(i=0;i<splitters.length;i++){
						var J = cashedText.indexOf(splitters[i]) ;
						if(J!=-1){
							indexOfSplitters = Math.min(indexOfSplitters,J);
						}
					}
					if(indexOfSplitters == Infinity){
						indexOfSplitters = 0 ;
					}
					cashedText = cashedText.substring(indexOfSplitters);
					linesTest.push(cashedText);
					parag[j] = parag[j].substring(0,lineIndex+indexOfSplitters-spaces.length);
					yourTextField.text = parag[j] ;
				}
				linesTest.push(parag[j]);
			}
			//debug line
			//	yourTextField.text = cashedText ;
			//	return
			///debug line ended
			yourTextField.text = '' ;
			for(i=0;i<linesTest.length;i++){
				yourTextField.appendText(linesTest[i]+'\n');
			}
			yourTextField.text = yourTextField.text.substring(0,yourTextField.text.length-1);
		}
///92-9-3  fast html unicode
		public function HTMLfastUnicodeOnLines(yourTextField:TextField,tex:String,justify:Boolean = true){
			var myTextcash = entersCorrection(tex).split(String.fromCharCode(10));
			tex = '' ;
			var i ;
			for(i=0;i<myTextcash.length;i++){
				tex += HTMLUnicode(myTextcash[i])+'\n';
			}
			tex = tex.substring(0,tex.length-1);
			var myText:String = (tex);
			//debug
				//yourTextField.text = myText;
				//return
			//debug end
			var parag:Array = myText.split('\n');
			var linesTest:Array = new Array();
			for(var j =0 ;j<parag.length;j++){
				/// tamam e data haa bayad rooye textfield ha beran bad 
				yourTextField.htmlText = parag[j] ;
				/**parag become an xml string*/
				parag[j] = yourTextField.getXMLText();
				
				if(yourTextField.numLines==1){
					linesTest.push(parag[j]);
					continue;
				}//else V
				var lastNumLines:uint;
				var spaces;
				var cnt=0;
				var simpleText:String = yourTextField.text ;
				while((lastNumLines = yourTextField.numLines)>1 && cnt<10000){
					cnt++;
					spaces = '' ;
					do{
						spaces+='-';
						yourTextField.text = spaces+simpleText ;
					}while(lastNumLines == yourTextField.numLines) ;
					spaces = spaces.substring(1) ;
					yourTextField.text = spaces+simpleText ;
					
					//trace("lastNumLines : "+lastNumLines)
					
					var cashedText:String = yourTextField.getLineText(lastNumLines-1);
					var lineIndex = yourTextField.getLineOffset(lastNumLines-1);
					
					
					var indexOfSplitters = Infinity ;
					for(i=0;i<splitters.length;i++){
						var J = cashedText.indexOf(splitters[i]) ;
						if(J!=-1){
							indexOfSplitters = Math.min(indexOfSplitters,J);
						}
					}
					if(indexOfSplitters == Infinity){
						indexOfSplitters = 0 ;
					}
					yourTextField.text = '' ;
					yourTextField.insertXMLText(0,0,parag[j]);
					/**total charechter of line*/
					var tc:uint = yourTextField.text.length ;
					linesTest.push(yourTextField.getXMLText(tc-cashedText.length+indexOfSplitters));
					//cashedText = cashedText.substring(indexOfSplitters);
					//trace(tc+'-'+cashedText+'+'+indexOfSplitters+' = '+(tc-cashedText.length+indexOfSplitters));
					simpleText = simpleText.substring(0,tc-cashedText.length+indexOfSplitters);
					parag[j] = yourTextField.getXMLText(0,tc-cashedText.length+indexOfSplitters);
					
					
					var xmlSpace:String = '<flashrichtext version="1"><textformat>( )</textformat></flashrichtext>' ;
					if(justify)
					{
						yourTextField.text = '' ;
						yourTextField.insertXMLText(0,0,linesTest[linesTest.length-1]);
						var spases:Array = getChars(yourTextField.text,' ');
						var savedXML:String ;
						var cnt2:uint = 0;
						do
						{
							cnt2++
							savedXML = yourTextField.getXMLText();
							var index:uint = spases[Math.floor(Math.random()*spases.length)];
							yourTextField.insertXMLText(index,index,xmlSpace);
							for(var k = 0 ; k<spases.length;k++)
							{
								if(spases[k]>index)
								{
									spases[k]++;
								}
							}
						}while(spases.length>0 && yourTextField.numLines<2 && cnt2<100);
						linesTest[linesTest.length-1] = savedXML ;
					}
					
					
					yourTextField.text = '' ;
					yourTextField.insertXMLText(0,0,parag[j]);
					//yourTextField.text = '' ;
					//yourTextField.insertXMLText(0,0,linesTest[linesTest.length-1])
					//return ;
					/*cashedText = yourTextField.getXMLText(yourTextField.getLineOffset(lastNumLines-1)+indexOfSplitters
																	 ,yourTextField.getLineOffset(lastNumLines-1)
																	 +yourTextField.getLineLength(lastNumLines-1));*/
					
					/*linesTest.push(cashedText);
					parag[j] = parag[j].substring(0,lineIndex+indexOfSplitters-spaces.length);
					yourTextField.htmlText = parag[j] ;*/
				}
				linesTest.push(parag[j]);
			}
			//debug line
			//	yourTextField.text = cashedText ;
			//	return
			///debug line ended
			
			var enterXML:String = '<flashrichtext version="1"><textformat>(\n)</textformat></flashrichtext>' ;//yourTextField.getXMLText();
			yourTextField.text = '';
			for(i=0;i<linesTest.length;i++){
				var tc2:uint = yourTextField.text.length ;
				yourTextField.insertXMLText(tc2,tc2,linesTest[i]);
				if(i!=0)
				{
					yourTextField.insertXMLText(tc2,tc2,enterXML);
				}
			}
			//yourTextField.text = yourTextField.text.substring(0,yourTextField.text.length-1);
		}
		
		///**returns list of selected char on paragraph*/
		private function getChars(parag:String,char:String=' '):Array
		{
			var founded:Array = new Array();
			var f:int = 0 ;
			var cnt:int = -1 ;
			while((f=parag.indexOf(char,f+1))!=-1 && cnt<100)
			{
				cnt++;
				founded.push(f);
			}
			return founded; 
		
		}
		
		public function farsiCorrection(str:String){
			return str.split('آ').join('آ').split('ی').join('ي').split('‌').join(' ').split('‏').join(' ')
		}
		/**style 0 mamooli , 1 aval chasban , 2 dovom chasban , 3 do var chasban*/
		public function toUnicode(ch,style=0){
			ch = farsiCorrection(ch);
			var matn = "";
			var v0,v1,v2;
			var numString=''
			var parantez;
			var chC1,chC2
			
			if(ch==''){
				return ch;
			}
			for(var i=0;i<ch.length;i++){
				if(MESisEnglish(ch.charAt(i))){
					parantez = ch.charAt(i)
					if(parantez==')' || parantez=='('){
						chC1 = ch.charAt(i-1);
						chC2 = ch.charAt(i+1);
						//trace(chC1+' and '+chC2+"(charCod)"+chC2.charCodeAt(0)+' for '+parantez)
						if(chC1==' '||chC1==''){
							chC1=0
						}else if(MESisEnglish(chC1)){
							chC1=1
						}else{
							chC1=-1
						}
						if(chC2==' '||chC2==''){
							chC2=0
						}else if(MESisEnglish(chC2)){
							chC2=1
						}else{
							chC2=-1
						}
						//trace(chC1+' and '+chC2+' for '+parantez)
						if(chC1!=1&&chC2!=1){
							parantez = (parantez==')')?'(':')';
							//ch = ch.substring(0,i)+parantez+ch.substring(i+1)
						}
					}
					numString+=parantez;
					continue;
				}else{
					matn =MESbekesh(numString)+matn;
					numString=''
				}
				v1 = MESfindeType(ch.charAt(i));
				var j=1;
				do{
					v0 = MESfindeType(ch.charAt(i-j));
					j++
				}while(v0=='-');
				j=1;
				do{
					v2 = MESfindeType(ch.charAt(i+j));
					j++
				}while(v2=='-');
				if(i==0){
					if(style==1||style==3){
						v0 = "11"
					}
				}
				if(i==ch.length-1){
					if(style==2||style==3){
						v2 = "11"
					}			
				}
				if(v1=='-'){
					v1 = v0.charAt(1)+v2.charAt(0);
				}else{
					v1 = String(Math.min(Number(v2.charAt(1)),Number(v1.charAt(0))))+''+String(Math.min(Number(v1.charAt(1)),Number(v0.charAt(0))))
				}
				matn = MESbekesh(ch.charAt(i),v1)+matn
			}
			matn =MESbekesh(numString)+matn;
			matn = matn.split('ﺎﻟ').join('ﻻ').split(String.fromCharCode(160)).join('').split('ﺄﻠ').join('ﻸ').split('ﺈﻠ').join('ﻺ').split('ﺂﻠ').join('ﻶ').split('ﺎﻠ').join('ﻼ').split('ﺄﻟ').join('ﻷ').split('ﺂﻟ').join('ﻵ').split('ﺈﻟ').join('ﻹ');
			return matn
		}
		
		
		private function MESisEnglish(megh:String){
			if(MESlistChr[megh]==undefined && megh.charCodeAt(0)<1417 && estesna.indexOf(megh)==-1 || adad.indexOf(megh)!=-1){
				return true
			}else{
				return false;
			}
		}

		private function MESfindeType(ch){
			var typ = "00"
			if(MESlistChr[ch]!=undefined){
				if(MESlistChr[ch].length==6&&MESlistChr[ch].charAt(2)==MESlistChr[ch].charAt(1)){
				typ = '11';
				}else if(MESlistChr[ch].length==1){
					typ = '00';
				}else if(MESlistChr[ch].length==2){
					typ = '-';	//baraye Seda ha ًٌَُ
				}else if(MESlistChr[ch].charAt(4)==MESlistChr[ch].charAt(2)){
					typ = "01";
				}else if(MESlistChr[ch].charAt(4)==MESlistChr[ch].charAt(6)){
					typ = "10";
				}else if(MESlistChr[ch].charAt(0)==MESlistChr[ch].charAt(4)){
					typ = "00";
				}else{
					typ = "11";
				}
			}
			return typ
		}
		
		private function MESbekesh(character,no=-1){
			character=character.split('ي').join('ی').split('آ').join('آ');
			if(no==-1){
				if(MESlistChr[character] != undefined && MESlistChr[character].length==1){
					return MESlistChr[character];
				}else{
					return character;
				}
			}
			var at=-1;
			switch(no){
				case("01"):{
					at=2
					break;
				}
				case("10"):{
					at=6
					break;
				}
				case("00"):{
					at=0
					break;
				}
				case("11"):{
					at=4
					break;
				}
			}
			if(MESlistChr[character]!=undefined){
				at = Math.min(String(MESlistChr[character]).length-1,at);
				return(MESlistChr[character].charAt(at))
			}else{
				return character;
			}
		}


		public function getPorp(htm,color=false,size=false,align=false,lending=false){
			var cash:String = ''
			if(color){
				cash = "COLOR=\"";
			}else if(size){
				cash = "SIZE=\"";
			}else if(align){
				cash = "ALIGN=\"";
			}else if(lending){
				cash = "LEADING=\"";
			}else{
				return
			}
			htm = String(htm).toUpperCase()
			var I=htm.indexOf(cash)+cash.length;
			var htm2 = htm.substring(I)
			var num = (htm2.substring(0,htm2.indexOf('\"')))
			return num
		}
		public function setPorp(htm,variable,color=false,size=false,align=false,lending=false){
			var cash:String = ''
			var htm2=''
			if(color){
				cash = "COLOR=\"";
			}else if(size){
				cash = "SIZE=\"";
			}else if(align){
				cash = "ALIGN=\"";
			}else if(lending){
				cash = "LEADING=\"";
			}else{
				return
			}
			while(htm.indexOf(cash)!=-1){
				htm2 = htm2 + htm.substring(0,htm.indexOf(cash)+cash.length)
				htm = htm.substring(htm.indexOf(cash)+cash.length)
				htm = htm.substring(htm.indexOf('\"'))
			}
			
			htm2 = htm2 + htm
			
			htm = htm2.split(cash+'\"').join(cash+variable+'\"')
			
			return htm
		}

		private var nemoone = "ارسلان فتحی پور، نماینده مردم کلیبر در خصوص نابسامانی های ارزی کشور به خبرنگار تابناک گفت: تا به حال به خیلی از کالاهای غیر ضروری ارز دولتی تعلق می‌گرفت- برای مثال حتی واردات کالاهایی مانند عروسک‌های چنی نیز از همین طریق وارد می‌شد- ولی ما در مجلس  در حال سامان دهی این موضوع هستیم تا بتوانیم با تفکیک قیمت ارز این مشکل را برطرف کنیم."//'وقوع <FONT COLOR=\"#FF0000\">انقلاب</FONT> هاي عربي در منطقه <FONT COLOR=\"#FF0099\">خاورميانه</FONT> و شمال آفريقا، آغازگر دوره اي جديد در سياست خارجي ترکيه بود که تاکنون ادامه دارد. تحليلگر روزنامه «تودي زمان» در مطلبي با بررسي نتايج و پيامدهاي اين سياست خارج نتيجه مي گيرد که اين سياست، موجب فرسودگي و از توان افتادگي ترکيه شده است';//'
		
		public function HTMLUnicode(tex){
			var tex2:String = '';
			var texC:String = '';
			var htmC1:String = '';
			var htmC2:String = '';
			while(tex.indexOf('<FONT')!=-1){
				texC = tex.substring(0,tex.indexOf('<'))
				tex2 = toUnicode(texC)+tex2;
				htmC1 = tex.substring(tex.indexOf('<FONT'),tex.indexOf('>')+1)
				tex = tex.substring(tex.indexOf('>')+1)
				texC = tex.substring(0,tex.indexOf('</FONT>'))
				tex2 = htmC1+toUnicode(texC)+"</FONT>"+tex2
				tex = tex.substring(tex.indexOf('>')+1)
			}
			tex2 = toUnicode(tex)+tex2
			return tex2
		}
		
		public function justHTML(field_txt,tex:String,autoSize_F:Boolean=true){
			field_txt.text = 's'
			var cashAlign = getPorp(field_txt.htmlText,false,false,true)
			if(autoSize_F){
				field_txt.autoSize = TextFieldAutoSize.CENTER;
			}
			field_txt.htmlText = tex;
		}

		public function UnicodeSet(field_txt,tex:String,justifyFlag:Boolean=false,autoSize_F:Boolean=true,shoHTML_f:Boolean=false,myID:String='',ezafe:String='',ezafe2:String=''){
			var ZAKHIRE = tex
			if(tex==''){
				field_txt.text = ''
				return
			}
			field_txt.text = 's'
			var cashAlign = getPorp(field_txt.htmlText,false,false,true)
			if(autoSize_F){
				field_txt.autoSize = TextFieldAutoSize.CENTER;
			}
			//trace('**'+cashAlign)
			field_txt.multiline = true
			var lines:String = '';
			var cash:Array;
			var lineI = 0;
			field_txt.text = tex.charAt(0)
			var lastH = field_txt.textHeight;
			var I=0
			var split=0
			for(I=0;I<=tex.length;I++){
				cash = htmlSplit(tex,I)
				field_txt.htmlText = HTMLUnicode(cash[0]);
				if(field_txt.textHeight>lastH){
					//cash = htmlSplit(tex,I-5)
					split = getLastSplit(cash[0])
					if(split==0){
						split=I-1
					}
					cash = htmlSplit(tex,split)
					I=-1
					tex = cash[1]
					if(justifyFlag){
						trace('justify it');
						cash[0] = justifyUnicode(field_txt,cash[0])
					}
					lines=lines+"<P ALIGN=\"CENTER\">"+HTMLUnicode(cash[0])+"</P>"
				}
			}
			lines=lines+"<P ALIGN=\"CENTER\">"+HTMLUnicode(tex)+"</P>"
			lines = setPorp(lines,cashAlign,false,false,true)
			if(shoHTML_f){
				if(ezafe!=''&&ezafe!='undefined'&&ezafe!='null'){
					ezafe = "','"+ezafe
				}else{
					ezafe = '';
				}
				if(ezafe2!=''){
					ezafe2 = "','"+ezafe2
				}else{
					ezafe2 = '';
				}
				trace(myID+"new Array(\'"+ZAKHIRE+ezafe+"','"+lines+ezafe2+"')")
			}
			field_txt.htmlText = lines;
		}

		private function getLastSplit(tex){
			var mem = 0;
			var cash=0;
			var batel=false
			for(var i=0;i<splitters.length;i++){
				for(var j=0;j<tex.length-2;j++){
					cash = tex.charAt(j)
					if(cash=='<'){
						batel=true
					}else if(cash=='>'){
						batel=false
					}
					if(batel){
						continue
					}
					if(cash == splitters[i]){
						mem = Math.max(mem,j)
					}
				}
			}
			return mem
		}

		private function justifyUnicode(field_txt,matn){
			field_txt.text = '.';
			var lastH = field_txt.textHeight;
			var lastMatn = matn;
			var lastMatn2 = matn;
			var lastI = new Array(matn,0)
			var contor=1
			while(field_txt.textHeight<=lastH){
				contor++
				lastMatn2 = lastMatn
				lastMatn = lastI[0]
				lastI = putJUnicode(lastMatn,lastI[1])
				if(lastI[0]==false){
					break
				}
				field_txt.htmlText = HTMLUnicode(lastI[0])
				if(contor>40){
					break
				}
			}
			return lastMatn2
		}
		private function putJUnicode(matn,I){
			var batel=false
			var newMatn=matn
			var cash;
			var myI
			var shans:Array = new Array()
			for(var i=0;i<matn.length;i++){
				myI = (i+I)%matn.length
				cash = matn.charAt(myI)
				if(cash=='<'){
					batel=true
				}else if(cash=='>'){
					batel=false
				}
				if(batel){
					continue
				}
				if(MESfindeType(matn.charAt(myI)).charAt(0)=='1'&&MESfindeType(matn.charAt(myI+1)).charAt(1)=='1'&&(matn.charAt(myI+1)!='ـ')){
					shans.push(myI+1)
				}
			}
			if(shans.length==0){
				return new Array(false,false)
			}else{
				var rand = Math.floor(Math.random()*shans.length)
				newMatn = matn.substring(0,shans[rand])+'ـ'+matn.substring(shans[rand])
				return new Array(newMatn,0)
			}
		}

		private function htmlSplit(tex,I){
			var matn1='';
			var matn2='';
			
			matn1 = tex.substring(0,I);
			matn2 = tex.substring(I);
			
			if(matn2.indexOf('>')==-1){
				//trace('addi')
			}else{
				if(matn2.indexOf('<')==-1){
					matn2 = matn1.substring(matn1.lastIndexOf('<'))+matn2;
					matn1 = matn1.substring(0,matn1.lastIndexOf('<'));
				}else{
					if(matn2.indexOf('<')<matn2.indexOf('>')){
						//trace('con1')
						if(matn2.indexOf('<')==matn2.indexOf('</FONT')){
							//trace('con2')
							matn2 = matn1.substring(matn1.lastIndexOf('<'),matn1.lastIndexOf('>')+1)+matn2;
							matn1 = matn1+'</FONT>'
						}
					}else{
						if(matn1.lastIndexOf('<')==matn1.lastIndexOf('</')||matn2.indexOf('>')==matn2.indexOf('T>')+1){
							matn2 = matn2.substring(matn2.indexOf('>')+1)
							matn1 = matn1.substring(0,matn1.lastIndexOf('<'));
							matn1 = matn1+'</FONT>'
						}else{
							matn2 = matn1.substring(matn1.lastIndexOf('<'))+matn2;
							matn1 = matn1.substring(0,matn1.lastIndexOf('<'));
						}
					}
				}
			}
			return new Array(matn1,matn2)
		}
		//UnicodeSet(matn_txt,nemoone)
		
	}
	
}
