my $c = 0;
while (<>) {
    s/<p>//g; s/<\/p>//g;
    s/<verse eID=".*?"\/>/<\/verse>/g;
    s/<verse.*sID="(\w+).(?:(\d+).)?(\d+)"\/?>/<verse num="$3">/g;
    s/<div type="book" osisID="(.*?)">/<book num="$1">/g;
    s/<chapter.*?eID="(\w+).(\d+)"\/>/<\/chapter>/g;
    s/<chapter.*?sID="(\w+).(\d+)"\/?>/<chapter num="$2">/g;
    s{<\/div>}{</book>}g;
    print;
}
