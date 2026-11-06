#!/usr/bin/env bash

# Oprește execuția dacă apar erori critice
set -e

# Configurații
TARGET_URL="${1:-http://localhost:8088}"
FAILED=0

echo "=================================================="
echo "🧪 [VOLTRONET] Running Comprehensive Smoke & Asset Tests"
echo "=================================================="

# Funcție helper pentru testare endpoint-uri (status HTTP)
test_endpoint() {
    local path="$1"
    local expected_status="$2"
    local desc="$3"
    local full_url="${TARGET_URL}${path}"

    echo -n "Checking [${desc}] (${path}) ... "
    
    local status
    status=$(curl -s -o /dev/null -w "%{http_code}" "${full_url}")

    if [ "${status}" -eq "${expected_status}" ]; then
        echo -e "\e[32m[OK]\e[0m Status: ${status}"
    else
        echo -e "\e[31m[FAIL]\e[0m Expected ${expected_status}, got ${status}"
        FAILED=$((FAILED + 1))
    fi
}

# Funcție helper pentru validarea avansată a paginii principale (HTML)
test_security_and_headers() {
    local path="$1"
    local expected_cache="$2"
    local desc="$3"
    local full_url="${TARGET_URL}${path}"

    echo -n "Validating HTML Headers & Security [${desc}] ... "

    local headers
    headers=$(curl -s -I "${full_url}")

    local cache_control
    cache_control=$(echo "$headers" | grep -i "Cache-Control" | tr -d '\r')

    local x_frame
    x_frame=$(echo "$headers" | grep -i "X-Frame-Options" | tr -d '\r')

    local csp
    csp=$(echo "$headers" | grep -i "Content-Security-Policy" | tr -d '\r')

    local local_fail=0

    if [[ ! "$cache_control" == *"$expected_cache"* ]]; then
        local_fail=1
    fi

    if [[ ! "$x_frame" == *"SAMEORIGIN"* ]]; then
        local_fail=1
    fi

    if [[ ! "$csp" == *"default-src"* ]]; then
        local_fail=1
    fi

    if [ $local_fail -eq 0 ]; then
        echo -e "\e[32m[PASS]\e[0m (Cache: OK | Securitate X-Frame & CSP: OK)"
    else
        echo -e "\e[31m[FAIL]\e[0m"
        echo "   -> Cache-Control (Expected: $expected_cache) | Got: $cache_control"
        echo "   -> X-Frame-Options (Expected: SAMEORIGIN) | Got: $x_frame"
        echo "   -> Content-Security-Policy (Expected present) | Got: $csp"
        FAILED=$((FAILED + 1))
    fi
}

# Funcție helper specifică pentru resurse statice (/assets/css sau /assets/js)
test_asset_file() {
    local path="$1"
    local desc="$2"
    local full_url="${TARGET_URL}${path}"

    echo -n "Validating Asset File [${desc}] (${path}) ... "

    local headers
    headers=$(curl -s -I -H "Accept-Encoding: gzip" "${full_url}")

    local status
    status=$(curl -s -o /dev/null -w "%{http_code}" "${full_url}")

    local cache_control
    cache_control=$(echo "$headers" | grep -i "Cache-Control" | tr -d '\r')

    local content_encoding
    content_encoding=$(echo "$headers" | grep -i "Content-Encoding" | tr -d '\r')

    local local_fail=0

    # 1. Statusul trebuie să fie 200 OK
    if [ "${status}" -ne 200 ]; then
        local_fail=1
    fi

    # 2. Cache-ul trebuie să fie imuabil (public, immutable)
    if [[ ! "$cache_control" == *"public"* ]] || [[ ! "$cache_control" == *"immutable"* ]]; then
        local_fail=1
    fi

    # 3. Compresia Gzip trebuie să fie activă pentru CSS/JS
    if [[ ! "$content_encoding" == *"gzip"* ]]; then
        local_fail=1
    fi

    if [ $local_fail -eq 0 ]; then
        echo -e "\e[32m[PASS]\e[0m (Status 200 | Immutable Cache: OK | Gzip: OK)"
    else
        echo -e "\e[31m[FAIL]\e[0m"
        echo "   -> Status (Expected: 200) | Got: ${status}"
        echo "   -> Cache-Control (Expected: public, immutable) | Got: $cache_control"
        echo "   -> Content-Encoding (Expected: gzip) | Got: $content_encoding"
        FAILED=$((FAILED + 1))
    fi
}

# --- RULARE TESTE ---

# 1. Testează rute de bază HTTP
test_endpoint "/" 200 "Homepage Root"
test_security_and_headers "/" "no-cache" "Homepage Security & Cache Policy"

# 2. Testează explicit fișierele statice din /assets
test_asset_file "/assets/css/main.css" "CSS Stylesheet Asset"
test_asset_file "/assets/js/app.js" "JavaScript Localization Asset"

# 3. Testează o rută inexistentă (404)
test_endpoint "/fisier-inexistent-12345.html" 404 "Non-existent Route 404"

echo "=================================================="
if [ ${FAILED} -eq 0 ]; then
    echo -e "\e[32m✨ All smoke, asset & security tests passed successfully!\e[0m"
    exit 0
else
    echo -e "\e[31m❌ ${FAILED} test(s) failed.\e[0m"
    exit 1
fi
