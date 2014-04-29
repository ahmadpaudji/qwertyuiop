/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.72-community : Database - db_esos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_esos` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_esos`;

/*Table structure for table `detail_roles` */

DROP TABLE IF EXISTS `detail_roles`;

CREATE TABLE `detail_roles` (
  `id_detail_roles` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `id_roles` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detail_roles`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `detail_roles` */

insert  into `detail_roles`(`id_detail_roles`,`id_user`,`id_roles`) values (1,2,1),(4,6,2),(3,5,1),(5,7,1),(6,8,2);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL AUTO_INCREMENT,
  `roles` varchar(15) NOT NULL,
  PRIMARY KEY (`id_roles`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`id_roles`,`roles`) values (1,'super_admin'),(2,'admin');

/*Table structure for table `t_album` */

DROP TABLE IF EXISTS `t_album`;

CREATE TABLE `t_album` (
  `album_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id kategori dokumentasi',
  `user_id` int(11) NOT NULL COMMENT 'id user yang update data join ke t_user',
  `album_title` varchar(100) NOT NULL COMMENT 'dijadikan sebagai judl album',
  `album_desc` text COMMENT 'deskripsi kegiatan album foto',
  `album_date` datetime NOT NULL COMMENT 'tanggal memasukan data',
  PRIMARY KEY (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `t_album` */

insert  into `t_album`(`album_id`,`user_id`,`album_title`,`album_desc`,`album_date`) values (3,2,'Umum',NULL,'2014-04-07 01:28:00'),(4,2,'coba','Shhbjbjnknk','2014-04-07 17:46:07');

/*Table structure for table `t_bidang` */

DROP TABLE IF EXISTS `t_bidang`;

CREATE TABLE `t_bidang` (
  `bidang_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id bidang',
  `user_id` int(11) NOT NULL COMMENT 'join ke t_user',
  `bidang_title` varchar(50) NOT NULL COMMENT 'judul bidang',
  `bidang_name` varchar(50) NOT NULL COMMENT 'penanggung jawab',
  `bidang_person_foto` varchar(200) NOT NULL COMMENT 'foto penanggung jawab',
  `bidang_desc` text NOT NULL COMMENT 'konten SOP, dll',
  `bidang_date` datetime NOT NULL COMMENT 'tanggal masukan data',
  `bidang_desc_foto` varchar(200) DEFAULT NULL COMMENT 'konten gambar',
  PRIMARY KEY (`bidang_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `t_bidang` */

insert  into `t_bidang`(`bidang_id`,`user_id`,`bidang_title`,`bidang_name`,`bidang_person_foto`,`bidang_desc`,`bidang_date`,`bidang_desc_foto`) values (13,2,'Umum dan Kepegawaian','Hj. Euis Jubaedah, BA.','~/Content/Image/bid1.jpg','<p style=\"text-align:justify\"><b>Tugas Pokok :</b></p>\r\n                            \r\n								<p style=\"text-align:justify\">Sub Bagian Umum dan Kepegawaian \r\nmempunyai tugas pokok melaksanakan sebagian tugas Sekretariat lingkup \r\nadministrasi umum dan kepegawaian. </p>\r\n                                \r\n                                <br><br><br><br><br>\r\n                                <p style=\"text-align:justify\"><b>Fungsi :</b></p>\r\n                                \r\n								<p style=\"text-align:justify\">Untuk melaksanakan tugas pokok tersebut, Sub Bagian Umum dan Kepegawaian mempunyai fungsi : </p>\r\n                                \r\n\r\n                                <p style=\"text-align:justify\">a.	Penyusunan bahan rencana dan program pengelolaan lingkup administrasi umum dan kepegawaian; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">b.	\r\nPengelolaan administrasi umum yang meliputi pengelolaan naskah dinas, \r\npenataan kearsipan Dinas, penyelenggaraan kerumahtanggaan Dinas, \r\npengelolaan perlengkapan dan administrasi perjalanan dinas; </p>\r\n                                <p style=\"text-align:justify\">c.	\r\nPelaksanaan administrasi kepegawaian yang meliputi kegiatan penyusunan \r\nrencana, penyusunan bahan, pemprosesan, pengusulan dan pengelolaan data \r\nmutasi, cuti, disiplin, pengembangan pegawai dan kesejahteraan pegawai; \r\ndan </p>\r\n                                    \r\n                                <p style=\"text-align:justify\">d.	Evaluasi dan pelaporan lingkup administrasi umum dan kepegawaian. </p>','2014-04-26 11:04:13','Kosong'),(14,2,'Keuangan dan Program','Hj. Ida Rafni, SH, M.Kn.','~/Content/Image/p_idah.jpg','<p style=\"text-align:justify\"><b>Tugas Pokok :</b></p>\r\n								\r\n                                <p style=\"text-align:justify\">Sub Bagian Keuangan dan Program mempunyai tugas pokok melaksanakan sebagian tugas Sekretariat lingkup keuangan dan program.</p>\r\n                                \r\n                                <br><br><br><br>\r\n                                <p style=\"text-align:justify\"><b>Fungsi :</b></p>\r\n                                \r\n								<p style=\"text-align:justify\">Untuk melaksanakan tugas pokok tersebut, Sub Bagian Keuangan dan Program mempunyai fungsi : </p>\r\n                                \r\n                                <p style=\"text-align:justify\">a.	Penyusunan rencana dan program pengelolaan administrasi keuangan dan program kerja Dinas; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">b.	\r\nPelaksanaan pengelolaan administrasi keuangan meliputi kegiatan \r\npenyusunan rencana, penyusunan bahan, pemprosesan, pengusulan dan \r\npengelolaan data anggaran, koordinasi penyusunan anggaran, koordinasi \r\npengelola dan pengendalian keuangan dan menyusun laporan keuangan Dinas;\r\n </p>\r\n                                \r\n                                <p style=\"text-align:justify\">c.	\r\nPelaksanaan pengendalian program meliputi kegiatan penyusunan rencana, \r\npenyusunan bahan, pemprosesan, pengusulan dan pengelolaan data kegiatan \r\ndinas, koordinasi penyusunan rencana dan program dinas serta koordinasi \r\npengendalian program; dan </p>\r\n                                \r\n                                <p style=\"text-align:justify\">d.	Pelaporan pelaksanaan lingkup kegiatan pengelolaan administrasi keuangan dan program kerja Dinas. </p>','2014-04-27 13:08:49','Kosong'),(15,2,'Partisipasi Sosial Dan Masyarakat','Dra. Yanti Erlinawati, M. Si.','~/Content/Image/bid3.jpg','<p style=\"text-align:justify\"><b>Tugas Pokok :</b></p>\r\n								\r\n                                <p style=\"text-align:justify\">Bidang \r\nPartisipasi Sosial dan Masyarakat mempunyai tugas pokok melaksanakan \r\nsebagian tugas Kepala Dinas Sosial lingkup partisipasi sosial dan \r\nmasyarakat. </p>\r\n                                \r\n                                <br><br><br><br>\r\n                                <p style=\"text-align:justify\"><b>Fungsi :</b></p>\r\n                                \r\n								<p style=\"text-align:justify\">Untuk melaksanakan tugas pokok tersebut, Bidang Partisipasi Sosial dan Masyarakat mempunyai fungsi: </p>\r\n                                \r\n                                <p style=\"text-align:justify\">a.	\r\npenyusunan rencana dan program lingkup penyuluhan, pemberdayaan dan \r\npartisipasi sosial, pengumpulan dan pengawasan undian dan sumbangan \r\nsosial; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">b.	\r\npenyusunan petunjuk teknis lingkup penyuluhan, pemberdayaan dan \r\npartisipasi sosial, pengumpulan dan pengawasan undian dan sumbangan \r\nsosial; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">c.	pelaksanaan lingkup penyuluhan, pemberdayaan dan partisipasi sosial, pengumpulan dan pengawasan undian dan sumbangan sosial; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">d.	\r\npengkajian pemberian rekomendasi dan pemantauan penyelenggaraan lingkup \r\npenyuluhan, pemberdayaan dan partisipasi sosial, pengumpulan dan \r\npengawasan undian dan sumbangan sosial; dan </p>\r\n                                \r\n                                <p style=\"text-align:justify\">e.	\r\npelaksanaan monitoring, evaluasi dan pelaporan lingkup penyuluhan, \r\npemberdayaan dan partisipasi sosial, pengumpulan dan pengawasan undian \r\ndan sumbangan sosial. </p>\r\n                                \r\n                                \r\n                                 <br>\r\n                                 <p style=\"text-align:justify\"><b>Daftar Seksi Bidang:</b></p>\r\n                                \r\n                <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">\r\n                    <a>Seksi penyuluhan, pemberdayaan, dan partisipasi sosial</a></li><li style=\"display:block;text-align:justify;\">\r\n                    <a>Seksi pengumpulan, pengawasan undian, dan sumbangan sosial</a></li></ol>','2014-04-26 11:04:02','Kosong'),(16,2,'Rehabilitas Sosial','Muh. Nurahman, SH.','~/Content/Image/p_nur.jpg','<p style=\"text-align:justify\"><b>Tugas Pokok :</b></p>\r\n								\r\n                                <p style=\"text-align:justify\">Bidang \r\nRehabilitasi Sosial mempunyai tugas pokok melaksanakan sebagian tugas \r\nKepala Dinas Sosial lingkup tuna sosial serta penyandang cacat, anak \r\nnakal dan korban narkotik. </p>\r\n                                \r\n                                <br><br><br>\r\n                                <p style=\"text-align:justify\"><b>Fungsi :</b></p>\r\n                                \r\n								<p style=\"text-align:justify\">Untuk melaksanakan tugas pokok tersebut, Bidang Rehabilitasi Sosial mempunyai fungsi: </p>\r\n                                \r\n                                <p style=\"text-align:justify\">a.	Penyusunan rencana dan program lingkup tuna sosial serta penyandang cacat, anak nakal dan korban narkotik; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">b.	Penyusunan petunjuk teknis lingkup rehabilitasi tuna sosial serta penyandang cacat, anak nakal dan korban narkotik; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">c.	Pelaksanaan dan fasilitasi rehabilitasi tuna sosial serta penyandang cacat, anak nakal dan korban narkotik; dan </p>\r\n                                \r\n                                <p style=\"text-align:justify\">d.	Pelaksanaan monitoring, evaluasi dan pelaporan lingkup tuna sosial serta penyandang cacat, anak nakal dan korban narkotika. </p>\r\n                             \r\n                                 \r\n                                 <br>\r\n                                 <p style=\"text-align:justify\"><b>Daftar Seksi Bidang:</b></p>\r\n                                \r\n                <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">\r\n                    <a>Seksi Tuna Sosial</a></li><li style=\"display:block;text-align:justify;\">\r\n                    <a>Seksi Penyandang Cacat, Anak Nakal, dan Korban Narkotika</a></li></ol>','2014-04-26 11:03:52','Kosong'),(17,2,'Pelayanan Sosial','Hj. Yeti Rohayati, SH.','~/Content/Image/p_yeti.jpg','<p style=\"text-align:justify\"><b>Tugas Pokok :</b></p>\r\n								\r\n                                <p style=\"text-align:justify\">Bidang Pelayanan Sosial mempunnyai tugas pokok melaksanakan sebagian tugas Kepala Dinas Sosial lingkup pelayanan sosial. </p>\r\n                                \r\n                                <br><br><br><br>\r\n                                <p style=\"text-align:justify\"><b>Fungsi :</b></p>\r\n                                \r\n								<p style=\"text-align:justify\">Untuk melaksanakan tugas pokok tersebut, Bidang Pelayanan Sosial mempunyai fungsi : </p>\r\n                                \r\n                                <p style=\"text-align:justify\">a.	Penyusunan rencana dan program lingkup pelayanan sosial dan bantuan korban bencana, serta bantuan dan perlindungan sosial;  </p>\r\n                                \r\n                                <p style=\"text-align:justify\">b.	Penyusunan petunjuk teknis lingkup pelayanan sosial dan bantuan korban bencana, serta bantuan dan perlindungan sosial; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">c.	Pelaksanaan lingkup pelayanan sosial dan bantuan korban bencana, serta bantuan dan perlindungan sosial; dan </p>\r\n                                \r\n                                <p style=\"text-align:justify\">d.	\r\nPembinaan, monitoring, evaluasi dan pelaporan lingkup pelayanan sosial \r\ndan bantuan korban bencana, serta bantuan dan perlindungan sosial. </p>\r\n                                \r\n                       <br>\r\n                                 <p style=\"text-align:justify\"><b>Daftar Seksi Bidang:</b></p>         \r\n                <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">\r\n                    <a>Seksi Pelayanan Sosial dan Bantuan Korban Bencana </a></li><li style=\"display:block;text-align:justify;\">\r\n                    <a>Seksi Bantuan dan Perlindungan Sosial</a></li></ol>','2014-04-26 11:03:44','Kosong'),(18,2,'Pembinaan Rawan Sosial','Ecih Sukaesih, SH.','~/Content/Image/bid6.jpg','<p style=\"text-align:justify\"><b>Tugas Pokok :</b></p>\r\n								\r\n                                <p style=\"text-align:justify\">Bidang \r\nPembinaan Rawan Sosial mempunyai tugas pokok melaksanakan sebagian tugas\r\n Kepala Dinas Sosial lingkup pembinaan rawan sosial. </p>\r\n                                \r\n                                <br><br><br><br>\r\n                                <p style=\"text-align:justify\"><b>Fungsi :</b></p>\r\n                                \r\n								<p style=\"text-align:justify\">Untuk melaksanakan tugas pokok tersebut, Bidang Pembinaan Rawan Sosial mempunyai fungsi : </p>\r\n                                \r\n                                <p style=\"text-align:justify\">a.	\r\npenyusunan rencana dan program lingkup pembinaan rawan sosial anak dan \r\nremaja, serta pembinaan rawan sosial keluarga fakir miskin dan usaha \r\nkesejahteraan sosial; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">b.	\r\npenyusunan petunjuk teknis lingkup pembinaan rawan sosial anak dan \r\nremaja, serta pembinaan rawan sosial keluarga fakir miskin dan usaha \r\nkesejahteraan sosial; </p>\r\n                                \r\n                                <p style=\"text-align:justify\">c.	\r\npelaksanaan lingkup pembinaan rawan sosial anak dan remaja, serta \r\npembinaan rawan sosial keluarga fakir miskin dan usaha kesejahteraan \r\nsosial; dan </p>\r\n                                \r\n                                <p style=\"text-align:justify\">d.	\r\npembinaan, monitoring, evaluasi dan pelaporan lingkup pembinaan rawan \r\nsosial anak dan remaja, serta pembinaan rawan sosial keluarga fakir \r\nmiskin dan usaha kesejahteraan sosial. </p>\r\n                                \r\n                                                      \r\n                                <br>\r\n                                 <p style=\"text-align:justify\"><b>Daftar Seksi Bidang:</b></p>\r\n                                \r\n                <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">\r\n                    <a>Seksi Pembinaan Rawan Sosial Anak dan Remaja </a></li><li style=\"display:block;text-align:justify;\">\r\n                    <a>Seksi Pembinaan Rawan Sosial Keluarga, Fakir Miskin dan UKS</a></li></ol>','2014-04-26 11:03:36','Kosong');

/*Table structure for table `t_content` */

DROP TABLE IF EXISTS `t_content`;

CREATE TABLE `t_content` (
  `content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT 'Misal : Visi Misi',
  `content_type` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT 'Misal : Profile',
  `content` mediumtext NOT NULL COMMENT 'Isi Konten',
  `user_id` int(10) unsigned NOT NULL,
  `url` varchar(100) CHARACTER SET utf8 NOT NULL,
  `content_time` datetime NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `t_content` */

insert  into `t_content`(`content_id`,`content_name`,`content_type`,`content`,`user_id`,`url`,`content_time`) values (21,'Visi dan Misi','Profil','<h3>Visi</h3>\r\n							\r\n								<p style=\"text-align:justify;\">Kesejahteraan sosial dari, oleh, dan untuk masyarakat menuju Bandung yang bermartabat.</p>\r\n                                \r\n                                \r\n								<h3>Misi</h3>\r\n                              \r\n								<ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Mewujudkan \r\nkesejahteraan sosial melalui peningkatan partisipasi sosial dan \r\nmasyarakat, dimana terdapat peran aktif dari masyarakat dalam penanganan\r\n masalah kesejahteraan sosial secara komprehensif.</li><li style=\"display:block;text-align:justify;\">Mewujudkan \r\nkesejahteraan sosial melalui peningkatan rehabilitasi sosial guna \r\nmemulihkan ketidakberdayaan masayarakat dalam melaksanakan fungsi \r\nsosialnya.</li><li style=\"display:block;text-align:justify;\">Mewujudkan \r\nkesejahteraan sosial melalui peningkatan pelayanan sosial, yang \r\nmengandung pengertian optimalisasi pelayanan terhadap Penyandang Masalah\r\n Kesejahteraan Sosial (PMKS).</li><li style=\"display:block;text-align:justify;\">Mewujudkan kesejahteraan sosial melalui peningkatan terhadap pembinaan rawan sosial keluarga dan anak.</li></ol>',2,'kosong','2014-04-22 20:06:01'),(23,'Program Kerja','Profil','<h2> A.	Program/Kegiatan Urusan Wajib Sosial </h2> <br>\r\n                            1.	Program Pemberdayaan Fakir Miskin, \r\nKomunitas Adat Terpencil (KAT), dan Penyandang Masalah Sosial lainnya  :\r\n <br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Kegiatan\r\n peningkatan kemampuan (capacity building) petugas dan pendamping sosial\r\n  pemberdayaan fakir miskin, KAT, dan PMKS lainnya </li><li style=\"display:block;text-align:justify;\">Kegiatan pelatihan keterampilan berusaha bagi keluarga miskin</li><li style=\"display:block;text-align:justify;\">Kegiatan pengadaan sarana dan prasaran pendukung usaha bagi keluarga miskin</li><li style=\"display:block;text-align:justify;\">Kegiatan pelatihan keterampilan bagi Penyandang Masalah Kesejahteraan Sosial</li><li style=\"display:block;text-align:justify;\">Kegiatan monitoring, Evaluasi dan pelaporan</li></ol><br>\r\n\r\n\r\n                            2.	Program Pelayanan dan Rehabilitasi Kesejahteraan Sosial :<br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Pelayanan dan perlindungan sosial hukum bagi korban perdagangan perempuan dan anak</li><li style=\"display:block;text-align:justify;\">Pelaksanaan KIE Konseling dan kampanye sosial bagi Penyandang Masalah Kesejahteraan Sosial</li><li style=\"display:block;text-align:justify;\">Penyusunan kebijakan pelayanan dan rehabilitasi sosial bagi PMKS</li><li style=\"display:block;text-align:justify;\">Penanganan masalah-masalah strategis cepat tanggap darurat dan kejadian luar biasa</li><li style=\"display:block;text-align:justify;\">Kajian Identifikasi dan Inventarisasi Data Penyandang Masalah Kesejahteraan Sosial</li></ol><br>\r\n\r\n                            3.	Program Pembinaan Anak Terlantar  :<br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Kegiatan pelatihan keterampilan dan praktek belajar kerja bagi anak terlantar</li><li style=\"display:block;text-align:justify;\">Kegiatan penyusunan data dan analisis permasalahan anak terlantar</li><li style=\"display:block;text-align:justify;\">Kegiatan pengembangan bakat dan keterampilan anak terlantar</li><li style=\"display:block;text-align:justify;\">Kegiatan peningkatan keterampilan tenaga pembinaan anak terlantar</li><li style=\"display:block;text-align:justify;\">Kegiatan monitoring, evaluasi dan pelaporan</li><li style=\"display:block;text-align:justify;\">Kegiatan pelayanan sosial bagi anak jalanan melalui pemberdayaan orang tua anak</li><li style=\"display:block;text-align:justify;\">Kegiatan peningkatan kualitas sarana dan prasarana pelayanan sosial anak</li><li style=\"display:block;text-align:justify;\">Kegiatan pelatihan keterampilan dan prtaktek belajar kerja bagi remaja putus sekolah</li></ol><br>\r\n\r\n                            4.	Program pembinaan para penyandang cacat dan eks-trauma :<br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Pendidikan dan pelatihan bagi penyandang cacat dan eks-trauma</li><li style=\"display:block;text-align:justify;\">Pendayagunaan penyandang cacat dan eks-trauma</li><li style=\"display:block;text-align:justify;\">Peningkatan keterampilan tenaga pelatih dan pendidik</li></ol><br>\r\n\r\n\r\n                            5.	Program Pembinaan Panti Asuhan / Panti Jompo:<br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Kegiatan Operasi dan pemeliharaan saranan dan prasarana panti asuhan/jompo</li><li style=\"display:block;text-align:justify;\">Kegiatan Pendidikan dan pelatihan bagi penghuni panti asuhan/panti jompo</li><li style=\"display:block;text-align:justify;\">Kegiatan peningkatan keterampilan tenaga pelatih dan pendidik</li><li style=\"display:block;text-align:justify;\">Kegiatan monitoring, evaluasi, dan pelaporan</li><li style=\"display:block;text-align:justify;\">Kegiatan pengadaan prasarana panti persinggahan</li></ol><br>\r\n\r\n                            6.	Program Pembinaan Eks-Penyandang Penyakit\r\n Sosial (Eks-Narapidana, PSK, Narkoba dan Penyakit Sosial lainnya) :<br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Kegiatan pendidikan dan pelatihan berusaha bagi eks penyandang penyakit sosial Pemberdayaan eks penyandang penyakit sosial</li><li style=\"display:block;text-align:justify;\">Kegiatan pembangunan pusat bimbingan/konseling bagi eks penyandang penyakit sosialo</li><li style=\"display:block;text-align:justify;\">Kegiatan pemantauan kemajuan perubahan sikap mental eks penyandang penyakit sosial</li><li style=\"display:block;text-align:justify;\">Kegiatan pemberdayaan eks penyandang penyakit sosial</li><li style=\"display:block;text-align:justify;\">Kegiatan monitoring, evaluasi dan pelaporan/li&gt;\r\n\r\n                            </li></ol><br>\r\n\r\n\r\n                            7.	Program Pemberdayaan Kelembagaan Kesejahteraan Sosial : <br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Peningkatan peran aktif masyarakat dan dunia usaha</li><li style=\"display:block;text-align:justify;\">Peningkatan jaringan kerjasama pelaku-pelaku usaha kesejahteraan sosial</li><li style=\"display:block;text-align:justify;\">Peningkatan kualitas SDM kesejahteraan sosial masyarakat</li><li style=\"display:block;text-align:justify;\">Kegiatan pengembangan model kelembagaan perlindungan sosiall</li><li style=\"display:block;text-align:justify;\">Penyuluhan sosial keliling</li><li style=\"display:block;text-align:justify;\">Kegiatan penertiban dan pengawasan  undian dan sumbangan sosial</li><li style=\"display:block;text-align:justify;\">Kegiatan pendataan dan penilaian pelaksanaan program kepedulian sosial (CSR)</li><li style=\"display:block;text-align:justify;\">Kegiatan jasa konsultasi pelaksanaan undian gratis berhadiah dan sumbangan sosial di Kota Bandung</li></ol><br>\r\n\r\n                            8.	Program Peningkatan Pelayanan Lanjut Usia :<br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Kegiatan peningkatan pelayanan sosial lanjut usia luar panti</li></ol><p><br></p><h2> B. Program dan Kegiatan Non-Urusan (Administrasi Umum)</h2> <br>\r\n                            1.	Program Pelayanan Administrasi Perkantoran : <br>\r\n                            <ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Penyediaan jasa komunikasi, sumber daya air dan listrik</li><li style=\"display:block;text-align:justify;\">Penyediaan Jasa kebersihan</li><li style=\"display:block;text-align:justify;\">Penyediaan alat tulis kantor</li><li style=\"display:block;text-align:justify;\">	Penyediaan barang cetakan dan penggandaan</li><li style=\"display:block;text-align:justify;\">	Penyediaan peralatan dan perlengkapan kantor</li><li style=\"display:block;text-align:justify;\">Penyediaan peralatan rumah tangga</li><li style=\"display:block;text-align:justify;\">Penyediaan makanan dan minuman</li><li style=\"display:block;text-align:justify;\">Rapat-rapat koordinasi dan konsultasi keluar daerah</li>\r\n\r\n\r\n\r\n                                2.Program Peningkatan Sarana dan Prasarana Aparatur :<br><ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Pengadaan kendaraan dinas/operasional</li><li style=\"display:block;text-align:justify;\">	Pengadaan Peralatan Gedung Kantor</li><li style=\"display:block;text-align:justify;\">	Pengadaan Perlengkapan Peralatan Aparatur</li><li style=\"display:block;text-align:justify;\">	Pemeliharaan rutin/berkala gedung kantor</li><li style=\"display:block;text-align:justify;\">	Pemeliharaan rutin/berkala Kendaraan dinas/operasional</li><li style=\"display:block;text-align:justify;\">	Pemeliharaan rutin/berkala peralatan gedung kantorli&gt;\r\n                            </li></ol><br>\r\n\r\n                            	3.	Program Peningkatan Disiplin Aparatur :<br><ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">	Pengadaan pakaian dinas beserta perlengkapannya</li><li style=\"display:block;text-align:justify;\">	Pengadaan pakaian khusus hari-hari tertentu</li></ol><br>\r\n\r\n                            4.	Program Peningkatan Kapasitas Sumber Daya Aparatur, yang terdiri atas :<br><ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Pendidikan dan Pelatihan Formal</li><li style=\"display:block;text-align:justify;\">Kegiatan Pembinaan Kinerja Aparatur</li></ol><br>\r\n\r\n\r\n                            5. Program Peningkatan dan Pengembangan Sistem Pelaporan Capaian Kinerja dan Keuangan :<br><ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Penyusunan laporan capaian kinerja dan ikhtisar realisasi kinerja SKPD</li><li style=\"display:block;text-align:justify;\">Penyusunan pelaporan keuangan akhir tahun</li></ol></ol>',2,'kosong','2014-04-22 20:08:06'),(33,' Persyaratan Penelitian','Prosedur','<ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Surat Permohonan dari Kampus/Sekolah ditujukan kepada BKBPM kota Bandung</li><li style=\"display:block;text-align:justify;\">Fotocopy identitas diri</li><li style=\"display:block;text-align:justify;\">Pass foto ukuran 3 x 4, 1  lembar</li><li style=\"display:block;text-align:justify;\">Proposal bagi yang akan melaksanakan penelitian</li><li style=\"display:block;text-align:justify;\">Bagi Siswa/i atau Mahasiswa/i dari luar provinsi Jawa Barat, harus ada ijin penelitian dari BKBPM provinsi Jawa Barat</li><li style=\"display:block;text-align:justify;\">Bagi Siswa/i atau Mahasiswa/i dari luar negeri, harus ada permohonan ijin penelitian dari DEPDAGRI</li></ol>',2,'kosong','2014-04-27 14:07:21'),(34,' Persyaratan Kerja Praktek','Prosedur','<ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Surat Permohonan dari Kampus/Sekolah ditujukan kepada BKBPM kota Bandung</li><li style=\"display:block;text-align:justify;\">Fotocopy identitas diri</li><li style=\"display:block;text-align:justify;\">Pass foto ukuran 3 x 4, 1  lembar</li><li style=\"display:block;text-align:justify;\">Proposal bagi yang akan melaksanakan penelitian</li><li style=\"display:block;text-align:justify;\">Bagi Siswa/i atau Mahasiswa/i dari luar provinsi Jawa Barat, harus ada ijin kerja praktek dari BKBPM provinsi Jawa Barat</li><li style=\"display:block;text-align:justify;\">Bagi Siswa/i atau Mahasiswa/i dari luar negeri, harus ada permohonan ijin kerja praktek dari DEPDAGRI</li></ol>',2,'kosong','2014-04-27 14:10:31'),(36,'Pelaksanaan Program Keluarga Harapan','Prosedur','<ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Seleksi dan Penetapan lokasi PKH</li><li style=\"display:block;text-align:justify;\">Sosialisasi dan Rapat Koordinasi</li><li style=\"display:block;text-align:justify;\">Rekruitmen dan Diklat Pendamping-Operator PKH</li><li style=\"display:block;text-align:justify;\">Pembentukan Sekretariat UPPKH Kab/Kota (Perangkat SIM PKH)</li><li style=\"display:block;text-align:justify;\">Pertemuan Awal dan Validasi calon Peserta PKH</li><li style=\"display:block;text-align:justify;\">Pembayaran pertama kali dan Rekonsiliasi </li><li style=\"display:block;text-align:justify;\">Bimbingan Teknis (Reguler dan Service Provider)</li><li style=\"display:block;text-align:justify;\">Verifikasi komitmen peserta PKH pada layanan Kesehatan dan Pendidikan </li><li style=\"display:block;text-align:justify;\">Pembayaran berdasarkan verifikasi  </li><li style=\"display:block;text-align:justify;\">Monitoring, Evaluasi dan Pelaporan </li></ol>',2,'kosong','2014-04-27 14:16:45'),(37,'Penanganan Gangguan Jiwa','Prosedur','<ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Masyarakat, LSM, atau Keluarga melaporkan adanya kasus gangguan jiwa ke Puskesmas atau Dinas Kesehatan.</li><li style=\"display:block;text-align:justify;\">Puskesmas melaporkan informasi kasus gangguan jiwa ke Dinas Kesehatan dan Kepolisian atau Kecamatan untuk di identifikasi.</li><li style=\"display:block;text-align:justify;\">Dinas Kesehatan menghubungi RSJ provinsi Jabar untuk kepastian ruang perawatan.</li><li style=\"display:block;text-align:justify;\">Dinas Kesehatan menghubungi UPT Yankesmob untuk transportasi atau Kepolisian/Kecamatan menyediakan transportasi. </li><li style=\"display:block;text-align:justify;\">Pasien dirawat di RSJ Provinsi Jawa Barat</li><li style=\"display:block;text-align:justify;\">Setelah pasien tenang, RSJ Provinsi Jabar menghubungi Dinas Kesehatan untuk memulangkan pasien (rawat jalan saja).</li><li style=\"display:block;text-align:justify;\">Untuk pasien yang tidak punya keluarga RSJ dapat menghubungi Dinas Sosial untuk penampungan pasien di rumah singgah</li></ol>',2,'kosong','2014-04-27 14:19:35'),(38,'Anak Terlantar atau Anak Jalanan','Prosedur','<ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Pendekatan Awal</li><p align=\"justify\">	\r\n\r\n1.	Orientasi :  yaitu melakukan pengamatan lingkungan sosial dimana anak\r\n jalanan berada, yang meliputi kebiasaan dan kegiatan anak ketika berada\r\n dalam masyarakat tempat tinggalnya. <br>\r\n2.	Identifikasi : yaitu kegiatan untuk menggali dan mengetahui  tentang \r\nstatus anak jalanan yang menyangkut, nama anak, nama orang tua, \r\npendidikan anak, pendidikan orang tua, alamat, tanggal lahir, \r\nhobi/kebiasaan, dan hal-hal lain yang diperlukan.<br>\r\n3.	Motivasi : yaitu kegiatan untuk memberikan dorongan dan motivasi anak\r\n agar mampu melakukan aktifitas sosialnya yang sesuai dengan fungsi \r\nsosialnya sebagai anak.<br>\r\n4.	Seleksi : yaitu kegiatan yang bertujuan untuk memilah jenis \r\npermasalahan sosial anak maupun jenis kemampuan dan keterampilan yang \r\ndimiliki anak sehingga dapat diberikan pelayanan sosial yang sesuai \r\ndengan jenis permasalahan maupun kemampuan anak.<br>\r\n\r\n</p><li style=\"display:block;text-align:justify;\">Penerimaan</li><p align=\"justify\">					\r\n1.	Registrasi : yaitu kegiatan pencatatan anak untuk diikutsertakan dalam program pelayanan sosial bagi anak jalanan.<br>\r\n2.	Assesment : yaitu kegiatan untuk mendalami permasalahan yang dihadapi\r\n oleh anak sehingga anak berada dijalanan, pada kegiatan ini dapat \r\ndiketahui alasan keberadaan anak dijalanan.<br>\r\n3.	Penetapan Program dan Pelayanan : yaitu menetapkan dan menentukan \r\nprogram kegiatan dan pelayanan yang sesuai dengan kebutuhan dan \r\nkemampuan anak berdasarkan hasil assesment.<br>\r\n</p><li style=\"display:block;text-align:justify;\">Penanganan</li><p align=\"justify\">					\r\nPenanganan anak jalanan terbagi dalam dua kelompok, yaitu :\r\n<br>\r\n1.	Bagi kelompok anak jalanan yang berasal dari luar Kota Bandung, \r\npenanganannya  dikembalikan ke daerah asal, berkoordinasi dengan \r\ninstansi terkait yang menangani anak jalanan di daerah asal anak. <br><br>\r\n2.	Bagi kelompok anak jalanan yang berasal dari Kota Bandung, penanganannya melalui Bimbingan Sosial dan Keterampilan yaitu :<br>\r\na.	Bimbingan Fisik <br>\r\nb.	Bimbingan Mental<br>\r\nc.	Bimbingan Sosial<br>\r\nd.	Bimbingan Keterampilan (berusaha, kesenian, dll).\r\n</p><li style=\"display:block;text-align:justify;\">Resosialisasi</li><p align=\"justify\">\r\n1.	 Sistem perlindungan anak yang efektif mensyarakatkan adanya \r\nkomponen-komponen yang saling terkait. Komponen-komponen ini meliputi \r\nsistem kesejahteraan sosial bagi anak-anak dan keluarga, Selain itu, \r\njuga diperlukan kerangka hukum dan kebijakan yang mendukung serta sistem\r\n data dan informasi untuk perlindungan anak. Di tingkat masyarakat, \r\nberbagai komponen tersebut harus disatukan dalam rangkaian kesatuan \r\npelayanan perlindungan anak yang mendorong kesejahteraan dan \r\nperlindungan anak dan meningkatkan kapasitas keluarga untuk memenuhi \r\ntanggung jawab mereka. \r\n<br><br>\r\n2.	 Rangkaian pelayanan perlindungan anak di tingkat masyarakat dimulai \r\ndari layanan pencegahan primer dan sekunder sampai layanan penanganan \r\ntersier. Layanan pencegahan primer bertujuan untuk memperkuat kapasitas \r\nmasyarakat secara menyeluruh dalam pengasuhan anak dan memastikan \r\nkeselamatan mereka. Layanan ini meliputi kegiatan-kegiatan yang mengubah\r\n sikap dan perilaku, memperkuat keterampilan orangtua, dan menyadarkan \r\nmasyarakat tentang dampak yang  tidak diinginkan dari kekerasan terhadap\r\n anak. Layanan pencegahan sekunder atau layanan intervensi dini \r\ndifokuskan pada keluarga dan anak-anak yang beresiko, dilakukan dengan \r\nmengubah keadaan sebelum perilaku kekerasan menimbulkan dampak buruk \r\nsecara nyata terhadap anak-anak, misalnya melalui konseling dan mediasi \r\nkeluarga serta pemberdayaan ekonomi. Intervensi tersier menangani \r\nsituasi dimana anak sudah dalam keadaan krisis sebagai akibat kekerasan,\r\n perlakuan salah, eksploitasi, penelantaran, atau tindakan-tindakan \r\nburuk lainnya. Oleh karena itu, intervensi ini bertujuan untuk \r\nmembebaskan anak-anak dari dampak buruk atau, jika dianggap layak, \r\nmelakukan pengawasan terstruktur dan memberikan layanan dukungan. \r\nMekanisme pencegahan dianggap lebih tepat dibandingkan intervensi \r\ntersier atau reaktif.\r\n</p><li style=\"display:block;text-align:justify;\">Bimbingan Lanjut</li><p align=\"justify\"> Bimbingan lanjut diberikan kepada klien yang \r\ntelah mendapatkan pembinaan dan telah mampu menjalankan fungsi \r\nsosialnya, dalam tahap ini diperlukan Home Visit oleh petugas sosial \r\nterhadap keluarga anak.</p><li style=\"display:block;text-align:justify;\">Terminasi</li><p align=\"justify\"> Terminasi dapat dilakukan apabila klien \r\ndianggap telah dapat menjalankan aktifitas sosial  sesuai dengan fungsi \r\nsosialnya dimasyarakat.  </p></ol>',2,'kosong','2014-04-27 14:21:39'),(39,'Rehabilitasi PACA','Prosedur','<div class=\"boxInfo examInfo\"><li>RUJUKAN</li><br>\r\n					\r\n					<ol class=\"cList arrow1Li\"><li style=\"display:block;text-align:justify;\">Surat Pengantar dari RT/RW/Lurah/Camat</li><li style=\"display:block;text-align:justify;\">Pemeriksaan Kelengkapan</li><li>Dibuatkan rekomendasi ke panti sesuai kebutuhan klient</li><li style=\"display:block;text-align:justify;\"><b> Waktu : satu - dua hari</b></li></ol><br>\r\n\r\n\r\n\r\n                    <li style=\"display:block;text-align:justify;\">BIMBINAN SOSIAL DAN KETERAMPILAN</li><br>\r\n                    <p align=\"justify\">\r\n                    	Penyampaian informasi ke  Kecamatan/Yayasan/LSM.\r\n                    	Pendataan, seleksi, pelaksanaan bimbingan, dan \r\nketerampilan, pemberian bantuan/stimulan, monitoring dan evaluasi, \r\npelaporan.  <b> Waktu : tiga bulan </b>\r\n\r\n                    </p>\r\n\r\n                    <li style=\"display:block;text-align:justify;\">PENDAYAGUNAAN/PEMBERIAN ALAT BANTU</li><br>\r\n                    \r\n                      <p align=\"justify\">\r\n                    	Penyampaian informasi ke \r\nKecamatan/Yayasan/LSM,seleksi, pemeriksaan, pemberian bantuan, \r\nmonitoring, evaluasi, dan pelaporan, <b> Waktu : tiga bulan </b>.\r\n                    	\r\n\r\n                    </p>\r\n\r\n\r\n                    <li style=\"display:block;text-align:justify;\">BANTUAN MODAL USAHA</li><br>\r\n\r\n                       <p align=\"justify\">\r\n                    	Penyampaian informasi ke Kecamatan/Yayasan/LSM, \r\nPengajuan proposal ke klient, seleksi melalui home visite dan \r\npersyaratan kelengkapan pengajuan proposal ke Walikota dan Gubernur. \r\nRealisasi melalui rekening masing-masing, dan pelaporan. <b> Waktu : satu tahun </b>\r\n                    	\r\n                    </p>\r\n\r\n\r\n\r\n\r\n                    <li style=\"display:block;text-align:justify;\">PEMBERIAN ASISTENSI SOSIAL KHUSUS PACA BERAT</li><br>\r\n\r\n                     <p align=\"justify\">\r\n                    	Penyampaian informasi ke Kecamatan/Yayasan/LSM, \r\nPendataan, home visite dan seleksi kelengkapan persyaratan, pengajuan \r\ncalon penerima, penerimaan SK, pendampingan, pengisian kartu penerima, \r\npendistribusian kartu, realisasi bantuan langsung ke penerima oleh \r\npetugas POS, monitoring, evaluasi dan pelaporan. <b> Waktu : satu tahun </b>\r\n                    </p>\r\n\r\n                    <li style=\"display:block;text-align:justify;\">PEMANTAPAN TUGAS PENDAMPING</li><br>\r\n\r\n                    <p align=\"justify\">\r\n                    	Penyampaian informasi ke Kecamatan/Yayasan/LSM, \r\nseleksi kelengkapan persyaratan, penentuan peserta, pelaksanaan \r\npemantapan, pelaporan, pelaksanaan, dan pendampingan ke klient. <b> Waktu : satu tahun </b>\r\n                    	\r\n                    </p></div>',2,'kosong','2014-04-27 14:22:30');

/*Table structure for table `t_csr` */

DROP TABLE IF EXISTS `t_csr`;

CREATE TABLE `t_csr` (
  `csr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `csr_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `csr_address` text CHARACTER SET utf8 NOT NULL,
  `csr_value` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`csr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_csr` */

/*Table structure for table `t_csr_activity` */

DROP TABLE IF EXISTS `t_csr_activity`;

CREATE TABLE `t_csr_activity` (
  `csr_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `csr_ph_id` int(11) NOT NULL,
  `csr_activity_content` text NOT NULL,
  `csr_activity_path` varchar(200) DEFAULT NULL,
  `csr_activity_date` datetime NOT NULL,
  PRIMARY KEY (`csr_activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `t_csr_activity` */

insert  into `t_csr_activity`(`csr_activity_id`,`user_id`,`csr_ph_id`,`csr_activity_content`,`csr_activity_path`,`csr_activity_date`) values (1,2,1,'awddw','D:\\Project OzanSoft\\E-Sosial\\E-Sosial\\Content\\Image\\Gambar(5) (1.jpg','2014-04-12 14:15:49');

/*Table structure for table `t_csr_ph` */

DROP TABLE IF EXISTS `t_csr_ph`;

CREATE TABLE `t_csr_ph` (
  `csr_ph_id` int(11) NOT NULL AUTO_INCREMENT,
  `csr_ph_name` varchar(100) NOT NULL,
  `csr_ph_address` text NOT NULL,
  `csr_ph_activity` text NOT NULL,
  `csr_ph_date` datetime NOT NULL,
  PRIMARY KEY (`csr_ph_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `t_csr_ph` */

insert  into `t_csr_ph`(`csr_ph_id`,`csr_ph_name`,`csr_ph_address`,`csr_ph_activity`,`csr_ph_date`) values (6,'Ozansoft','Tikukur dikikuk','Pendataan warga miskin','2014-04-13 11:42:04'),(7,'Creatix','Dago','Desain Rumah','2014-04-13 11:42:51'),(8,'Ozansoft','Tikukur di kikiu','Mendata Warga','2014-04-13 11:43:57');

/*Table structure for table `t_dokumentasi` */

DROP TABLE IF EXISTS `t_dokumentasi`;

CREATE TABLE `t_dokumentasi` (
  `dokumentasi_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id dokumentasi',
  `album_id` int(11) NOT NULL COMMENT 'join ke album foto untuk ambil nama album',
  `dokumentasi_path` varchar(200) NOT NULL COMMENT 'lokasi file',
  `dokumentasi_title` varchar(100) NOT NULL COMMENT 'nama foto',
  `dokumentasi_type` enum('foto','video') NOT NULL COMMENT 'tipe file',
  `dokumentasi_date` datetime NOT NULL COMMENT 'tanggal memasukan file',
  PRIMARY KEY (`dokumentasi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `t_dokumentasi` */

/*Table structure for table `t_donatur` */

DROP TABLE IF EXISTS `t_donatur`;

CREATE TABLE `t_donatur` (
  `donatur_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `donatur_name` varchar(50) NOT NULL,
  `donatur_phone` varchar(12) NOT NULL,
  `donatur_address` text NOT NULL,
  `donatur_email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `donasi` bigint(20) NOT NULL,
  `pembayaran` varchar(25) CHARACTER SET utf8 NOT NULL,
  `report_id` int(10) NOT NULL,
  PRIMARY KEY (`donatur_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `t_donatur` */

/*Table structure for table `t_download` */

DROP TABLE IF EXISTS `t_download`;

CREATE TABLE `t_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id download',
  `download_title` varchar(100) NOT NULL COMMENT 'judul file download',
  `download_path` varchar(100) NOT NULL COMMENT 'lokasi file download',
  `download_desc` text COMMENT 'deskripsi file download',
  `download_date` datetime NOT NULL COMMENT 'tanggal memasukan data',
  `user_id` int(11) NOT NULL COMMENT 'join ke t_user',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `t_download` */

insert  into `t_download`(`download_id`,`download_title`,`download_path`,`download_desc`,`download_date`,`user_id`) values (12,'Coba','~/Content/Document/DATA PSKS 2013.xlsx','Coba','2014-04-29 20:31:36',2);

/*Table structure for table `t_file` */

DROP TABLE IF EXISTS `t_file`;

CREATE TABLE `t_file` (
  `file_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `file_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `file_location` varchar(200) CHARACTER SET utf8 NOT NULL,
  `file_url` varchar(200) CHARACTER SET utf8 NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `mime_type` varchar(100) CHARACTER SET utf8 NOT NULL,
  `file_category` varchar(75) CHARACTER SET utf8 NOT NULL,
  `file_parent` int(20) NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

/*Data for the table `t_file` */

insert  into `t_file`(`file_id`,`file_title`,`file_name`,`file_location`,`file_url`,`user_id`,`mime_type`,`file_category`,`file_parent`) values (94,'Jadwal sms 6.jpg','Jadwal sms 6.jpg','D:\\Project OzanSoft\\E-Sosial\\E-Sosial\\Content\\Image\\Jadwal sms 6.jpg','~/Content/Image/Jadwal sms 6.jpg',2,'.jpg','Berita',75),(95,'2012-03-02 14.39.00.jpg','2012-03-02 14.39.00.jpg','D:\\Project OzanSoft\\E-Sosial\\E-Sosial\\Content\\Image\\2012-03-02 14.39.00.jpg','~/Content/Image/2012-03-02 14.39.00.jpg',2,'.jpg','Berita',76);

/*Table structure for table `t_filemeta` */

DROP TABLE IF EXISTS `t_filemeta`;

CREATE TABLE `t_filemeta` (
  `fmeta_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(20) unsigned NOT NULL,
  `fmeta_key` varchar(255) CHARACTER SET utf8 NOT NULL,
  `fmeta_value` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`fmeta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_filemeta` */

/*Table structure for table `t_kegiatan` */

DROP TABLE IF EXISTS `t_kegiatan`;

CREATE TABLE `t_kegiatan` (
  `kegiatan_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `wilayah_id` int(11) NOT NULL,
  `kegiatan_nama` varchar(100) NOT NULL COMMENT 'judl kegiatan',
  `kegiatan_deskripsi` text NOT NULL COMMENT 'deskripsi kegiatan untuk relwan',
  `kegiatan_tgl_update` datetime NOT NULL COMMENT 'tanggal kegiatan dibuat',
  `kegiatan_tgl_acara` datetime NOT NULL COMMENT 'tanggal pelaksanaan acara',
  PRIMARY KEY (`kegiatan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `t_kegiatan` */

insert  into `t_kegiatan`(`kegiatan_id`,`user_id`,`wilayah_id`,`kegiatan_nama`,`kegiatan_deskripsi`,`kegiatan_tgl_update`,`kegiatan_tgl_acara`) values (2,2,21,'Coba','<u>Coba</u>','2014-04-11 05:07:50','2014-04-23 09:30:00');

/*Table structure for table `t_kesejahteraan` */

DROP TABLE IF EXISTS `t_kesejahteraan`;

CREATE TABLE `t_kesejahteraan` (
  `ks_id` int(10) NOT NULL AUTO_INCREMENT,
  `ks_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `ks_jumlah` int(20) NOT NULL,
  `ks_type` varchar(30) CHARACTER SET utf8 NOT NULL,
  `ks_satuan` int(11) NOT NULL,
  `ks_date` datetime NOT NULL,
  `ks_year` year(4) DEFAULT NULL,
  PRIMARY KEY (`ks_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

/*Data for the table `t_kesejahteraan` */

insert  into `t_kesejahteraan`(`ks_id`,`ks_name`,`ks_jumlah`,`ks_type`,`ks_satuan`,`ks_date`,`ks_year`) values (58,'Karang Taruna',151,'PSKS',2,'2014-04-27 17:27:12',2013),(57,'Anak Terlantar',354,'PMKS',2,'2014-04-27 17:26:19',2012);

/*Table structure for table `t_news` */

DROP TABLE IF EXISTS `t_news`;

CREATE TABLE `t_news` (
  `news_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `news_date` datetime NOT NULL,
  `news_title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `news_content` text NOT NULL,
  `news_status` varchar(20) CHARACTER SET utf8 NOT NULL,
  `news_modified` datetime NOT NULL,
  `news_parent` int(20) NOT NULL,
  `news_type` varchar(20) CHARACTER SET utf8 NOT NULL,
  `news_url` varchar(200) CHARACTER SET utf8 NOT NULL,
  `news_category` int(11) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

/*Data for the table `t_news` */

insert  into `t_news`(`news_id`,`user_id`,`news_date`,`news_title`,`news_content`,`news_status`,`news_modified`,`news_parent`,`news_type`,`news_url`,`news_category`) values (74,2,'2014-04-21 17:52:11','uhuhu','awd','tidak_aktif','2014-04-21 17:52:11',0,'umum','Kosong',16),(75,2,'2014-04-21 17:52:11','uhuhu','<div align=\"center\">Coba</div>','aktif','2014-04-21 17:55:54',74,'umum','Kosong',16);

/*Table structure for table `t_news_category` */

DROP TABLE IF EXISTS `t_news_category`;

CREATE TABLE `t_news_category` (
  `news_category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `category_title` varchar(70) CHARACTER SET utf8 NOT NULL,
  `category_date` datetime NOT NULL,
  PRIMARY KEY (`news_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `t_news_category` */

insert  into `t_news_category`(`news_category_id`,`user_id`,`category_title`,`category_date`) values (16,2,'Kegiatan','2014-04-05 01:23:39'),(15,2,'Umum','2014-04-05 01:23:18');

/*Table structure for table `t_organisasi` */

DROP TABLE IF EXISTS `t_organisasi`;

CREATE TABLE `t_organisasi` (
  `t_organisasi` int(11) NOT NULL AUTO_INCREMENT,
  `t_nama` varchar(100) NOT NULL COMMENT 'Nama Penanggung Jawab',
  `t_jabatan` varchar(100) NOT NULL COMMENT 'jabatan PJ',
  `t_path` varchar(200) NOT NULL COMMENT 'foto',
  PRIMARY KEY (`t_organisasi`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `t_organisasi` */

insert  into `t_organisasi`(`t_organisasi`,`t_nama`,`t_jabatan`,`t_path`) values (4,'Drs. Kelly Solihin, M.Si','Kepala Dinas Sosial','~/Content/Image/p_kelly.jpg'),(5,'Medi Mahendra, AP., S.Sos., M.Si','Sekretaris','~/Content/Image/p_medi.jpg'),(6,'Hj. Euis Jubaedah, BA','Kepala Sub bagian Umum dan Kepegawaian','~/Content/Image/p_euis.jpg'),(7,'Hj. Ida Rafni, SH, M.Kn','Kepala Sub bagian keuangan dan Program','~/Content/Image/p_idah.jpg'),(8,'Dra. Yanti Erlinawati, M.Si','Kepala Bidang Partisipasi sosial dan Masyarakat','~/Content/Image/p_yanti.jpg'),(9,'Yayah, SH','Kepala Seksi Penyuluhan, Pemberdayaan, dan Partisipasi Sosial','~/Content/Image/p_yayah.jpg'),(10,'Iis Kurnaesah, SH, MH','Kepala Seksi Pengumpulan, Pengawasan Undian, dan Sumbangan Sosial','~/Content/Image/p_iis.jpg'),(11,'Rd. Muh. Nurahman, SH','Kepala Bidang Rehabilitasi Sosial 	','~/Content/Image/p_nur.jpg'),(12,'Drs. H. Yogaswara Hendramurti','Kepala Seksi Tuna Sosial','~/Content/Image/p_yoga.jpg'),(13,'Dewi indra Afianti., SH','Kepala Seksi Penyandang Cacat, Anak Nakal, dan Korban Narkotika 	','~/Content/Image/p_dewi.jpg'),(14,'Hj. Yeti Rohayati, SH','Kepala Bidang Pelayanan Sosial','~/Content/Image/p_yeti.jpg'),(15,'Rd. Baran Subagia., S.Sos','Kepala Seksi Pelayanan Sosial dan Bantuan Korban Bencana','~/Content/Image/p_baran.jpg'),(16,'Dra. Pipin Latifah','Kepala Seksi Bantuan dan Perlindungan Sosial','~/Content/Image/p_pipin.jpg'),(17,'Ecih Sukaesih, SH','Kepala Bidang Pembinaan Rawan Sosial','~/Content/Image/p_ecih.jpg'),(18,'Drs. Asep Sugandi','Kepala Seksi Pembinaan Rawan Sosial Anak dan Remaja','~/Content/Image/p_asep.jpg'),(19,'Sarifah, SH','Kepala Seksi Pembinaan Rawan Sosial Keluarga, Fakir Miskin, dan UKS','~/Content/Image/p_ipah.jpg');

/*Table structure for table `t_panti` */

DROP TABLE IF EXISTS `t_panti`;

CREATE TABLE `t_panti` (
  `panti_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `panti_name` varchar(30) CHARACTER SET utf8 NOT NULL,
  `wil_id` int(10) unsigned NOT NULL,
  `panti_lead` varchar(100) CHARACTER SET utf8 NOT NULL,
  `penghuni` int(10) NOT NULL,
  `panti_phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `panti_address` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`panti_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_panti` */

/*Table structure for table `t_program` */

DROP TABLE IF EXISTS `t_program`;

CREATE TABLE `t_program` (
  `prog_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `prog_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prog_description` text CHARACTER SET utf8 NOT NULL,
  `csr_id` int(10) NOT NULL,
  `prog_place` varchar(100) CHARACTER SET utf8 NOT NULL,
  `prog_time` datetime NOT NULL,
  `prog_type` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`prog_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `t_program` */

/*Table structure for table `t_report` */

DROP TABLE IF EXISTS `t_report`;

CREATE TABLE `t_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `report_author` varchar(50) CHARACTER SET utf8 NOT NULL,
  `wil_id` int(10) unsigned NOT NULL,
  `address` text CHARACTER SET utf8 NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `report_content` text CHARACTER SET utf8 NOT NULL,
  `report_time` datetime NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `t_report` */

insert  into `t_report`(`report_id`,`report_author`,`wil_id`,`address`,`phone`,`report_content`,`report_time`) values (20,'Ujang',23,'Bandung','2312312','Bencana kebakaran telah terjadi di wilayah ini<br>','2014-04-22 11:46:43');

/*Table structure for table `t_satuan` */

DROP TABLE IF EXISTS `t_satuan`;

CREATE TABLE `t_satuan` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `satuan` varchar(50) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `t_satuan` */

insert  into `t_satuan`(`id_satuan`,`satuan`,`tanggal`) values (1,'Keluarga','2014-03-22 10:30:00'),(2,'Orang','2014-03-22 10:30:50');

/*Table structure for table `t_seksi` */

DROP TABLE IF EXISTS `t_seksi`;

CREATE TABLE `t_seksi` (
  `seksi_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id_seksi',
  `user_id` int(11) NOT NULL COMMENT 'join ke t_user',
  `seksi_title` varchar(50) NOT NULL COMMENT 'judul',
  `seksi_name` varchar(50) NOT NULL COMMENT 'penanggung jawab',
  `seksi_foto` varchar(200) NOT NULL COMMENT 'foto penanggung jawab',
  `seksi_description` text NOT NULL COMMENT 'konten sop,dll',
  `seksi_date` datetime NOT NULL COMMENT 'tanggal memasukan data',
  `seksi_desc_foto` varchar(200) DEFAULT NULL COMMENT 'foto deskripsi foto',
  `bidang_id` int(11) NOT NULL COMMENT 'join ke bidang.',
  PRIMARY KEY (`seksi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `t_seksi` */

/*Table structure for table `t_visitor` */

DROP TABLE IF EXISTS `t_visitor`;

CREATE TABLE `t_visitor` (
  `visitor_id` int(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `hits` int(10) NOT NULL,
  `online` varchar(100) CHARACTER SET utf8 NOT NULL,
  `visitor_ip` varchar(20) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `t_visitor` */

insert  into `t_visitor`(`visitor_id`,`date`,`hits`,`online`,`visitor_ip`) values (1,'2014-04-10 08:06:57',1,'2','2'),(2,'2014-04-10 08:07:52',3,'1','2'),(3,'2014-04-09 08:08:11',2,'2','2'),(4,'2014-04-08 08:08:21',22,'2','2');

/*Table structure for table `t_volunteer` */

DROP TABLE IF EXISTS `t_volunteer`;

CREATE TABLE `t_volunteer` (
  `vol_id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `vol_card_id` varchar(18) CHARACTER SET utf8 NOT NULL,
  `vol_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `vol_phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `vol_address` text CHARACTER SET utf8 NOT NULL,
  `vol_occupation` varchar(40) CHARACTER SET utf8 NOT NULL,
  `vol_email` varchar(100) NOT NULL,
  `kegiatan_id` int(20) NOT NULL,
  PRIMARY KEY (`vol_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `t_volunteer` */

insert  into `t_volunteer`(`vol_id`,`vol_card_id`,`vol_name`,`vol_phone`,`vol_address`,`vol_occupation`,`vol_email`,`kegiatan_id`) values (1,'123456789123226789','Handoyo','087871942562','dawd','Mahasiswa','awdd@dadawdw.com',2);

/*Table structure for table `t_wilayah` */

DROP TABLE IF EXISTS `t_wilayah`;

CREATE TABLE `t_wilayah` (
  `wil_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `wil_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `wil_type` varchar(100) CHARACTER SET utf8 NOT NULL,
  `wil_address` text CHARACTER SET utf8 NOT NULL,
  `wil_phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `geo_location` text CHARACTER SET utf8,
  `web_url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `wil_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`wil_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

/*Data for the table `t_wilayah` */

insert  into `t_wilayah`(`wil_id`,`parent_id`,`wil_name`,`wil_type`,`wil_address`,`wil_phone`,`geo_location`,`web_url`,`wil_email`) values (21,0,'Sukasari','Kecamatan','JL. Gegerkalong Hilir No. 155 Bandung','2012906',NULL,'http://www.cotoh.com','kec.sksr@bandung.go.id'),(22,0,'Sukajadi','Kecamatan','JL. Sukamulya No.4 Bandung','2015736',NULL,'http://www.cotoh.com','kec.skjd@bandung.go.id'),(23,21,'Isola','Kelurahan','Isola','929292',NULL,'http://www.cotoh.com',NULL),(24,0,'Cicendo','Kecamatan','JL. Purabaya No.1 Bandung','6015411',NULL,'http://www.cotoh.com','kec.ccd@bandung.go.id');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_passwordsalt` varchar(200) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `hp` varchar(12) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id_user`,`username`,`user_password`,`user_passwordsalt`,`nama`,`email`,`hp`,`alamat`,`tanggal`) values (2,'hxlines','N0Q9S4g1kQe+3Uh5ywgy2BbA+B9ugZDv3LnBfTMHZFtjoZjt5ElVDmWvWzYIUInoOXPfTdegeyqxfK+1HFqoDw==','100000.T44tAvIE2oLj0YGqFuxx6lfsoSd9pFawmmSHX57s7GmSfQ==','Handoyo','dyo.9913@gamil.com','087871942562','Serang','2014-04-05 15:04:27'),(5,'admin','7reRmLWFf/Y5BHJ3MdNixVRMPhnJjGeb/EbAF8jNITIwDG8kN7JCzPTWAFNy86xsdkJ31SDkynpd85Kf3ZXWwg==','100000.WWXoZsGtpgFEdI0Fr4biCd44bFDQpVPXr9VnElJvzw0e4A==','Zakky chibi','zakkyMoetz@moetz.com','123334324322','Tangerang','2014-04-07 18:37:14'),(6,'admina','gkP/6LOlwdecl0EpHLkH5rQ4R0mAkOaCULddGRqqWiPhzUghN0LbyFglEr1ocRGY/mnZfHBKrItU2x+C582X5g==','100000.09q4EKK6lFuKOptFDGMh5jWh6a7kw0AUpKwzvRBJkvPDVw==','Meidi','adawd@dawd.com','087871942562','Bandung','2014-04-05 15:46:38'),(7,'ahmadpaudji','T9VhlLfXAzsL9bofQamXoU7cpq7mWvTUJc20y4KHQpewQArOXjxaJRS+xSnsd0L4bcDIyPWAL1kM6ChCxQ4fxw==','100000.rI1PsP8+0nKjvt83UEuQAVt6YRI87NM9axc1mRpEnhqxmg==','Ahmad Paudji','ahmadpaudji@gmail.com','085752225126','Jalan Titiran No.2','2014-04-07 17:55:29');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
