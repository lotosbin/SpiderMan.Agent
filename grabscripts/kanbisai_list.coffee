# date.js
`
eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('8.$2m=1.2n;8.Q=u(x){e(x<0||x>9?"":"0")+x};8.1g=B R(\'2o\',\'2p\',\'2l\',\'2k\',\'1z\',\'2g\',\'2h\',\'2i\',\'2j\',\'2q\',\'2r\',\'2y\');8.14=B R(\'2z\',\'2A\',\'2x\',\'2w\',\'1z\',\'2s\',\'2t\',\'2u\',\'2v\',\'2f\',\'2b\',\'1R\');8.1d=B R(\'1W\',\'1Z\',\'1Y\',\'1V\',\'1U\',\'1S\',\'1T\');8.1f=B R(\'1X\',\'2e\',\'20\',\'2c\',\'2d\',\'2a\',\'27\');8.1s=1L;3(!8.C.1c){8.C.1c=u(){b S=7.1y();e(S<16?S+16:S)}}8.1q=u(r,t){3(1e(t)=="1a"||t==f||t==""){b 1D=B R(\'y-M-d\',\'G d, y\',\'G d,y\',\'y-G-d\',\'d-G-y\',\'G d\',\'G-d\',\'d-G\');b 1v=B R(\'M/d/y\',\'M-d-y\',\'M.d.y\',\'M/d\',\'M-d\');b 1t=B R(\'d/M/y\',\'d-M-y\',\'d.M.y\',\'d/M\',\'d-M\');b 1u=B R(1D,8.1s?1v:1t,8.1s?1t:1v);Z(b i=0;i<1u.g;i++){b l=1u[i];Z(b j=0;j<l.g;j++){b d=8.1q(r,l[j]);3(d!=f){e d}}}e f};7.1I=u(r){Z(b i=0;i<r.g;i++){3("26".2C(r.U(i))==-1){e 13}}e 1L};7.O=u(1E,i,1i,1C){Z(b x=1C;x>=1i;x--){b 5=1E.T(i,i+x);3(5.g<1i){e f}3(7.1I(5)){e 5}}e f};r=r+"";t=t+"";b o=0;b D=0;b c="";b 5="";b 2T="";b x,y;b A=B 8().1c();b v=1;b I=1;b p=0;b J=0;b L=0;b 10="";W(D<t.g){c=t.U(D);5="";W((t.U(D)==c)&&(D<t.g)){5+=t.U(D++)}3(5=="19"||5=="S"||5=="y"){3(5=="19"){x=4;y=4}3(5=="S"){x=2;y=2}3(5=="y"){x=2;y=4}A=7.O(r,o,x,y);3(A==f){e f}o+=A.g;3(A.g==2){3(A>2V){A=16+(A-0)}q{A=2R+(A-0)}}}q 3(5=="G"||5=="1P"){v=0;b Y=(5=="G"?(8.1g.2O(8.14)):8.14);Z(b i=0;i<Y.g;i++){b 1h=Y[i];3(r.T(o,o+1h.g).V()==1h.V()){v=(i%12)+1;o+=1h.g;1A}}3((v<1)||(v>12)){e f}}q 3(5=="1r"||5=="E"){b Y=(5=="1r"?8.1d:8.1f);Z(b i=0;i<Y.g;i++){b 18=Y[i];3(r.T(o,o+18.g).V()==18.V()){o+=18.g;1A}}}q 3(5=="1o"||5=="M"){v=7.O(r,o,5.g,2);3(v==f||(v<1)||(v>12)){e f}o+=v.g}q 3(5=="1m"||5=="d"){I=7.O(r,o,5.g,2);3(I==f||(I<1)||(I>2E)){e f}o+=I.g}q 3(5=="p"||5=="h"){p=7.O(r,o,5.g,2);3(p==f||(p<1)||(p>12)){e f}o+=p.g}q 3(5=="1k"||5=="H"){p=7.O(r,o,5.g,2);3(p==f||(p<0)||(p>23)){e f}o+=p.g}q 3(5=="1l"||5=="K"){p=7.O(r,o,5.g,2);3(p==f||(p<0)||(p>11)){e f}o+=p.g;p++}q 3(5=="1j"||5=="k"){p=7.O(r,o,5.g,2);3(p==f||(p<1)||(p>24)){e f}o+=p.g;p--}q 3(5=="J"||5=="m"){J=7.O(r,o,5.g,2);3(J==f||(J<0)||(J>1K)){e f}o+=J.g}q 3(5=="L"||5=="s"){L=7.O(r,o,5.g,2);3(L==f||(L<0)||(L>1K)){e f}o+=L.g}q 3(5=="a"){3(r.T(o,o+2).V()=="2J"){10="1w"}q 3(r.T(o,o+2).V()=="2N"){10="1x"}q{e f}o+=2}q{3(r.T(o,o+5.g)!=5){e f}q{o+=5.g}}}3(o!=r.g){e f}3(v==2){3(((A%4==0)&&(A%2M!=0))||(A%2L==0)){3(I>29){e f}}q{3(I>28){e f}}}3((v==4)||(v==6)||(v==9)||(v==11)){3(I>2K){e f}}3(p<12&&10=="1x"){p=p-0+12}q 3(p>11&&10=="1w"){p-=12}e B 8(A,v-1,I,p,J,L)};8.2I=u(r,t){e(8.1q(r,t)!=f)};8.C.2D=u(F){3(F==f){e 13}e(7.P()<F.P())};8.C.2F=u(F){3(F==f){e 13}e(7.P()>F.P())};8.C.2G=u(F){3(F==f){e 13}e(7.P()==F.P())};8.C.2W=u(F){3(F==f){e 13}b 1J=B 8(7.P()).1p();b 1F=B 8(F.P()).1p();e(1J.P()==1F.P())};8.C.t=u(t){t=t+"";b X="";b D=0;b c="";b 5="";b y=7.1y()+"";b M=7.1b()+1;b d=7.1Q();b E=7.15();b H=7.1N();b m=7.1G();b s=7.1H();b 19,S,G,1o,1m,p,h,J,L,10,1k,H,1l,K,1j,k;b n=B 2B();3(y.g<4){y=""+(+y+16)}n["y"]=""+y;n["19"]=y;n["S"]=y.T(2,4);n["M"]=M;n["1o"]=8.Q(M);n["G"]=8.1g[M-1];n["1P"]=8.14[M-1];n["d"]=d;n["1m"]=8.Q(d);n["E"]=8.1f[E];n["1r"]=8.1d[E];n["H"]=H;n["1k"]=8.Q(H);3(H==0){n["h"]=12}q 3(H>12){n["h"]=H-12}q{n["h"]=H}n["p"]=8.Q(n["h"]);n["K"]=n["h"]-1;n["k"]=n["H"]+1;n["1l"]=8.Q(n["K"]);n["1j"]=8.Q(n["k"]);3(H>11){n["a"]="1x"}q{n["a"]="1w"}n["m"]=m;n["J"]=8.Q(m);n["s"]=s;n["L"]=8.Q(s);W(D<t.g){c=t.U(D);5="";W((t.U(D)==c)&&(D<t.g)){5+=t.U(D++)}3(1e(n[5])!="1a"){X=X+n[5]}q{X=X+5}}e X};8.C.2P=u(){e 8.1d[7.15()]};8.C.2H=u(){e 8.1f[7.15()]};8.C.2U=u(){e 8.1g[7.1b()]};8.C.2Q=u(){e 8.14[7.1b()]};8.C.1p=u(){7.1O(0);7.1B(0);7.1M(0);7.2S(0);e 7};8.C.1n=u(N,z){3(1e(N)=="1a"||N==f||1e(z)=="1a"||z==f){e 7}z=+z;3(N==\'y\'){7.25(7.1c()+z)}q 3(N==\'M\'){7.22(7.1b()+z)}q 3(N==\'d\'){7.21(7.1Q()+z)}q 3(N==\'w\'){b 17=(z>0)?1:-1;W(z!=0){7.1n(\'d\',17);W(7.15()==0||7.15()==6){7.1n(\'d\',17)}z-=17}}q 3(N==\'h\'){7.1O(7.1N()+z)}q 3(N==\'m\'){7.1B(7.1G()+z)}q 3(N==\'s\'){7.1M(7.1H()+z)}e 7};',62,183,'|||if||token||this|Date|||var|||return|null|length|||||||value|i_val|hh|else|val||format|function|month||||number|year|new|prototype|i_format||date2|MMM||date|mm||ss||interval|getInt|getTime|LZ|Array|yy|substring|charAt|toLowerCase|while|result|names|for|ampm|||false|monthAbbreviations|getDay|1900|step|day_name|yyyy|undefined|getMonth|getFullYear|dayNames|typeof|dayAbbreviations|monthNames|month_name|minlength|kk|HH|KK|dd|add|MM|clearTime|parseString|EE|preferAmericanFormat|dateFirst|checkList|monthFirst|AM|PM|getYear|May|break|setMinutes|maxlength|generalFormats|str|d2|getMinutes|getSeconds|isInteger|d1|59|true|setSeconds|getHours|setHours|NNN|getDate|Dec|Friday|Saturday|Thursday|Wednesday|Sunday|Sun|Tuesday|Monday|Tue|setDate|setMonth|||setFullYear|1234567890|Sat|||Fri|Nov|Wed|Thu|Mon|Oct|June|July|August|September|April|March|VERSION|02|January|February|October|November|Jun|Jul|Aug|Sep|Apr|Mar|December|Jan|Feb|Object|indexOf|isBefore|31|isAfter|equals|getDayAbbreviation|isValid|am|30|400|100|pm|concat|getDayName|getMonthAbbreviation|2000|setMilliseconds|token2|getMonthName|70|equalsIgnoreTime'.split('|'),0,{}))
`

window.spGrab = ->
	data = []
	body = JSON.parse(document.body.innerHTML)[1]
	body.forEach (el, index)->
		matchs = el[Object.keys(el)[0]]
		matchs.forEach (el, index)->
			cateName = "basket"
			switch el.cateId
				when "1" then cateName = "football"
				when "2" then cateName = "basket" #kanbisai.com这里有bug，除了足球以外的项目都属于basket.htm页面
			status = 0
			switch el.period
				when "比赛前" then status = 0
				when "比赛中" then status = 1
				when "已结束" then status = 2
			time = Date.parseString el.startTime, "yyyy-MM-dd HH:mm:ss"
			time.setHours time.getHours() - time.getTimezoneOffset() / 60 #json.js convert by UTC http://goo.gl/4vCdV3
			item =
				#kanbisaiId: el.matchId
				kanbisaiLink: "http://sports.qq.com/kbsweb/#{cateName}.htm?matchId=#{el.matchId}&competitionId=#{el.competitionId}"
				capString: if el.competitionName is "CBA季后赛" then "CBA" else el.competitionName #后台根据cap判断matchType
				status: status
				teamNameChinese: el.homeName
				teamNameChineseForGuest: el.awayName
				time: time
				point: el.homeGoal
				pointForGuest: el.awayGoal
				quarter: el.quarter
				quarterTime: el.quarterTime

			data.push item
	return data