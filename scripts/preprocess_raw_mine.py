import sys
import re
import html

for line in sys.stdin:
    if line.strip() == "":
        continue
    else:
        line = line.replace(u'\ufeff', '')
        # Replace HTML entities with corresponding characters
        line = line.replace('&apos;', '&#39;').replace('&quot;', '&#34;')
        # Unescape HTML entities
        line = html.unescape(line)
        # Remove timestamp
        line = re.sub(r'\d{2}:\d{2}:\d{2},\d{3} --> \d{2}:\d{2}:\d{2},\d{3}', '', line)
        # Remove noise characters
        line = re.sub(r'[\[\]\*]', '', line)
        # Remove numbers at the beginning of each line
        line = re.sub(r'^\d+\s', '', line)


        line = " ".join(line.split())
        sys.stdout.write(line + "\n")

