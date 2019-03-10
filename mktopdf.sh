#!/bin/bash
# 2019-03-10
# This script takes a markdown file as argument and make a .pdf version of it. 
# I made a function in my .zshrc file:
# mkp() { ~/.scripts/mktopdf.sh $1 }
# so I run the command on the filename.md as follows:
# $ mkp filename.md

# If there is no style sheet specified use the default.
style_css='/home/stylesheets/default_pdf.css'
# My css file contains the following:
* { font-family: Loma, Noto, Garuda; }

# If statement which allows usage of another css style sheet
if [ ! -f $style_css ]; then
    echo "Creating new file ./style.css";
    [ $(touch './style.css') ];
else
    echo "Default css file WAS found! Creating pdf...";
fi

orig_markdown=$1
# remove the .md extension
base_name=$(echo "$1" | cut -f 1 -d '.')
html_output=$base_name'.html'
pdf_output=$base_name'.pdf'

echo "Working on it..."

pandoc --from=markdown_mmd+yaml_metadata_block --standalone --to=html -V css=$style_css --output=$html_output $orig_markdown

sleep 1

# I think the wk in the follwing utility stands for webkit. sudo apt install wkhtmltopdf
wkhtmltopdf -B 25mm -T 25mm -L 25mm -R 25mm -q -s A4 $html_output $pdf_output

# Comment out if you don't want the intermediate .html file saved.
rm $base_name.html

