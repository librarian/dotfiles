#!/usr/bin/awk
{
idmatch=match($8,"^H=");
if(idmatch == 0) {
	messageid=$8;
	print "Exim-ID: "messageid;
} else {
	sendhost=gsub(/^H=/,var $8);
	print "Send host: "sendhost " "idmatch;
}
}
