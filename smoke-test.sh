#!/usr/bin/env bash

# Oprește execuția dacă apar erori critice
set -e

# Configurații
TARGET_URL="${1:-http://localhost:8088}"
FAILED=0

echo "=================================================="
echo "🧪 [VOLTRONET] Running Smoke Tests & Security Headers Check"
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

# Funcție helper pentru verificarea avansată a headerelor (Cache, Gzip & Securitate)
test_security_and_headers() {
    local path="$1"
    local expected_cache="$2"
    local check_gzip="$3"
    local desc="$4"
    local full_url="${TARGET_URL}${path}"

    echo -n "Validating Headers & Security [${desc}] ... "

    # Preia toate antetele de răspuns trimițând Accept-Encoding: gzip
    local headers
    headers=$(curl -s -I -H "Accept-Encoding: gzip" "${full_url}")

    local cache_control
    cache_control=$(echo "$headers" | grep -i "Cache-Control" | tr -d '\r')

    local content_encoding
    content_encoding=$(echo "$headers" | grep -i "Content-Encoding" | tr -d '\r')

    local x_frame
    x_frame=$(echo "$headers" | grep -i "X-Frame-Options" | tr -d '\r')

    local csp
    csp=$(echo "$headers" | grep -i "Content-Security-Policy" | tr -d '\r')

    local local_fail=0

    # 1. Verificare Cache-Control
    if [[ ! "$cache_control" == *"$expected_cache"* ]]; then
        local_fail=1
    fi

    # 2. Verificare Gzip (opțional)
    if [ "$check_gzip" = true ] && [[ ! "$content_encoding" == *"gzip"* ]]; then
        local_fail=1
    fi

    # 3. Verificare X-Frame-Options (Trebuie să conțină SAMEORIGIN)
    if [[ ! "$x_frame" == *"SAMEORIGIN"* ]]; then
        local_fail=1
    fi

    # 4. Verificare CSP (Trebuie să conțină politica definită)
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

# --- RULARE TESTE ---

# 1. Testează disponibilitatea paginii principale (HTTP 200)
test_endpoint "/" 200 "Homepage Root"

# 2. Validează headerele de cache, gzip și securitate pe pagina principală
test_security_and_headers "/" "no-cache" false "Homepage Security & Cache Policy"

# 3. Testează un fișier inexistent (Trebuie să returneze HTTP 404)
test_endpoint "/fisier-inexistent-12345.html" 404 "Non-existent Route 404"

echo "=================================================="
if [ ${FAILED} -eq 0 ]; then
    echo -e "\e[32m✨ All smoke & security tests passed successfully!\e[0m"
    exit 0
else
    echo -e "\e[31m❌ ${FAILED} test(s) failed.\e[0m"
    exit 1
fi
