include "xmerl.hrl"

{Doc, _}=xmerl_scan:string("<node>Hello World</node>").

[#xmlText{value=Text}]=xmerl_xpath:string("//node/text()", Doc).

Text.

