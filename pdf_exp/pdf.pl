#!/usr/bin/perl

use PDF::Reuse;
use strict;
use utf8;
use Encode;

prFile('myFile.pdf');
prTTFont('msyh.ttf');
prFontSize(14);

my $count = 0;

while (<DATA>) {
    chomp;
    my @arr = split /\//;
    # print join ",", @arr
    if ($count % 4 eq '0' && $count ne '0') {
        prPage();
    }
    &single($count % 4, @arr);
    # print $count % 4, encode('utf8',join '|', @arr) ,"\n";

    $count++;
}
# &single(0,"Duke Kunshan University","浸会大学联合国际学院","何腚","Cathrine Zheng","高级行政人员");
# &single(1,"Duke Kunshan University","浸会大学联合国际学院","何腚","Cathrine Zheng","高级行政人员");
# &single(3,"Duke Kunshan University","浸会大学联合国际学院","何腚","Cathrine Zheng","高级行政人员");
# &single(2,"Duke Kunshan University","浸会大学联合国际学院","何腚","Cathrine Zheng","高级行政人员");
# prPage();
# &single(1,"The Chinese University of Hong Kong, Shenzhen","浸会大学联合国际学院","何腚","Cathrine Zheng","高级行政人员");
# &single(0,"The Chinese University of Hong Kong, Shenzhen","浸会大学联合国际学院","何腚","Cathrine Zheng","高级行政人员");
# &single(3,"The Chinese University of Hong Kong, Shenzhen","浸会大学联合国际学院","何腚","Cathrine Zheng","高级行政人员");
# &single(2,"The Chinese University of Hong Kong, Shenzhen","浸会大学联合国际学院","何腚","Cathrine Zheng","高级行政人员");
prEnd();


sub single {
    my @param = @_;
    my $p = [
        { from_e => [165,700], main => [50,450], from => [165,680], name => [165,630], name_e => [165,610], title => [165,570]},
        { from_e => [435,700], main => [320,450], from => [435,680], name => [435,630], name_e => [435,610], title => [435,570]},
        { from_e => [165,300], main => [50,50], from => [165,280], name => [165,230], name_e => [165,210], title => [165,170]},
        { from_e => [435,300], main => [320,50], from => [435,280], name => [435,230], name_e => [435,210], title => [435,170]},
    ];
    prForm(  { file =>'chest.pdf',
                #  page => 5,
                 x    => $p->[$param[0]]->{'main'}->[0],
                 y    => $p->[$param[0]]->{'main'}->[1]
             } 
          );
    prAdd("1.0 1.0 1.0 rg");
    prFontSize(8);
    prText($p->[$param[0]]->{'from_e'}->[0], $p->[$param[0]]->{'from_e'}->[1], $param[1],'center');
    prFontSize(12);
    prText($p->[$param[0]]->{'from'}->[0], $p->[$param[0]]->{'from'}->[1], $param[2],'center');
    prFontSize(20);
    prText($p->[$param[0]]->{'name'}->[0], $p->[$param[0]]->{'name'}->[1], $param[3],'center');
    prFontSize(12);
    prText($p->[$param[0]]->{'name_e'}->[0], $p->[$param[0]]->{'name_e'}->[1], $param[4],'center');
    prFontSize(8) if length($param[5]) > 26;
    prFontSize(6) if length($param[5]) > 51;
    prText($p->[$param[0]]->{'title'}->[0], $p->[$param[0]]->{'title'}->[1], $param[5],'center');
    }


__DATA__
/遵义医学院珠海校区/王凤云//图书与网络管理中心主任
/北理莫斯科大学/赵佩华//高级馆员
/北理莫斯科大学/石坤//高级馆员
