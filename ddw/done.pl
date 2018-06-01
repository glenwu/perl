#!/usr/bin/perl

use Mojo::UserAgent;
use File::Touch;

my $ua = Mojo::UserAgent->new;

my $count = 1;
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
1	http://cdn.daweijita.com/2018/05/tab_wuyuetian_houlaidewomen_1.gif	五月天《后来的我们》吉他弹唱
1	http://cdn.daweijita.com/2018/02/tab_zhoujielun_dengnixiake_1.gif	周杰伦杨瑞代《等你下课》吉他弹唱教学
1	http://cdn.daweijita.com/2018/01/tab_yuwenwen_timian_nanshengban_1.gif	男声版《前任3:再见前任》插曲《体面》于文文 吉他弹唱
1	http://cdn.daweijita.com/2017/10/tab_dapeng_douxuanC_1.gif	《缝纫机乐队》插曲《都选C》吉他弹唱教学
1	http://cdn.daweijita.com/2017/09/tab_maobuyi_jie_1.gif	毛不易《借》吉他弹唱
1	http://cdn.daweijita.com/2017/08/tab_xuezhiqian_dongwushijie_1.gif	薛之谦《动物世界》吉他弹唱教学
1	http://cdn.daweijita.com/2017/06/tab_liangbo_nanhai_1.gif	梁博《男孩》吉他弹唱教学
1	http://cdn.daweijita.com/2017/06/tab_chenyixun_xitiejie_1.gif	谢安琪陈奕迅《喜帖街》吉他弹唱
1	http://cdn.daweijita.com/2017/06/tab_zhangbichenyangzongwei_liangliang_1.gif	《三生三世十里桃花》主题曲《凉凉》吉他弹唱教学
1	http://cdn.daweijita.com/2017/05/tab_xuezhiqian_aimei_1.gif	薛之谦《暧昧》吉他弹唱
1	http://cdn.daweijita.com/2017/04/tab_lijian_shidianbandeditie_1.gif	李健《十点半的地铁》吉他弹唱教学
1	http://cdn.daweijita.com/2017/03/tab_zhaolei_hua_1.gif	赵雷《画》吉他弹唱教学
1	http://cdn.daweijita.com/2017/02/tab_zhaolei_gulou_1.gif	赵雷《鼓楼》吉他弹唱
1	http://cdn.daweijita.com/2016/12/tab_chenshian_baijiang_1.gif	陈势安《败将》吉他弹唱教学
1	http://cdn.daweijita.com/2016/12/tab_linyoujia_chengquan_1.gif	林宥嘉《成全》吉他弹唱教学
1	http://cdn.daweijita.com/2016/12/tab_linjunjie_nishiwodeweiyi_1.gif	林俊杰《你是我的唯一》吉他弹唱教学
1	http://cdn.daweijita.com/2016/11/tab_laolang_woyaoni_1.gif	电影《驴得水》主题曲 老狼《我要你》
1	http://cdn.daweijita.com/2016/11/tab_zhaolei_chengdu_1.gif	赵雷《成都》吉他弹唱教学
1	http://cdn.daweijita.com/2016/10/tab_lironghao_bushuo_1.gif	《从你的全世界路过》主题曲《不说》李荣浩吉他谱
1	http://cdn.daweijita.com/2016/10/tab_chenyixun_aiqingzhuanyi_fushishanxia_1.gif	陈奕迅《富士山下爱情转移》吉他教学
1	http://cdn.daweijita.com/2016/10/tab_xuezhiqian_nihaiyaowozenyang_1.gif	薛之谦《你还要我怎样》吉他弹唱教学
1	http://cdn.daweijita.com/2016/09/tab_the-beatles_hey-jude_1.gif	The Beatles 《Hey Jude》吉他弹唱教学
1	http://cdn.daweijita.com/2016/09/tab_zhangjie_tabudong_1.gif	张杰《他不懂》吉他弹唱教学
1	http://cdn.daweijita.com/2016/08/tab_sudalv_wohaoxiangni_1.gif	苏打绿《我好想你》吉他弹唱教学
1	http://cdn.daweijita.com/2016/08/tab_donglihuoche_najiuzheyangba_1.gif	动力火车《那就这样吧》吉他弹唱教学
1	http://cdn.daweijita.com/2016/07/tab_xuezhiqian_gangganghao_1.gif	薛之谦《刚刚好》吉他弹唱教学
1	http://cdn.daweijita.com/2016/07/tab_zhoujielun_gaobaiqiqiu_1.gif	周杰伦《告白气球》吉他弹唱教学
1	http://cdn.daweijita.com/2016/07/tab_sting_shape-of-my-heart_1.gif	《这个杀手不太冷》片尾曲 Shape of my heart 吉他教学
1	http://cdn.daweijita.com/2016/06/tab_weiwenhuaming_secret-base_1.gif	《未闻花名》主题曲 secret base .君がくれたもの 指弹
1	http://cdn.daweijita.com/2016/05/tab_daiquan_wukong_1.gif	中国好歌曲 戴荃《悟空》吉他教学
1	http://cdn.daweijita.com/2016/05/tab_xuezhiqian_shenshi_1.gif	薛之谦《绅士》吉他教学
1	http://cdn.daweijita.com/2016/04/tab_tanyonglin_aiyutongdebianyuan_1.gif	王菲《爱与痛的边缘》(有多少爱可以重来)男声版
1	http://cdn.daweijita.com/2016/03/tab_xuezhiqian_choubaguai_1.gif	薛之谦《丑八怪》吉他教学
1	http://cdn.daweijita.com/2016/03/tab_bigbang_ifyou_1.gif	BigBang《If You》
1	http://cdn.daweijita.com/2016/01/tab_zhangzhenyue_lukou_1.gif	张震岳《路口》吉他教学
1	http://cdn.daweijita.com/2016/01/tab_joycechu_haoxiangni_1.gif	朱主爱《好想你》男声弹唱版教学
1	http://cdn.daweijita.com/2016/01/tab_zhoujielun_feng_1.gif	周杰伦《枫》吉他弹唱教学
1	http://cdn.daweijita.com/2015/12/tab_chenyixun_pndgmcsy_1.gif	陈奕迅《陪你度过漫长岁月》吉他教学
1	http://cdn.daweijita.com/2015/11/tab_chenbaiqiang_pianoianxihuanni_1.gif	陈百强《偏偏喜欢你》吉他教学
1	http://cdn.daweijita.com/2015/11/tab_fengfeifei_zhuimengren_1.gif	罗大佑《追梦人》吉他教学
1	http://cdn.daweijita.com/2015/10/tab_yangzongwei_yicijiuhao_1.gif	杨宗纬《一次就好》吉他教学
1	http://cdn.daweijita.com/2015/10/tab_zhanglei_hukoutuoxian_1.gif	张磊《虎口脱险》吉他教学
1	http://cdn.daweijita.com/2015/09/tab_zhoujielun_huidaoguoqu_1.gif	周杰伦《回到过去》吉他教学
1	http://cdn.daweijita.com/2015/09/tab_zhaolei_shaonianjinshi_1.gif	赵雷《少年锦时》吉他教学
1	http://cdn.daweijita.com/2015/06/tab_linjunjie_keximeiruguo_1.gif	林俊杰《可惜没如果》大伟吉他教室
