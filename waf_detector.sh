#!/data/data/com.termux/files/usr/bin/bash

clear


#color
y="\e[1;33m"
r="\e[1;31m"
b="\e[1;34m"
pink='\033[1;35m'
GREEN='\033[1;32m'

# Banner
echo -e "${r}"
echo "  ██████╗██╗   ██╗██████╗ ███████╗██████╗ "
echo " ██╔════╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗"
echo " ██║      ╚████╔╝ ██████╔╝█████╗  ██████╔╝"
echo " ██║       ╚██╔╝  ██╔══██╗██╔══╝  ██╔══██╗"
echo " ╚██████╗   ██║   ██████╔╝███████╗██║  ██║"
echo "  ╚═════╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝"

echo -e "${r}"
echo " ███████╗ ██████╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ ███████╗"
echo " ██╔════╝██╔════╝██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗██╔════╝"
echo " ███████╗██║     ███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝███████╗"
echo " ╚════██║██║     ██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗╚════██║"
echo " ███████║╚██████╗██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║███████║"
echo " ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝"

echo -e "${b}"
echo " ██╗    ██╗ █████╗ ███████╗    ██████╗ ███████╗████████╗███████╗ ██████╗████████╗ ██████╗ ██████╗"
echo " ██║    ██║██╔══██╗██╔════╝    ██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗"
echo " ██║ █╗ ██║███████║█████╗█████╗██║  ██║█████╗     ██║   █████╗  ██║        ██║   ██║   ██║██████╔╝"
echo " ██║███╗██║██╔══██║██╔══╝╚════╝██║  ██║██╔══╝     ██║   ██╔══╝  ██║        ██║   ██║   ██║██╔══██╗"
echo " ╚███╔███╔╝██║  ██║██║         ██████╔╝███████╗   ██║   ███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║"
echo "  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝         ╚═════╝ ╚══════╝   ╚═╝   ╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝"

echo -e "${GREEN}                                > DEVALOPER CYBER BLACK LION! <<${NC}"

termux-open-url https://chat.whatsapp.com/HlH3EfeFlar5Fy1YCieMKJ

#!/bin/bash

# Set password
PASSWORD="cyber2002"

# Ask for password
echo -n "Enter password: "
read -s user_input
echo ""

# Check password
if [ "$user_input" == "$PASSWORD" ]; then
    echo "Access granted."
    
    # Place your tool code here
    echo "Running your Termux tool..."
    
    # Example: echo "Hello from your tool!"
    
else
    echo "Access denied. Incorrect password."
    exit 1
fi

echo "Enter website URL (e.g. https://example.com):"
read url

# Check for curl
if ! command -v curl &> /dev/null; then
    echo "Installing curl..."
    pkg install -y curl
fi

# Define test payloads
payloads=(
  "' OR '1'='1"
  "<script>alert(1)</script>"
  "../../etc/passwd"
  "'; DROP TABLE users; --"
  "`cat /etc/passwd`"
)

# Define suspicious keywords in responses
waf_keywords=("access denied" "request blocked" "forbidden" "waf" "security violation" "malicious request")

# Loop through payloads and test
echo -e "\n--- Starting WAF Deep Detection ---"
for payload in "${payloads[@]}"; do
    echo -e "\n[*] Testing payload: $payload"

    # Test with User-Agent
    body=$(curl -s -A "$payload" "$url")

    # Check for suspicious keywords
    hit="no"
    for keyword in "${waf_keywords[@]}"; do
        if echo "$body" | grep -iq "$keyword"; then
            echo "[!] WAF keyword detected in response: \"$keyword\""
            hit="yes"
        fi
    done

    # Also print status code
    code=$(curl -s -o /dev/null -w "%{http_code}" -A "$payload" "$url")
    echo "HTTP Code: $code"

    if [[ "$hit" == "no" && "$code" == "200" ]]; then
        echo "No WAF signature detected with this payload."
    fi
done

echo -e "\n--- Scan Complete ---"
