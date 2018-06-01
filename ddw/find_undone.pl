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

    for (2011..2018){
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
0	http://cdn.daweijita.com/2018/12/tab_tianfuzhen_xiaoxingyunokok_1.gif	田馥甄《小幸运》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_taobapjihua_yiwancibeishang_1.gif	逃跑计划《一万次悲伤》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_fengfeifei_zhuimengren_gai_1.gif	万晓利《女儿情》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_wuyuetian_wbyrnygr_1.gif	五月天《我不愿让你一个人》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_xuezhiqian_yanyuan_vip_1.gif	薛之谦《演员》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_lijian_chezhan1_1.gif	李健《车站》-大伟吉他教室
0	http://cdn.daweijita.com/2018/12/tab_yuekewei_shijianzhuyu_1_1.gif	吴亦凡《时间煮雨》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_zhangxueyou_talaitingwodeyanchanghui_1_1.gif	张学友《她来听我的演唱会》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_lyj_sh_1.gif	林宥嘉《说谎》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_wyt_jj_1.gif	五月天《倔强》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_xg_bcys_1.gif	许嵩《半城烟沙》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_wf_xblq_1_1.gif	萧敬腾/万芳《新不了情》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_hxh_mnmjd_1.gif	黄小琥《没那么简单》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_fdt_sry_1.gif	方大同《三人游》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_nobody_1.gif	韩国wonder girls《Nobody》爵士弹唱版吉他教学
0	http://cdn.daweijita.com/2018/12/tab_beyond_qr_1.gif	Beyond乐队/邓紫棋《情人》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_zjl_yhyl_1.gif	周杰伦/林志炫《烟花易冷》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_lzlsfs_1.gif	金志文《流着泪说分手》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_EC_tih_1.gif	埃里克.克来普顿《Tears in Heaven》（泪洒天堂）吉他教学
0	http://cdn.daweijita.com/2018/12/tab_ly_jzlg_1.gif	老鹰乐队《加州旅馆》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_zyj_pa_1.gif	张芸京《偏爱》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_lmmw_my_1.gif	韩剧《浪漫命运》插曲《命运》吉他教学
0	http://cdn.daweijita.com/2018/12/tab_007_1.gif	007电影主题音乐（双吉他演奏版）吉他教学
0	http://cdn.daweijita.com/2018/12/tab_yuwenwen_timian_nvshengban_1.gif	《前任3:再见前任》插曲《体面》于文文 吉他弹唱
0	http://cdn.daweijita.com/2018/12/tab_zhuimenghuanyouji_remember-me_1.gif	迪士尼热映电影【寻梦环游记】插曲《remember me》吉他弹唱
0	http://cdn.daweijita.com/2018/12/tab_maobuyi_xiaochou_1.gif	毛不易《消愁》吉他弹唱
0	http://cdn.daweijita.com/2018/12/tab_chenyixun_Kgezhiwang_1.gif	陈奕迅《K歌之王》吉他弹唱教学
0	http://cdn.daweijita.com/2018/12/tab_songdongye_lilian_1.gif	宋冬野《莉莉安》吉他教学