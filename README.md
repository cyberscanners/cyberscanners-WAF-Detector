# cyberscanners-WAF-Detector

# 𝐂𝐘𝐁𝐄𝐑 𝐒𝐂𝐀𝐍𝐍𝐄𝐑𝐒 𝐇𝐀𝐂𝐊𝐈𝐍𝐆 𝐓𝐄𝐑𝐌𝐔𝐗 𝐖𝐀𝐅-𝐃𝐄𝐓𝐄𝐂𝐓𝐎𝐑.ᴘᴄ ᴏʀ ᴍᴏʙɪʟᴇ

TERMUX INSTALL

$ pkg update && pkg upgrade

$ pkg install -y curl

$ pkg install git

$ git clone https://github.com/cyberscanners/cyberscanners-WAF-Detector.git

$ cd cyberscanners-WAF-Detector

$ bash waf_detector.sh


මේකෙන් වෙන්නෙ මොකක්ද?

* WAF test payloads 5ක් define කරනවා:

1) SQL injection (' OR '1'='1)

2) XSS (<script>alert(1)</script>)

3) LFI (../../etc/passwd)

4) SQL Drop ('; DROP TABLE users; --)

5) Command injection (\cat /etc/passwd``)

* Response එකෙන් මාරු වෙච්ච body එක read කරනවා.

* ඒ body එකේ තියෙනවද කියලා බලනවා මෙවගේ WAF-related keywords:

• access denied

• request blocked

• forbidden

• waf

• security violation

• malicious request

* එක keyword එකක් match වෙන්නෙ නම්:

[!] WAF keyword detected in response: "..."


* HTTP response code (e.g. 403, 200, etc) print කරනවා.

* Keyword එකක්වත් නැත්නම් සහ status code 200 නම්:

No WAF signature detected with this payload.

* Payload එකකට WAF block කරේද කියලා හොඳ indication එකක් ලැබෙනවා.

* Body-based keyword detection එක නිසා HTTP code එකක් 200 වෙන්නත් WAF detect කරන්න පුළුවන්.

උදාහරණ Output එක:

[*] Testing payload: ' OR '1'='1

[!] WAF keyword detected in response: "access denied"

HTTP Code: 403



[*] Testing payload: <script>alert(1)</script>

No WAF signature detected with this payload.

HTTP Code: 200

