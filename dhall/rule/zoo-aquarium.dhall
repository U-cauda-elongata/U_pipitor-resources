--| 動物園・水族館等
let Pipitor = ../Pipitor.dhall

let account = ../account.dhall

let filter = ../filter.dhall

let rx = (../util.dhall).rx

let Twitter = Pipitor.Topic.Twitter

in  [ Pipitor.Rule::{
      , filter = Some Pipitor.Filter::{
        , title = rx.any [ filter.basic, "吉崎\\s*観音", "吉崎先生" ]
        }
      , outbox = [ Pipitor.Outbox.Twitter account.pipitor ]
      , topics =
        [ Twitter 1319835095381889026
        , Twitter 1278246912861208577
        , Twitter 1186801617288384512
        , Twitter 1159364299866820608
        , Twitter 1153906257129959425
        , Twitter 1136180695913586689
        , Twitter 1135423422639423489
        , Twitter 1134695072614690817
        , Twitter 1116565680604606465
        , Twitter 1106384693392375809
        , Twitter 1088622845620498433
        , Twitter 1086085674841780224
        , Twitter 1076317646692376576
        , Twitter 1049502497117626369
        , Twitter 1036795766008729601
        , Twitter 1023425633496358912
        , Twitter 1021638876287225856
        , Twitter 1019052580415000576
        , Twitter 986861615545892864
        , Twitter 986404434514100225
        , Twitter 956017993963667457
        , Twitter 928203645719429120
        , Twitter 924900426398416897
        , Twitter 920176444302438400
        , Twitter 914767453720215552
        , Twitter 905304850040201216
        , Twitter 895507390992232448
        , Twitter 893018992411000832
        , Twitter 882213989890965504
        , Twitter 870198495344345088
        , Twitter 854862220764749824
        , Twitter 839321180351836160
        , Twitter 830067318755438592
        , Twitter 812174717268332544
        , Twitter 804867003156611072
        , Twitter 800216648468680706
        , Twitter 795841508343590912
        , Twitter 795140108429078528
        , Twitter 763970035983405056
        , Twitter 748306855147896832
        , Twitter 747292851608838145
        , Twitter 745975615921106945
        , Twitter 745788914363883520
        , Twitter 737841230273355776
        , Twitter 735319773928685569
        , Twitter 733945923542212608
        , Twitter 732473190371319808
        , Twitter 724527309487628289
        , Twitter 717601894781222914
        , Twitter 708854463331569664
        , Twitter 4830514909
        , Twitter 3302950393
        , Twitter 3256246122
        , Twitter 3248460727
        , Twitter 3184029560
        , Twitter 3172153638
        , Twitter 3131486945
        , Twitter 2982442993
        , Twitter 2973574466
        , Twitter 2933273814
        , Twitter 2751336146
        , Twitter 2731367606
        , Twitter 2588608866
        , Twitter 2331401946
        , Twitter 2316749971
        , Twitter 2311169834
        , Twitter 2248329013
        , Twitter 1966885626
        , Twitter 1856642136
        , Twitter 1684550180
        , Twitter 1466345528
        , Twitter 1365609534
        , Twitter 1293811862
        , Twitter 1230467258
        , Twitter 1196106666
        , Twitter 1156741970
        , Twitter 1156728812
        , Twitter 1156726849
        , Twitter 1156713230
        , Twitter 1076058583
        , Twitter 1023628381
        , Twitter 777973105
        , Twitter 748494854
        , Twitter 700437200
        , Twitter 615913517
        , Twitter 602436204
        , Twitter 587130728
        , Twitter 579452660
        , Twitter 565474632
        , Twitter 543220054
        , Twitter 536976698
        , Twitter 532950800
        , Twitter 504224650
        , Twitter 464487269
        , Twitter 437332642
        , Twitter 424030054
        , Twitter 423161010
        , Twitter 409071079
        , Twitter 365224501
        , Twitter 359257920
        , Twitter 354736890
        , Twitter 348237596
        , Twitter 303054366
        , Twitter 301940091
        , Twitter 299990024
        , Twitter 286018618
        , Twitter 277861096
        , Twitter 270220209
        , Twitter 267537691
        , Twitter 266449884
        , Twitter 224057019
        , Twitter 218385532
        , Twitter 217703937
        , Twitter 209849715
        , Twitter 205999791
        , Twitter 204238464
        , Twitter 156534337
        , Twitter 154381364
        , Twitter 150990053
        , Twitter 148174653
        , Twitter 136808681
        , Twitter 129197685
        , Twitter 128158330
        , Twitter 126991605
        , Twitter 109532430
        , Twitter 106002493
        , Twitter 101746805
        , Twitter 99226401
        , Twitter 71168009
        , Twitter 68329219
        , Twitter 1217730379601207297
        , Twitter 1214892311563210752
        , Twitter 1063585435853611009
        , Twitter 4514445018
        , Twitter 3015826252
        , Twitter 633733318
        , Twitter 479215305
        ]
      }
    ]
