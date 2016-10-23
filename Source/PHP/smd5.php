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

function smd5($plain = '') {
	$encoded = md5($plain);
	$salt_offset = hexdec(substr($encoded, 0, 1));
	$salt_length = hexdec(substr($encoded, 1, 1)) + 1;
	$salt = substr($encoded, $salt_offset, $salt_length);
	$repeat_count = hexdec(substr($encoded, 2, 1));
	if (hexdec(substr($encoded, 3, 1)) % 2 != 0) {
		$is_odd = 1;
	}
	else {
		$is_odd = 0;
	}
	if ($is_odd === 1) {
		$result = md5($plain. $salt);
	}
	else {
		$result = md5($salt. $plain);
	}
	for ($idx = 0; $repeat_count > $idx; $idx++) {
		if ($is_odd === 1) {
			$result = md5($result. $salt);
		}
		else {
			$result = md5($salt. $result);
		}
	}
	return $result;
}
