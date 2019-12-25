set names utf8;
set foreign_key_checks = 0;
drop database if exists django;


create database if not exists django;
use django;

/*会員情報テーブル*/
drop table if exists  user_info;

create table user_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint default 0 comment "性別",
email varchar(32) comment "メールアドレス",
status tinyint default 0 comment "ステータス",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時"
);

/*商品情報テーブル*/
drop table if exists product_info;

create table product_info(
id int primary key not null auto_increment comment "ID",
product_id int unique not null comment "商品ID",
product_name varchar(100) unique not null comment "商品名",
product_name_kana varchar(100) unique not null comment "商品名かな",
product_description varchar(255) comment "商品詳細",
category_id int not null comment "カテゴリID",
price int not null comment "値段",
image_file_path varchar(100) not null comment "画像ファイルパス",
image_file_name varchar(50) not null comment "画像ファイル名",
release_date datetime comment "発売年月",
release_company varchar(50) comment "発売会社",
status tinyint default 1 comment "ステータス",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key (category_id) references m_category(category_id)
);

/*会員情報テーブル*/
drop table if exists cart_info;

create table cart_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(product_id)references product_info(product_id)
);

/*購入履歴情報テーブル*/
drop table if exists purchase_history_info;

create table purchase_history_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "値段",
destination_id int not null comment "宛先情報ID",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(user_id)references user_info(user_id),
foreign key(product_id) references product_info(product_id)
);

/*宛先情報テーブル*/
drop table if exists destination_info;

create table destination_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
email varchar(32) comment "メールアドレス",
tel_number varchar(13) comment "電話番号",
user_address varchar(50) not null comment "住所",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(user_id) references user_info(user_id)
);

/*カテゴリーマスターテーブル*/
drop table if exists m_category;

create table m_category(
id int not null primary key auto_increment,
category_id int unique,
category_name varchar(20) unique,
category_description varchar(100),
regist_date datetime,
update_date datetime
);

insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",1,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());

insert into m_category values
(1,1,"すべてのカテゴリー","服、文房具、アクセサリー、日用品全てのカテゴリーが対象となります",now(), now()),
(2,2,"服","服に関するカテゴリーが対象となります",now(), now()),
(3,3,"文房具","文房具に関するカテゴリーが対象となります",now(), now()),
(4,4,"アクセサリー","アクセサリーに関するカテゴリーが対象となります",now(), now()),
(5,5,"日用品","日用品に関するカテゴリーが対象となります",now(), now());


insert into product_info values
( 1, 1,"宇宙服","うちゅうふく","宇宙服の商品詳細",2,100000000,"./images","uchufuku.png",now(),"発売会社",1,now(),now()),
( 2, 2,"ブレザー服","ぶれざーふく","ブレザー服の商品詳細",2,20000,"./images","blazer.png",now(),"発売会社",1,now(),now()),
( 3, 3,"セーラー服","せーらーふく","セーラー服の商品詳細",2,20000,"./images","sailor.png",now(),"発売会社",1,now(),now()),
( 4, 4,"軍服","ぐんぷく","軍服の商品詳細",2,28300,"./images","gunpuku.png",now(),"発売会社",1,now(),now()),
( 5, 5,"作業服","さぎょうふく","作業服の商品詳細",2,10000,"./images","sagyougi.png",now(),"発売会社",1,now(),now()),
( 6, 6,"シャープペンシル","しゃーぷぺんしる","シャープペンシルの商品詳細",3,300,"./images","sharppen.png",now(),"発売会社",1,now(),now()),
( 7, 7,"消しゴム","けしごむ","消しゴムの商品詳細",3,300,"./images","keshigomu.png",now(),"発売会社",1,now(),now()),
( 8, 8,"ノート","のーと","ノートの商品詳細",3,100,"./images","note.png",now(),"発売会社",1,now(),now()),
( 9, 9,"定規","じょうぎ","定規の商品詳細",3,400,"./images","jougi.png",now(),"発売会社",1,now(),now()),
( 10, 10,"絵具セット","えのぐせっと","絵具セットの商品詳細",3,2000,"./images","enogu.png",now(),"発売会社",1,now(),now()),
( 11, 11,"ドームアクセサリー","どーむあくせさりー","ドームアクセサリーの商品詳細",4,800,"./images","domeaccessory.png",now(),"発売会社",1,now(),now()),
( 12, 12,"ガラスアクセサリー","がらすあくせさりー","ガラスアクセサリーの商品詳細",4,700,"./images","glassdome.png",now(),"発売会社",1,now(),now()),
( 13, 13,"ブローチ","ぶろーち","ブローチの商品詳細",4,500,"./images","accessorybrooch.png",now(),"発売会社",1,now(),now()),
( 14, 14,"スマートフォンリング","すまーとふぉんりんぐ","スマートフォンリングの商品詳細",4,600,"./images","smartphonering.png",now(),"発売会社",1,now(),now()),
( 15, 15,"ビーズ","びーず","ビーズの商品詳細",4,500,"./images","syugeibeads.png",now(),"発売会社",1,now(),now()),
( 16, 16,"弁当箱","べんとうばこ","弁当箱の商品詳細",5,2500,"./images","obentoubako_family.png",now(),"発売会社",1,now(),now()),
( 17, 17,"水筒","すいとう","水筒の商品詳細",5,1500,"./images","suitou.png",now(),"発売会社",1,now(),now()),
( 18, 18,"エコバッグ","えこばっぐ","エコバッグの商品詳細",5,1000,"./images","ecobag_empty.png",now(),"発売会社",1,now(),now()),
( 19, 19,"スマートフォン","すまーとふぉん","スマートフォンの商品詳細",5,110000,"./images","smartphone.png",now(),"発売会社",1,now(),now()),
( 20, 20,"タブレットPC","たぶれっとぴーしー","タブレットPCの商品詳細",5,50000,"./images","computertablet.png",now(),"発売会社",1,now(),now());
insert into destination_info values
(1,"guest","インターノウス","テストユーざー","いんたーのうす","てすとゆーざー","guest@internous.co.jp","080-1234-5678","東京都千代田区三番町１ー１　ＫＹ三番町ビル１Ｆ",now(),now());

