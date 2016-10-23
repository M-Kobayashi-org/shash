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

DELIMITER //

DROP FUNCTION IF EXISTS smd5//
CREATE FUNCTION smd5 (plain TEXT)
RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE encoded VARCHAR(32);
    DECLARE salt_offset INT;
    DECLARE salt_length INT;
    DECLARE repeat_count INT;
    DECLARE is_odd INT;
    DECLARE salt VARCHAR(16);
    DECLARE result VARCHAR(32);
    DECLARE idx INT;

    -- 平文のハッシュを取得
    IF plain IS NULL THEN
        SET plain = '';
    END IF;
    SET encoded = MD5(plain);
    -- 各変換設定値を取得する
    SET salt_offset  = CONV(SUBSTRING(encoded, 1, 1), 16, 10) + 1;
    SET salt_length  = CONV(SUBSTRING(encoded, 2, 1), 16, 10) + 1;
    SET repeat_count = CONV(SUBSTRING(encoded, 3, 1), 16, 10);
    SET salt = SUBSTRING(encoded, salt_offset, salt_length);
    IF CONV(SUBSTRING(encoded, 4, 1), 16, 10) % 2 != 0 THEN
        SET is_odd = 1;
    ELSE
        SET is_odd = 0;
    END IF;
    -- saltを付加してハッシュを取得
    IF is_odd = 1 THEN
        SET result = MD5(CONCAT(plain, salt));
    ELSE
        SET result = MD5(CONCAT(salt, plain));
    END IF;
    -- 指定回数繰り返してハッシュを取得
    SET idx = 0;
    WHILE repeat_count > idx DO
        IF is_odd = 1 THEN
            SET result = MD5(CONCAT(result, salt));
        ELSE
            SET result = MD5(CONCAT(salt, result));
        END IF;
        SET idx = idx + 1;
    END WHILE;

    RETURN result;
END//

DELIMITER ;
