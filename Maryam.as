package  {
	import flash.text.*;

	public class Maryam {
		private var splitters:Array = new Array(',','.',' ','-',')')
		private var adad = '٠١٢٣٤٥٦٧٨٩۰۱۲۳۴۵۶۷۸۹'
		private var estesna = '- []»«)(/:'
		private var MESlistChr:Object = {};
		
		public function Maryam(){
			MESlistChr['پ'] = "N OTPTQ";
			MESlistChr['ض'] = "Æ ÇTñTò"
			MESlistChr['ص'] = "| }T~TÅ"
			MESlistChr['ث'] = "V WTXTY"
			MESlistChr['ق'] = "¡ ¢T£T¤"
			MESlistChr['ف'] = "ý þTÿTÎ"
			MESlistChr['غ'] = "ù úTûTü"
			MESlistChr['ع'] = "Ì ÍT÷Tø"
			MESlistChr['ه'] = "½ ¾T¿TÀ"
			MESlistChr['خ'] = "f gThTi"
			MESlistChr['ح'] = "b cTdTe"
			MESlistChr['ج'] = "Z [T\\T]"
			MESlistChr['چ'] = "^ _T`Ta"
			MESlistChr['ژ'] = "r sUsUr"
			MESlistChr['ش'] = "x yTzT{"
			MESlistChr['س'] = "t uTvTw"
			MESlistChr['ی'] = "Á ÂTÃTÄ"
			MESlistChr['ي'] = "Á ÂTÃTÄ"
			MESlistChr['ب'] = "J KTLTM"
			MESlistChr['ل'] = "Ï ®T±T²"
			MESlistChr['ا'] = "H IUIUH"
			MESlistChr['ت'] = "R STTTU"
			MESlistChr['ن'] = "· ¸T¹Tº"
			MESlistChr['م'] = "³ ´TµT¶"
			MESlistChr['ظ'] = "È ÉTÊTÈ"
			MESlistChr['ط'] = "ó ôTõTö"
			MESlistChr['ز'] = "p qUqUp"
			MESlistChr['ر'] = "n oUoUn"
			MESlistChr['ذ'] = "l mUmUl"
			MESlistChr['د'] = "j kUkUj"
			MESlistChr['ئ'] = "E ÂTFTG"
			MESlistChr['ء'] = "E ÂTFTG"
			MESlistChr['و'] = "» ¼U¼U»"
			MESlistChr['ک'] = "¥ ¦T§T¨"
			MESlistChr['ك'] = "¥ ¦T§T¨"
			MESlistChr['گ'] = "© ªT«T¬"
			MESlistChr['آ'] = "A BUBUA"
			MESlistChr['أ'] = "H IUIUH"
			MESlistChr['؟'] = "?"		//manande و , be hichi nemichasbe
			MESlistChr['ـ'] = "@@@@@@"	//manande ـ be hame michasbe
			MESlistChr['«'] = "\""
			MESlistChr['»'] = "\""
			MESlistChr['['] = "]"
			MESlistChr[']'] = "["
			MESlistChr['('] = ")"
			MESlistChr[')'] = "("
			MESlistChr['ً'] = "ÓÓ"		//bi khasiate va az ghabli va badish asar migire
			MESlistChr['ٌ'] = "ÕÕ"
			MESlistChr['ٍ'] = "àà"
			MESlistChr['َ'] = "ÒÒ"
			MESlistChr['ُ'] = "ÔÔ"
			MESlistChr['ِ'] = "ßß"
			MESlistChr['ّ'] = "ØØ"
			MESlistChr['ة'] = "½ ¾U¾U½"
			MESlistChr[','] = ","
			MESlistChr['۰'] = "0"
			MESlistChr['۱'] = "1"
			MESlistChr['۲'] = "2"
			MESlistChr['۳'] = "3"
			MESlistChr['۴'] = "4"
			MESlistChr['۵'] = "5"
			MESlistChr['۶'] = "6"
			MESlistChr['۷'] = "7"
			MESlistChr['۸'] = "8"
			MESlistChr['۹'] = "9"
			MESlistChr['٤'] = "4"
			MESlistChr['٥'] = "5"
			MESlistChr['٦'] = "6"
			MESlistChr['٧'] = "7"
			MESlistChr['٨'] = "8"
			MESlistChr['٩'] = "9"
			MESlistChr['٣'] = "3"
			MESlistChr['٢'] = "2"
			MESlistChr['١'] = "1"
			MESlistChr['٠'] = "0"
			MESlistChr['¬'] = " "
		}
		public function toMaryam(ch,style=0){//style 0 mamooli , 1 aval chasban , 2 dovom chasban , 3 do var chasban
			ch = ch.split('ۀ').join('ه')
			var matn = "";
			var v0,v1,v2;
			var numString=''
			for(var i=0;i<ch.length;i++){
				if(MESisEnglish(ch.charAt(i))){
					numString+=ch.charAt(i);
					continue;
				}else{
					matn =numString+matn;
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
			matn =numString+matn;
			matn = matn.split('I±').join('°').split('I²').join('¯')
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
		
		private function MESbekesh(character,no){
			character=character.split('ي').join('ی').split('‌').join(' ').split('‏').join(' ')
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
				at = Math.min(String(MESlistChr[character]).length-1,at)
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
		
		public function HTMLMaryam(tex){
			var tex2:String = '';
			var texC:String = '';
			var htmC1:String = '';
			var htmC2:String = '';
			while(tex.indexOf('<FONT')!=-1){
				texC = tex.substring(0,tex.indexOf('<'))
				tex2 = toMaryam(texC)+tex2;
				htmC1 = tex.substring(tex.indexOf('<FONT'),tex.indexOf('>')+1)
				tex = tex.substring(tex.indexOf('>')+1)
				texC = tex.substring(0,tex.indexOf('</FONT>'))
				tex2 = htmC1+toMaryam(texC)+"</FONT>"+tex2
				tex = tex.substring(tex.indexOf('>')+1)
			}
			tex2 = toMaryam(tex)+tex2
			return tex2
		}


		public function maryamSet(field_txt,tex,justifyFlag:Boolean=false,autoSize_F:Boolean=true){
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
			for(I=0;I<tex.length;I++){
				cash = htmlSplit(tex,I)
				field_txt.htmlText = HTMLMaryam(cash[0]);
				if(field_txt.textHeight>lastH){
					split = getLastSplit(cash[0])
					if(split==0){
						split=I-1
					}
					cash = htmlSplit(tex,split)
					I=-1
					tex = cash[1]
					if(justifyFlag){
						cash[0] = justifyMaryam(field_txt,cash[0])
					}
					lines=lines+"<P ALIGN=\"CENTER\">"+HTMLMaryam(cash[0])+"</P>"
				}
			}
			lines=lines+"<P ALIGN=\"CENTER\">"+HTMLMaryam(tex)+"</P>"
			lines = setPorp(lines,cashAlign,false,false,true)
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

		private function justifyMaryam(field_txt,matn){
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
				lastI = putJMaryam(lastMatn,lastI[1])
				if(lastI[0]==false){
					break
				}
				field_txt.htmlText = HTMLMaryam(lastI[0])
				if(contor>40){
					break
				}
			}
			return lastMatn2
		}
		private function putJMaryam(matn,I){
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
				if(MESfindeType(matn.charAt(myI)).charAt(0)=='1'&&MESfindeType(matn.charAt(myI+1)).charAt(1)=='1'&&(matn.charAt(myI+1)!='ـ'||matn.charAt(myI)!='ـ')){
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
		//maryamSet(matn_txt,nemoone)
		
	}
	
}
