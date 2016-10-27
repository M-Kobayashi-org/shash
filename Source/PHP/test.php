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

require_once('smd5.php');

foreach (array(
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
		) as $str) {
	if (is_null($str))
		printf("null\t=> %s\n", smd5($str, 'A'));
	else
		printf("'%s'\t=> %s\n", $str, smd5($str, 'A'));
}

