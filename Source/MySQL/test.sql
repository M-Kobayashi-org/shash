/*
 * The original string is hard to guess MD5.
 *
 *      Create 2016-10-23 By Masato Kobayashi
 *
 *
 *   Copyright (C) 2016 Masato Kobayashi. All rights reserved.
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

          SELECT CASE WHEN '5fc4d364cf40d7fa4462964943e05b14' = smd5(NULL, 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '5fc4d364cf40d7fa4462964943e05b14' = smd5('', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '8ef89acfad3588245a82cd8d525c44f6' = smd5(' ', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '1820af221504bca637c5b13ac0d96fb1' = smd5('  ', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '1436b071c4fd292fe9d0aab4c120c611' = smd5('0', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '2dd5a42f30e20d4ed85cb71ce9804958' = smd5('0 ', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'ebf3864f88f171c200dea92cb8001b90' = smd5(' 0', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'd5914fbfcf3c9d5f6474c024630a2267' = smd5('1', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'aa3d4dde5ac35f4f07798efa5d264040' = smd5('a', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '7e89f2a4a06881f13005b657c1601b50' = smd5('ab', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'e01d8fd7b69134b4b612aa28f3b97d58' = smd5('A', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'd291a53cc67a9234692b97a78b9e823f' = smd5('AB', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '942e92195e20615c8479aa1723be37b5' = smd5('@', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'efc09877f4ec9c9e6961941741ef846a' = smd5('a@b.com', 'A') THEN 'OK' ELSE 'NG' END;

          SELECT CASE WHEN '7c939e3f1b696dec21831fe69e12195d6c8bca40' = ssha1(NULL, 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '7c939e3f1b696dec21831fe69e12195d6c8bca40' = ssha1('', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'a6c0d7d6383bfb49554e736d99726a47d6636b17' = ssha1(' ', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'b6ead28695a486bf59256e0731e2bf5728e2c57d' = ssha1('  ', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'b61e1e71688bd92bdedbdff490925dae3ef0d681' = ssha1('0', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '513b2e63201912553829ee0243af69d5ba5ef205' = ssha1('0 ', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'ee563ba092496e99d5e87c912881013423f3b6e9' = ssha1(' 0', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '5966cf1ed02f2736c0c7dc1582aa51dd824b400d' = ssha1('1', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '8758c38f52fe7a24c3ca8f76e50aad8896ceeb37' = ssha1('a', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'eb92614e41368d00da01a65d58c6a6fe143910a3' = ssha1('ab', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '2b57c74d34d72c32b9934ac941da4e1b3e9dc026' = ssha1('A', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '403097db3fb96e67b5d751bf7ba9f374aec3cfb1' = ssha1('AB', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'c73094e6119e6ddb3aa3fb016329ac4498cf3b70' = ssha1('@', 'A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '65ee53962c036fad34cb3d124edbd97d49741c2d' = ssha1('a@b.com', 'A') THEN 'OK' ELSE 'NG' END;

