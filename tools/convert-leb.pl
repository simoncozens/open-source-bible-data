@osis = qw/ Gen Exod Lev Num Deut Josh Judg Ruth 1Sam 2Sam 1Kgs 2Kgs 1Chr 2Chr Ezra Neh Esth Job Ps Prov Eccl Song Isa Jer Lam Ezek Dan Hos Joel Amos Obad Jonah Mic Nah Hab Zeph Hag Zech Mal Matt Mark Luke John Acts Rom 1Cor 2Cor Gal Eph Phil Col 1Thess 2Thess 1Tim 2Tim Titus Phlm Heb Jas 1Pet 2Pet 1John 2John 3John Jude Rev /;
my $book = "";
while (<>) {
    chomp; s/\r//;
    next unless /^([\w\s]+) (?:(\d+):)?(\d+)\s+(.+)$/;
    if ($1 ne $book) {
        $book = $1;
        $chapter = 0;
        print "  </chapter>\n";
        print "</book>\n";
        print "<book num=\"".shift(@osis)."\">\n";
    }
    if ($2 ne $chapter) {
        print "  </chapter>\n" if $chapter > 0;
        $chapter = $2;
        print "  <chapter num=\"$2\">\n";
    }
    print "    <verse num=\"$3\">";
    $text = $4;
    $text =~ s/<note: ([^>]+)>/<note>$1<\/note>/g;
    $text =~ s/\[([^\]]+)\]/<transChange type="added">$1<\/transChange>/g;
    print "$text</verse>\n";
}
