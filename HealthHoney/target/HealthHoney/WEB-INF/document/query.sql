/*답변형 스프링 게시판 */
CREATE TABLE `freeboard` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) COLLATE utf8_bin NOT NULL,
  `title` varchar(30) COLLATE utf8_bin NOT NULL,
  `writer` varchar(10) COLLATE utf8_bin NOT NULL,
  `wdate` date NOT NULL,
  `rcount` int(5) COLLATE utf8_bin NOT NULL,
  `step` int(5) NOT NULL,
  `depth` int(5) NOT NULL,
  `ref` int(5) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
