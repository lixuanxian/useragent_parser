sub useragent_parser {
	if (req.http.User-Agent) {
		declare local var.uaString STRING;
		set var.uaString = req.http.User-Agent;

		declare local var.uaStringFamily STRING;
		declare local var.uaStringMajor STRING;
		declare local var.uaStringMinor STRING;
		declare local var.uaStringPatch STRING;
		if (var.uaString ~ "(ESPN)[%20| ]+Radio/(\d+)\.(\d+)\.(\d+) CFNetwork") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Antenna)/(\d+) CFNetwork") {
			set var.uaStringFamily = "AntennaPod";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(TopPodcasts)Pro/(\d+) CFNetwork") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MusicDownloader)Lite/(\d+)\.(\d+)\.(\d+) CFNetwork") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(.*)-iPad/(\d+)\.?(\d+)?.?(\d+)?.?(\d+)? CFNetwork") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(.*)-iPhone/(\d+)\.?(\d+)?.?(\d+)?.?(\d+)? CFNetwork") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(.*)/(\d+)\.?(\d+)?.?(\d+)?.?(\d+)? CFNetwork") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(espn\.go)") {
			set var.uaStringFamily = "ESPN";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(espnradio\.com)") {
			set var.uaStringFamily = "ESPN";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "ESPN APP$") {
			set var.uaStringFamily = "ESPN";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(audioboom\.com)") {
			set var.uaStringFamily = "AudioBoom";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ " (Rivo) RHYTHM") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(CFNetwork)(?:/(\d+)\.(\d+)\.?(\d+)?)?") {
			set var.uaStringFamily = "CFNetwork";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Pingdom.com_bot_version_)(\d+)\.(\d+)") {
			set var.uaStringFamily = "PingdomBot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(PingdomTMS)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "PingdomBot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(NewRelicPinger)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "NewRelicPingerBot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(\(StatusCake\))") {
			set var.uaStringFamily = "StatusCakeBot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(facebookexternalhit)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "FacebookBot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Google.*/\+/web/snippet") {
			set var.uaStringFamily = "GooglePlusBot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "via ggpht.com GoogleImageProxy") {
			set var.uaStringFamily = "GmailImageProxy";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Twitterbot)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "TwitterBot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "/((?:Ant-)?Nutch|[A-z]+[Bb]ot|[A-z]+[Ss]pider|Axtaris|fetchurl|Isara|ShopSalad|Tailsweep)[ \-](\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "\b(008|Altresium|Argus|BaiduMobaider|BoardReader|DNSGroup|DataparkSearch|EDI|Goodzer|Grub|INGRID|Infohelfer|LinkedInBot|LOOQ|Nutch|PathDefender|Peew|PostPost|Steeler|Twitterbot|VSE|WebCrunch|WebZIP|Y!J-BR[A-Z]|YahooSeeker|envolk|sproose|wminer)/(\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MSIE) (\d+)\.(\d+)([a-z]\d?)?;.* MSIECrawler") {
			set var.uaStringFamily = "MSIECrawler";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(DAVdroid)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Google-HTTP-Java-Client|Apache-HttpClient|http%20client|Python-urllib|HttpMonitor|TLSProber|WinHTTP|JNLP|okhttp)(?:[ /](\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Pinterest(?:bot)?)/(\d+)(?:\.(\d+)(?:\.(\d+))?)?[;\s\(]+\+https://www.pinterest.com/bot.html") {
			set var.uaStringFamily = "Pinterestbot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(1470\.net crawler|50\.nu|8bo Crawler Bot|Aboundex|Accoona-[A-z]+-Agent|AdsBot-Google(?:-[a-z]+)?|altavista|AppEngine-Google|archive.*?\.org_bot|archiver|Ask Jeeves|[Bb]ai[Dd]u[Ss]pider(?:-[A-Za-z]+)*|bingbot|BingPreview|blitzbot|BlogBridge|Bloglovin|BoardReader(?: [A-Za-z]+)*|boitho.com-dc|BotSeer|\b\w*favicon\w*\b|\bYeti(?:-[a-z]+)?|Catchpoint(?: bot)?|[Cc]harlotte|Checklinks|clumboot|Comodo HTTP\(S\) Crawler|Comodo-Webinspector-Crawler|ConveraCrawler|CRAWL-E|CrawlConvera|Daumoa(?:-feedfetcher)?|Feed Seeker Bot|Feedbin|findlinks|Flamingo_SearchEngine|FollowSite Bot|furlbot|Genieo|gigabot|GomezAgent|gonzo1|(?:[a-zA-Z]+-)?Googlebot(?:-[a-zA-Z]+)?|Google SketchUp|grub-client|gsa-crawler|heritrix|HiddenMarket|holmes|HooWWWer|htdig|ia_archiver|ICC-Crawler|Icarus6j|ichiro(?:/mobile)?|IconSurf|IlTrovatore(?:-Setaccio)?|InfuzApp|Innovazion Crawler|InternetArchive|IP2[a-z]+Bot|jbot\b|KaloogaBot|Kraken|Kurzor|larbin|LEIA|LesnikBot|Linguee Bot|LinkAider|LinkedInBot|Lite Bot|Llaut|lycos|Mail\.RU_Bot|masscan|masidani_bot|Mediapartners-Google|Microsoft .*? Bot|mogimogi|mozDex|MJ12bot|msnbot(?:-media *)?|msrbot|Mtps Feed Aggregation System|netresearch|Netvibes|NewsGator[^/]*|^NING|Nutch[^/]*|Nymesis|ObjectsSearch|Orbiter|OOZBOT|PagePeeker|PagesInventory|PaxleFramework|Peeplo Screenshot Bot|PlantyNet_WebRobot|Pompos|Qwantify|Read%20Later|Reaper|RedCarpet|Retreiver|Riddler|Rival IQ|scooter|Scrapy|Scrubby|searchsight|seekbot|semanticdiscovery|Simpy|SimplePie|SEOstats|SimpleRSS|SiteCon|Slackbot-LinkExpanding|Slack-ImgProxy|Slurp|snappy|Speedy Spider|Squrl Java|Stringer|TheUsefulbot|ThumbShotsBot|Thumbshots\.ru|Tiny Tiny RSS|TwitterBot|WhatsApp|URL2PNG|Vagabondo|VoilaBot|^vortex|Votay bot|^voyager|WASALive.Bot|Web-sniffer|WebThumb|WeSEE:[A-z]+|WhatWeb|WIRE|WordPress|Wotbox|www\.almaden\.ibm\.com|Xenu(?:.s)? Link Sleuth|Xerka [A-z]+Bot|yacy(?:bot)?|Yahoo[a-z]*Seeker|Yahoo! Slurp|Yandex\w+|YodaoBot(?:-[A-z]+)?|YottaaMonitor|Yowedo|^Zao|^Zao-Crawler|ZeBot_www\.ze\.bz|ZooShot|ZyBorg)(?:[ /]v?(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(?:\/[A-Za-z0-9\.]+)? *([A-Za-z0-9 \-_\!\[\]:]*(?:[Aa]rchiver|[Ii]ndexer|[Ss]craper|[Bb]ot|[Ss]pider|[Cc]rawl[a-z]*))/(\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(?:\/[A-Za-z0-9\.]+)? *([A-Za-z0-9 _\!\[\]:]*(?:[Aa]rchiver|[Ii]ndexer|[Ss]craper|[Bb]ot|[Ss]pider|[Cc]rawl[a-z]*)) (\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "((?:[A-z0-9]+|[A-z\-]+ ?)?(?: the )?(?:[Ss][Pp][Ii][Dd][Ee][Rr]|[Ss]crape|[A-Za-z0-9-]*(?:[^C][^Uu])[Bb]ot|[Cc][Rr][Aa][Ww][Ll])[A-z0-9]*)(?:(?:[ /]| v)(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(HbbTV)/(\d+)\.(\d+)\.(\d+) \(") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Chimera|SeaMonkey|Camino)/(\d+)\.(\d+)\.?([ab]?\d+[a-z]*)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "\[FB.*;(FBAV)/(\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
			set var.uaStringFamily = "Facebook";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "\[(Pinterest)/[^\]]+\]") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Pinterest)(?: for Android(?: Tablet)?)?/(\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(PaleMoon)/(\d+)\.(\d+)\.?(\d+)?") {
			set var.uaStringFamily = "Pale Moon";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Fennec)/(\d+)\.(\d+)\.?([ab]?\d+[a-z]*)") {
			set var.uaStringFamily = "Firefox Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Fennec)/(\d+)\.(\d+)(pre)") {
			set var.uaStringFamily = "Firefox Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Fennec)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Firefox Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(?:Mobile|Tablet);.*(Firefox)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Firefox Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Namoroka|Shiretoko|Minefield)/(\d+)\.(\d+)\.(\d+(?:pre)?)") {
			set var.uaStringFamily = "Firefox ($1)";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox)/(\d+)\.(\d+)(a\d+[a-z]*)") {
			set var.uaStringFamily = "Firefox Alpha";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox)/(\d+)\.(\d+)(b\d+[a-z]*)") {
			set var.uaStringFamily = "Firefox Beta";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox)-(?:\d+\.\d+)?/(\d+)\.(\d+)(a\d+[a-z]*)") {
			set var.uaStringFamily = "Firefox Alpha";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox)-(?:\d+\.\d+)?/(\d+)\.(\d+)(b\d+[a-z]*)") {
			set var.uaStringFamily = "Firefox Beta";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Namoroka|Shiretoko|Minefield)/(\d+)\.(\d+)([ab]\d+[a-z]*)?") {
			set var.uaStringFamily = "Firefox ($1)";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox).*Tablet browser (\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "MicroB";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MozillaDeveloperPreview)/(\d+)\.(\d+)([ab]\d+[a-z]*)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(FxiOS)/(\d+)\.(\d+)(\.(\d+))?(\.(\d+))?") {
			set var.uaStringFamily = "Firefox iOS";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Flock)/(\d+)\.(\d+)(b\d+?)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(RockMelt)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Navigator)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Netscape";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Navigator)/(\d+)\.(\d+)([ab]\d+)") {
			set var.uaStringFamily = "Netscape";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Netscape6)/(\d+)\.(\d+)\.?([ab]?\d+)?") {
			set var.uaStringFamily = "Netscape";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MyIBrow)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "My Internet Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(UC? ?Browser|UCWEB|U3)[ /]?(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "UC Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Opera Tablet).*Version/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Opera Mini)(?:/att)?/?(\d+)?(?:\.(\d+))?(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Opera)/.+Opera Mobi.+Version/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Opera Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Opera)/(\d+)\.(\d+).+Opera Mobi") {
			set var.uaStringFamily = "Opera Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Opera Mobi.+(Opera)(?:/|\s+)(\d+)\.(\d+)") {
			set var.uaStringFamily = "Opera Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Opera Mobi") {
			set var.uaStringFamily = "Opera Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Opera)/9.80.*Version/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(?:Mobile Safari).*(OPR)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Opera Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(?:Chrome).*(OPR)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Opera";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Coast)/(\d+).(\d+).(\d+)") {
			set var.uaStringFamily = "Opera Coast";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(OPiOS)/(\d+).(\d+).(\d+)") {
			set var.uaStringFamily = "Opera Mini";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Chrome/.+( MMS)/(\d+).(\d+).(\d+)") {
			set var.uaStringFamily = "Opera Neon";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(hpw|web)OS/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = "webOS Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(luakit)") {
			set var.uaStringFamily = "LuaKit";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Snowshoe)/(\d+)\.(\d+).(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Gecko/\d+ (Lightning)/(\d+)\.(\d+)\.?((?:[ab]?\d+[a-z]*)|(?:\d*))") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox)/(\d+)\.(\d+)\.(\d+(?:pre)?) \(Swiftfox\)") {
			set var.uaStringFamily = "Swiftfox";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox)/(\d+)\.(\d+)([ab]\d+[a-z]*)? \(Swiftfox\)") {
			set var.uaStringFamily = "Swiftfox";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(rekonq)/(\d+)\.(\d+)\.?(\d+)? Safari") {
			set var.uaStringFamily = "Rekonq";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "rekonq") {
			set var.uaStringFamily = "Rekonq";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(conkeror|Conkeror)/(\d+)\.(\d+)\.?(\d+)?") {
			set var.uaStringFamily = "Conkeror";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(konqueror)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Konqueror";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(WeTab)-Browser") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Comodo_Dragon)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Comodo Dragon";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Symphony) (\d+).(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "PLAYSTATION 3.+WebKit") {
			set var.uaStringFamily = "NetFront NX";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "PLAYSTATION 3") {
			set var.uaStringFamily = "NetFront";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(PlayStation Portable)") {
			set var.uaStringFamily = "NetFront";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(PlayStation Vita)") {
			set var.uaStringFamily = "NetFront NX";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "AppleWebKit.+ (NX)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "NetFront NX";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Nintendo 3DS)") {
			set var.uaStringFamily = "NetFront NX";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Silk)/(\d+)\.(\d+)(?:\.([0-9\-]+))?") {
			set var.uaStringFamily = "Amazon Silk";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Puffin)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Windows Phone .*(Edge)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Edge Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(SamsungBrowser)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Samsung Internet";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(SznProhlizec)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = "Seznam.cz";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(coc_coc_browser)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = "Coc Coc";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(baidubrowser)[/\s](\d+)(?:\.(\d+)(?:\.(\d+))?)?") {
			set var.uaStringFamily = "Baidu Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(FlyFlow)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Baidu Explorer";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MxBrowser)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = "Maxthon";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Crosswalk)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "; wv\).+(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Chrome Mobile WebView";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(CrMo)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Chrome Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(CriOS)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Chrome Mobile iOS";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+) Mobile(?:[ /]|$)") {
			set var.uaStringFamily = "Chrome Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ " Mobile .*(Chrome)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Chrome Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(chromeframe)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Chrome Frame";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(SLP Browser)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Tizen Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(SE 2\.X) MetaSr (\d+)\.(\d+)") {
			set var.uaStringFamily = "Sogou Explorer";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MQQBrowser/Mini)(?:(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
			set var.uaStringFamily = "QQ Browser Mini";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MQQBrowser)(?:/(\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
			set var.uaStringFamily = "QQ Browser Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(QQBrowser)(?:/(\d+)(?:\.(\d+)\.(\d+)(?:\.(\d+))?)?)?") {
			set var.uaStringFamily = "QQ Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Rackspace Monitoring)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "RackspaceBot";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(PyAMF)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(YaBrowser)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Yandex Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Chrome)/(\d+)\.(\d+)\.(\d+).* MRCHROME") {
			set var.uaStringFamily = "Mail.ru Chromium Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(AOL) (\d+)\.(\d+); AOLBuild (\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(PodCruncher|Downcast)[ /]?(\d+)\.?(\d+)?\.?(\d+)?\.?(\d+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ " (BoxNotes)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Slack_SSB)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Slack Desktop Client";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(HipChat)/?(\d+)?") {
			set var.uaStringFamily = "HipChat Desktop Client";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "\b(MobileIron|FireWeb|Jasmine|ANTGalio|Midori|Fresco|Lobo|PaleMoon|Maxthon|Lynx|OmniWeb|Dillo|Camino|Demeter|Fluid|Fennec|Epiphany|Shiira|Sunrise|Spotify|Flock|Netscape|Lunascape|WebPilot|NetFront|Netfront|Konqueror|SeaMonkey|Kazehakase|Vienna|Iceape|Iceweasel|IceWeasel|Iron|K-Meleon|Sleipnir|Galeon|GranParadiso|Opera Mini|iCab|NetNewsWire|ThunderBrowse|Iris|UP\.Browser|Bunjalloo|Google Earth|Raven for Mac|Openwave|MacOutlook|Electron)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Microsoft Office Outlook 12\.\d+\.\d+|MSOffice 12") {
			set var.uaStringFamily = "Outlook";
			set var.uaStringMajor = "2007";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Microsoft Outlook 14\.\d+\.\d+|MSOffice 14") {
			set var.uaStringFamily = "Outlook";
			set var.uaStringMajor = "2010";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Microsoft Outlook 15\.\d+\.\d+") {
			set var.uaStringFamily = "Outlook";
			set var.uaStringMajor = "2013";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Microsoft Outlook (?:Mail )?16\.\d+\.\d+") {
			set var.uaStringFamily = "Outlook";
			set var.uaStringMajor = "2016";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "Outlook-Express\/7\.0.*") {
			set var.uaStringFamily = "Windows Live Mail";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Airmail) (\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Thunderbird)/(\d+)\.(\d+)(?:\.(\d+(?:pre)?))?") {
			set var.uaStringFamily = "Thunderbird";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Postbox)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Postbox";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Barca(?:Pro)?)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = "Barca";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Lotus-Notes)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = "Lotus Notes";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Vivaldi)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Edge)/(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(brave)/(\d+)\.(\d+)\.(\d+) Chrome") {
			set var.uaStringFamily = "Brave";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Chrome)/(\d+)\.(\d+)\.(\d+)[\d.]* Iron[^/]") {
			set var.uaStringFamily = "Iron";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "\b(Dolphin)(?: |HDCN/|/INT\-)(\d+)\.(\d+)\.?(\d+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(HeadlessChrome)(?:/(\d+)\.(\d+)\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Evolution)/(\d+)\.(\d+)\.(\d+\.\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(RCM CardDAV plugin)/(\d+)\.(\d+)\.(\d+(?:-dev)?)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(bingbot|Bolt|AdobeAIR|Jasmine|IceCat|Skyfire|Midori|Maxthon|Lynx|Arora|IBrowse|Dillo|Camino|Shiira|Fennec|Phoenix|Flock|Netscape|Lunascape|Epiphany|WebPilot|Opera Mini|Opera|NetFront|Netfront|Konqueror|Googlebot|SeaMonkey|Kazehakase|Vienna|Iceape|Iceweasel|IceWeasel|Iron|K-Meleon|Sleipnir|Galeon|GranParadiso|iCab|iTunes|MacAppStore|NetNewsWire|Space Bison|Stainless|Orca|Dolfin|BOLT|Minimo|Tizen Browser|Polaris|Abrowser|Planetweb|ICE Browser|mDolphin|qutebrowser|Otter|QupZilla|MailBar|kmail2|YahooMobileMail|ExchangeWebServices|ExchangeServicesClient|Dragon|Outlook-iOS-Android)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Chromium|Chrome)/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(IEMobile)[ /](\d+)\.(\d+)") {
			set var.uaStringFamily = "IE Mobile";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(BacaBerita App)\/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(bPod|Pocket Casts|Player FM)$") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(AlexaMediaPlayer|VLC)/(\d+)\.(\d+)\.([^.\s]+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(AntennaPod|WMPlayer|Zune|Podkicker|Radio|ExoPlayerDemo|Overcast|PocketTunes|NSPlayer|okhttp|DoggCatcher|QuickNews|QuickTime|Peapod|Podcasts|GoldenPod|VLC|Spotify|Miro|MediaGo|Juice|iPodder|gPodder|Banshee)/(\d+)\.(\d+)\.?(\d+)?\.?(\d+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Peapod|Liferea)/([^.\s]+)\.([^.\s]+)?\.?([^.\s]+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(bPod|Player FM) BMID/(\S+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Podcast ?Addict)/v(\d+) ") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Podcast ?Addict) ") {
			set var.uaStringFamily = "PodcastAddict";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Replay) AV") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(VOX) Music Player") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(CITA) RSS Aggregator/(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Pocket Casts)$") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Player FM)$") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(LG Player|Doppler|FancyMusic|MediaMonkey|Clementine) (\d+)\.(\d+)\.?([^.\s]+)?\.?([^.\s]+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(philpodder)/(\d+)\.(\d+)\.?([^.\s]+)?\.?([^.\s]+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Player FM|Pocket Casts|DoggCatcher|Spotify|MediaMonkey|MediaGo|BashPodder)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(QuickTime)\.(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Kinoma)(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Fancy) Cloud Music (\d+)\.(\d+)") {
			set var.uaStringFamily = "FancyMusic";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "EspnDownloadManager") {
			set var.uaStringFamily = "ESPN";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(ESPN) Radio (\d+)\.(\d+)\.?(\d+)? ?[rv:]?(\d+)? ") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(podracer|jPodder) v ?(\d+)\.(\d+)\.?(\d+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(ZDM)/(\d+)\.(\d+)[; ]?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Zune|BeyondPod) (\d+)\.?(\d+)?[\);]") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(WMPlayer)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Lavf)") {
			set var.uaStringFamily = "WMPlayer";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(RSSRadio)[ /]?(\d+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(RSS_Radio) (\d+)\.(\d+)") {
			set var.uaStringFamily = "RSSRadio";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Podkicker) \S+/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Podkicker";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(HTC) Streaming Player \S+ / \S+ / \S+ / (\d+)\.(\d+)\.?(\d+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Stitcher)/iOS") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Stitcher)/Android") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(VLC) .*version (\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ " (VLC) for") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(vlc)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "VLC";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(foobar)\S+/([^.\s]+)\.([^.\s]+)?\.?([^.\s]+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Clementine)\S+ ([^.\s]+)\.([^.\s]+)?\.?([^.\s]+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(amarok)/([^.\s]+)\.([^.\s]+)?\.?([^.\s]+)?") {
			set var.uaStringFamily = "Amarok";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Custom)-Feed Reader") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iRider|Crazy Browser|SkipStone|iCab|Lunascape|Sleipnir|Maemo Browser) (\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iCab|Lunascape|Opera|Android|Jasmine|Polaris|Microsoft SkyDriveSync|The Bat!) (\d+)\.(\d+)\.?(\d+)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Kindle)/(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Android) Donut") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "1";
			set var.uaStringMinor = "2";
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Android) Eclair") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "2";
			set var.uaStringMinor = "1";
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Android) Froyo") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "2";
			set var.uaStringMinor = "2";
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Android) Gingerbread") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "2";
			set var.uaStringMinor = "3";
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Android) Honeycomb") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "3";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MSIE) (\d+)\.(\d+).*XBLWP7") {
			set var.uaStringFamily = "IE Large Screen";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Nextcloud)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(mirall)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(ownCloud-android)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Owncloud";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Obigo)InternetBrowser") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Obigo)\-Browser") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Obigo|OBIGO)[^\d]*(\d+)(?:.(\d+))?") {
			set var.uaStringFamily = "Obigo";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(MAXTHON|Maxthon) (\d+)\.(\d+)") {
			set var.uaStringFamily = "Maxthon";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Maxthon|MyIE2|Uzbl|Shiira)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "0";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(BrowseX) \((\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(NCSA_Mosaic)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "NCSA Mosaic";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(POLARIS)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Polaris";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Embider)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Polaris";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(BonEcho)/(\d+)\.(\d+)\.?([ab]?\d+)?") {
			set var.uaStringFamily = "Bon Echo";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iPod|iPhone|iPad).+Version/(\d+)\.(\d+)(?:\.(\d+))?.*[ +]Safari") {
			set var.uaStringFamily = "Mobile Safari";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iPod|iPod touch|iPhone|iPad);.*CPU.*OS[ +](\d+)_(\d+)(?:_(\d+))?.* AppleNews\/\d+\.\d+\.\d+?") {
			set var.uaStringFamily = "Mobile Safari UI/WKWebView";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iPod|iPhone|iPad).+Version/(\d+)\.(\d+)(?:\.(\d+))?") {
			set var.uaStringFamily = "Mobile Safari UI/WKWebView";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iPod|iPod touch|iPhone|iPad);.*CPU.*OS[ +](\d+)_(\d+)(?:_(\d+))?.*Mobile.*[ +]Safari") {
			set var.uaStringFamily = "Mobile Safari";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iPod|iPod touch|iPhone|iPad);.*CPU.*OS[ +](\d+)_(\d+)(?:_(\d+))?.*Mobile") {
			set var.uaStringFamily = "Mobile Safari UI/WKWebView";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iPod|iPhone|iPad).* Safari") {
			set var.uaStringFamily = "Mobile Safari";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(iPod|iPhone|iPad)") {
			set var.uaStringFamily = "Mobile Safari UI/WKWebView";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(AvantGo) (\d+).(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(OneBrowser)/(\d+).(\d+)") {
			set var.uaStringFamily = "ONE Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Avant)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "1";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(QtCarBrowser)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "1";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(iBrowser/Mini)(\d+).(\d+)") {
			set var.uaStringFamily = "iBrowser Mini";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(iBrowser|iRAPP)/(\d+).(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Nokia)") {
			set var.uaStringFamily = "Nokia Services (WAP) Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(NokiaBrowser)/(\d+)\.(\d+).(\d+)\.(\d+)") {
			set var.uaStringFamily = "Nokia Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(NokiaBrowser)/(\d+)\.(\d+).(\d+)") {
			set var.uaStringFamily = "Nokia Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(NokiaBrowser)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Nokia Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(BrowserNG)/(\d+)\.(\d+).(\d+)") {
			set var.uaStringFamily = "Nokia Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Series60)/5\.0") {
			set var.uaStringFamily = "Nokia Browser";
			set var.uaStringMajor = "7";
			set var.uaStringMinor = "0";
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Series60)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Nokia OSS Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(S40OviBrowser)/(\d+)\.(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Ovi Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Nokia)[EN]?(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(PlayBook).+RIM Tablet OS (\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "BlackBerry WebKit";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Black[bB]erry|BB10).+Version/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "BlackBerry WebKit";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Black[bB]erry)\s?(\d+)") {
			set var.uaStringFamily = "BlackBerry";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(OmniWeb)/v(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Blazer)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Palm Blazer";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Pre)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Palm Pre";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(ELinks)/(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(ELinks) \((\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Links) \((\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(QtWeb) Internet Browser/(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(PhantomJS)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(AppleWebKit)/(\d+)\.?(\d+)?\+ .* Safari") {
			set var.uaStringFamily = "WebKit Nightly";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Version)/(\d+)\.(\d+)(?:\.(\d+))?.*Safari/") {
			set var.uaStringFamily = "Safari";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Safari)/\d+") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(OLPC)/Update(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(OLPC)/Update()\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = "0";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(SEMC\-Browser)/(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Teleca)") {
			set var.uaStringFamily = "Teleca Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Phantom)/V(\d+)\.(\d+)") {
			set var.uaStringFamily = "Phantom Browser";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Trident)/(7)\.(0)") {
			set var.uaStringFamily = "IE";
			set var.uaStringMajor = "11";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Trident)/(6)\.(0)") {
			set var.uaStringFamily = "IE";
			set var.uaStringMajor = "10";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Trident)/(5)\.(0)") {
			set var.uaStringFamily = "IE";
			set var.uaStringMajor = "9";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Trident)/(4)\.(0)") {
			set var.uaStringFamily = "IE";
			set var.uaStringMajor = "8";
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Espial)/(\d+)(?:\.(\d+))?(?:\.(\d+))?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(AppleWebKit)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Apple Mail";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Firefox)/(\d+)\.(\d+)(pre|[ab]\d+[a-z]*)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "([MS]?IE) (\d+)\.(\d+)") {
			set var.uaStringFamily = "IE";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(python-requests)/(\d+)\.(\d+)") {
			set var.uaStringFamily = "Python Requests";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "\b(Windows-Update-Agent|Microsoft-CryptoAPI|SophosUpdateManager|SophosAgent|Debian APT-HTTP|Ubuntu APT-HTTP|libcurl-agent|libwww-perl|urlgrabber|curl|Wget|OpenBSD ftp|jupdate)(?:[ /](\d+)(?:\.(\d+)(?:\.(\d+))?)?)?") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Java)[/ ]{0,1}\d+\.(\d+)\.(\d+)[_-]*([a-zA-Z0-9]+)*") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Roku)/DVP-(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "(Kurio)\/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = "Kurio App";
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		} elsif (var.uaString ~ "^(Box(?: Sync)?)/(\d+)\.(\d+)\.(\d+)") {
			set var.uaStringFamily = if (re.group.1, re.group.1, "0");
			set var.uaStringMajor = if (re.group.2, re.group.2, "0");
			set var.uaStringMinor = if (re.group.3, re.group.3, "0");
			set var.uaStringPatch = if (re.group.4, re.group.4, "0");
		}
		set req.http.useragent_parser_family = var.uaStringFamily;
		set req.http.useragent_parser_major = var.uaStringMajor;
		set req.http.useragent_parser_minor = var.uaStringMinor;
		set req.http.useragent_parser_patch = var.uaStringPatch;
	}
}