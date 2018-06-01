#!/usr/bin/perl

use Mojo::UserAgent;
use File::Touch;

my $ua = Mojo::UserAgent->new;

my $count = 108;
while(<DATA>){
    chomp;
    my @arr = split("\t");
    touch("final/$count"."_".$arr[2]);
    for (1..20){
        $arr[1] =~ s/_\d+\.gif/_$_\.gif/;
        my $content_type = $ua->get($arr[1])->result->headers->content_type;
        last if $content_type ne 'image/gif';
        my $fn = (split /\//, $arr[1])[5];
        print "final/$count"."_"."$fn\n";
        open FH, ">", "final/$count" . "_" . $fn;
        print FH $ua->get($arr[1])->result->body;
        close FH;
    }
    $count++;
    # last if $count > 2;
}

__DATA__
0	http://cdn.daweijita.com/2017/12/tab_zhuimenghuaiyouji_remember-me_1.gif	迪士尼热映电影【寻梦环游记】插曲《remember me》吉他弹唱