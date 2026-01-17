if [ -z "$1" ]; then
    echo "Usage: $0 {xor}HASH"
    exit 1
fi

encoded_string=$(echo "$1" | sed 's/^{xor}//')
echo -n "$encoded_string" | base64 -d | perl -pe '$_ ^= "_" x length'
