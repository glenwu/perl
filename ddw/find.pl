#!/usr/bin/perl

use Mojo::UserAgent;
use File::Touch;

my $ua = Mojo::UserAgent->new;

my $count = 1;
while(<DATA>){
    chomp;
    my @arr = split("\t");
    # print @arr,"\n";
    # print "$_\n" for (2011 ..2018);

    my $fn = (split /\//, $arr[1])[5];
    my $http = "http://cdn.daweijita.com/";
    my $tag = 0;
    my $url;

    for (2016..2018){
        my $y = $_;
        my $date;
        for (1..12){
            my $day = sprintf ("%02s",$_);
            $url = $http . $y . "/" . $day ."/" . $fn;
            # print "$url\n";
            if ($ua->get($url)->result->headers->content_type eq 'image/gif'){
                $date = $y . "/" . $day;
                last;
            }
        }
        if (defined $date){
            $tag = $date;
            last;
        }
    }
    print $tag,"\t",$url,"\t",$arr[2],"\n";
    # touch("final/$count"."_".$arr[2]);
    # for (1..20){
    #     $arr[1] =~ s/_\d+\.gif/_$_\.gif/;
    #     my $content_type = $ua->get($arr[1])->result->headers->content_type;
    #     last if $content_type ne 'image/gif';
    #     my $fn = (split /\//, $arr[1])[5];
    #     print "final/$count"."_"."$fn\n";
    #     open FH, ">", "final/$count" . "_" . $fn;
    #     print FH $ua->get($arr[1])->result->body;
    #     close FH;
    # }
    $count++;
    # last if $count > 1;
}

__DATA__
0	http://cdn.daweijita.com/2011/12/tab_xmhyj_remember_me_1.gif	迪士尼热映电影【寻梦环游记】插曲《remember me》吉他弹唱
0	http://cdn.daweijita.com/2015/06/tab_wuyifan_shijianzhuyu_1.gif	吴亦凡《时间煮雨》吉他教学
0	http://cdn.daweijita.com/2011/12/tab_yuwenwen_timian_nvshengban_1.gif	《前任3:再见前任》插曲《体面》于文文 吉他弹唱
0	http://cdn.daweijita.com/2017/08/tab_mby_xc_1.gif	毛不易《消愁》吉他弹唱
