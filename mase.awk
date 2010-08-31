#!/usr/bin/awk
{
	BBLUE="\033[1;34m";
	BLUE="\033[0;34m";
	BYELLOW="\033[1;33m";
	YELLOW="\033[0;33m";
	BGREEN="\033[1;32m";
	GREEN="\033[0;32m";
	BRED="\033[1;31m";
	RED="\033[0;31m";
	BNORMAL="\033[1;00m";
	NORMAL="\033[00m";
	DELIM=" | ";
	if($7) {
		idmatch=match($8,"^H=");
		split($6, date, "-")
		split("Jan Feb Mar Apr May Jun Jul Aug Sep Nov Dec", month);
		sub(/^0/,"",date[2])
		datedm=$2" "$1;
		datein= BNORMAL $2 " " $1 " "$3" " NORMAL;
		datedeliverydm= date[3] FS month[date[2]];
		if(datedm == datedeliverydm) {
			datedelivery =  $7 NORMAL;
		} else {
			datedelivery = NORMAL date[3] FS month[date[2]] FS $7 NORMAL;
		}
		if(idmatch == 0) {
			messageid=$8;
			if($9 == "<=") {
				from=$10;
				to=substr($0,index($0,"for "));
				sub(/for /, "", to);
				gsub(/ /, ",", to);
				sub(/,$/, "", to);
				print datein DELIM datedelivery DELIM messageid DELIM from DELIM GREEN to NORMAL DELIM;
			} else if ($9 == "=>") {
				reason=match($12, "^R=spam");
				destination=match($13,"^T=spam");
				if(success == 0 && destination == 0) {
					message=BGREEN "OK";
				} else {
					message=BRED "SPAM";
				}
				print datein DELIM datedelivery DELIM messageid DELIM message NORMAL DELIM;
				
			}
		} else {
			sub(/^H=\(/,NORMAL, $8);
			sub(/\)$/, NORMAL,$8);
			sub(/^F=</, NORMAL, $10);
			sub(/>$/, NORMAL, $10);
			sendhost=$8;
			if(match($10, "@")) {
				from=DELIM $10;
			} else {
				from = "";
			}
			error=substr($0,index($0,$11));
			if(match(error, "temporarily")) {
				#error=substr(error,index(error,"rejected:"));
				#sub("rejected: ", "", error);
				error="Unknown recipient";
			} else if (match(error, "verify") || match(error, "rejected")) {
				#error=substr(error,index(error,"\>:"));
				#sub(">:","",error);
				error="Couldn't complete sender verify callout"
			} else {
				error="Some error, view raw log("error")" 
			}
			print datein DELIM datedelivery DELIM sendhost FS $9 from DELIM BRED error NORMAL DELIM;
		}
	} else {
		print $0;
	}
	
}
