<?php
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

require_once('SecureDigest.php');

$plains = array(
		null,
		'',
		' ',
		'  ',
		'0',
		'0 ',
		' 0',
		'1',
		'a',
		'ab',
		'A',
		'AB',
		'@',
		'a@b.com',
);

foreach ($plains as $str) {
	if (is_null($str))
		printf("null\t=> %s\n", SecureDigest::smd5($str, 'A'));
	else
		printf("'%s'\t=> %s\n", $str, SecureDigest::smd5($str, 'A'));
}

foreach ($plains as $str) {
	if (is_null($str))
		printf("null\t=> %s\n", SecureDigest::ssha1($str, 'A'));
		else
			printf("'%s'\t=> %s\n", $str, SecureDigest::ssha1($str, 'A'));
}

foreach ($plains as $str) {
	if (is_null($str))
		printf("null\t=> %s\n", SecureDigest::ssha256($str, 'A'));
		else
			printf("'%s'\t=> %s\n", $str, SecureDigest::ssha256($str, 'A'));
}

foreach ($plains as $str) {
	if (is_null($str))
		printf("null\t=> %s\n", SecureDigest::ssha384($str, 'A'));
		else
			printf("'%s'\t=> %s\n", $str, SecureDigest::ssha384($str, 'A'));
}

foreach ($plains as $str) {
	if (is_null($str))
		printf("null\t=> %s\n", SecureDigest::ssha512($str, 'A'));
		else
			printf("'%s'\t=> %s\n", $str, SecureDigest::ssha512($str, 'A'));
}
