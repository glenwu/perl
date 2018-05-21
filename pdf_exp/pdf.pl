#!/usr/bin/perl

use PDF::Reuse;
use strict;
use utf8;

prFile('myFile.pdf');
prTTFont('msyh.ttf');
prFontSize(14);

&single(0,"浸会大学联合国际学院","郑佳琳","Cathrine Zheng","高级行政人员");
prEnd();


sub single {
    my @param = @_;
    my $p = [
        { main => [50,500], from => [165,730], name => [165,680], name_e => [165,660], title => [165,620]},
        { main => [50,500], from => [165,730], name => [165,680], name_e => [165,660], title => [165,620]},
        { main => [50,500], from => [165,730], name => [165,680], name_e => [165,660], title => [165,620]},
        { main => [50,500], from => [165,730], name => [165,680], name_e => [165,660], title => [165,620]},
    ];
    prForm(  { file =>'chest.pdf',
                #  page => 5,
                 x    => $p->[$param[0]]->{'main'}->[0],
                 y    => $p->[$param[0]]->{'main'}->[1]
             } 
          );
    prAdd("1.0 1.0 1.0 rg");
    prText(165, 730, $param[1],'center');
    prFontSize(20);
    prText(165, 680, $param[2],'center');
    prFontSize(12);
    prText(165, 660, $param[3],'center');
    prText(165, 620, $param[4],'center');
    }
