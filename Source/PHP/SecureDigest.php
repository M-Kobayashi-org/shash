<?php
/*
 * Guess of the original plain text Gets a difficult hash value.
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

/**
 * SecureDigest will make it difficult to guess the original plain text
 * from the resulting hash value.
 *
 * @author Masato Kobayashi
 *
 */
class SecureDigest {

/**
 * To calculate the hash value of the string.
 * Hash logic underlying is MD5.
 *
 * @param string $plain
 * @param string $salt
 * @return string (32 returns the hexadecimal characters.)
 */
	public static function smd5($plain = '', $salt = '') {
		// Get the hash value
		$encoded = md5($plain);
		$salt = md5($salt);

		// Get the number of repetitions
		$repeat_count = hexdec(substr($encoded, 0, 1)) + hexdec(substr($encoded, 1, 1)) + 2;

		for ($idx = 0; $repeat_count > $idx; $idx++) {
			// Get the insertion position of the salt string
			$insert_offset = hexdec(substr($encoded, 2, 1));
			// Case of
			$encoded = (hexdec(substr($encoded, 3, 1)) % 2 != 0) ? strtoupper($encoded) : strtolower($encoded);

			// Get the salt string start offset
			$salt_offset = hexdec(substr($salt, 0, 1));
			// Get the salt string length
			$salt_length = hexdec(substr($salt, 1, 1)) + 1;
			// Get the Case method
			if (hexdec(substr($salt, 2, 1)) % 2 != 0)
				$is_upper_salt = true;
			else
				$is_upper_salt = false;
			// Get the salt string
			$salt = substr($salt, $salt_offset, $salt_length);
			// Case of
			$salt = $is_upper_salt ? strtoupper($salt) : strtolower($salt);
			// Insert the salt string to salt string synthetic position
			$encoded = ($insert_offset ? substr($encoded, 0, $insert_offset) : '') . $salt . ($insert_offset ? substr($encoded, $insert_offset) : $encoded);
			// Get the hash value
			$result = md5($encoded);
			// Set the new hash value
			$encoded = $result;
			$salt = md5($salt);
		}

		return $result;
	}
}
