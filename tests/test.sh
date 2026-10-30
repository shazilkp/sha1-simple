#!/bin/sh

repeat_a() {
    head -c "$1" /dev/zero | tr '\0' 'a'
}

check() {
    expected=$(printf "%s" "$1" | sha1sum | cut -d' ' -f1)
    actual=$(printf "%s" "$1" | ./sha1tool)
    if [ "$expected" = "$actual" ]; then
        echo "ok   (len ${#1})"
    else
        echo "FAIL (len ${#1}): expected $expected, got $actual"
    fi
}

check ""
check "abc"
check "$(repeat_a 55)"
check "$(repeat_a 56)"
check "$(repeat_a 64)"