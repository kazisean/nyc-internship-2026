#!/bin/bash

# URL of the target website
pitt="https://raw.githubusercontent.com/SimplifyJobs/Summer2026-Internships/dev/README.md"
vansh="https://raw.githubusercontent.com/vanshb03/Summer2026-Internships/refs/heads/dev/README.md"
speedySWE="https://raw.githubusercontent.com/speedyapply/2026-SWE-College-Jobs/refs/heads/main/README.md"
speedyAI="https://raw.githubusercontent.com/speedyapply/2026-AI-College-Jobs/refs/heads/main/README.md"




# Create Readme.md file and write the header
(
echo "# Curated list of Summer 2026 New York Tech Internships"
echo "A fork of [Pitt CSC & Simplify](https://github.com/SimplifyJobs/Summer2026-Internships?tab=readme-ov-file), [cvrve Summer2026-Internships](https://github.com/vanshb03/Summer2026-Internships), [speedyapply swe](https://github.com/speedyapply/2026-SWE-College-Jobs) & [speedyapply AI](https://github.com/speedyapply/2026-AI-College-Jobs)"
echo ""
echo "Use this repository to share and keep track of software, tech, CS, PM, and quant internships for Summer 2026 in New York City."
echo ""
echo "## The List 🚴🏔"
echo "### Legend"
echo " - 🛂 - Does NOT offer Sponsorship"
echo " - 🇺🇸 - Requires U.S. Citizenship"
echo ""
echo "| Company | Role | Location | Application/Link | Date Posted |"
echo "| ------- | ---- | -------- | ---------------- | ----------- |"
curl -s "$pitt" | \
    grep '<tr>' | \
    grep -E '<td>(NYC|NY|New York|[^<]*New York[^<]*)</td>' | \
    sed -e 's#^.*<tr><td>#| #; s#</td><td># | #g; s#</td></tr>.*# |#; s#<strong>##g; s#</strong>##g; s#<div align="center">##g; s#</div>##g'
curl -s "$vansh" | grep -E "NYC|NY|New York" | grep -v "🔒"
curl -s "$speedySWE" | grep -E "NYC|NY|New York"
curl -s "$speedyAI" | grep -E "NYC|NY|New York"
) > Readme.md



# Display a message indicating the completion of the process
echo "NYC application has been written to Readme.md"