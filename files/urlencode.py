#!/usr/bin/python3
import urllib.parse
import sys

print(urllib.parse.quote(sys.argv[1], safe=''))
