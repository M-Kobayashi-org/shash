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
