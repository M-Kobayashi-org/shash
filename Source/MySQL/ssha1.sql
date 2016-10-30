/*
 * The original string is hard to guess SHA1.
 *
 *      Create 2016-10-30 By Masato Kobayashi
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

DROP FUNCTION IF EXISTS ssha1//
CREATE FUNCTION ssha1 (plain TEXT, salt TEXT)
RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE encoded TEXT;
    DECLARE encoded_salt TEXT;
    DECLARE insert_offset INT;
    DECLARE is_upper_salt INT;
    DECLARE salt_offset INT;
    DECLARE salt_length INT;
    DECLARE repeat_count INT;
    DECLARE result TEXT;
    DECLARE idx INT;

    -- 平文のハッシュを取得
    IF plain IS NULL THEN
        SET plain = '';
    END IF;
    SET encoded = SHA1(plain);
    IF salt IS NULL THEN
        SET salt = '';
    END IF;
    SET encoded_salt = SHA1(salt);

    -- 各変換設定値を取得する
    SET repeat_count = CONV(SUBSTRING(encoded, 1, 1), 16, 10) + CONV(SUBSTRING(encoded, 2, 1), 16, 10) + 2;

    SET idx = 0;
    WHILE repeat_count > idx DO
        -- salt文字列挿入位置を取得する
        SET insert_offset = CONV(SUBSTRING(encoded, 3, 1), 16, 10);
        -- 大小文字化
        IF CONV(SUBSTRING(encoded, 4, 1), 16, 10) % 2 != 0 THEN
            SET encoded = UPPER(encoded);
        ELSE
            SET encoded = LOWER(encoded);
        END IF;
        -- salt文字列抽出条件を取得する
        SET salt_offset  = CONV(SUBSTRING(encoded_salt, 1, 1), 16, 10) + 1;
        SET salt_length  = CONV(SUBSTRING(encoded_salt, 2, 1), 16, 10) + 1;
        -- salt文字列の大小文字化方法を取得する
        IF CONV(SUBSTRING(encoded_salt, 3, 1), 16, 10) % 2 != 0 THEN
            SET is_upper_salt = 1;
        ELSE
            SET is_upper_salt = 0;
        END IF;
        -- salt文字列を抽出する
        SET encoded_salt = SUBSTRING(encoded_salt, salt_offset, salt_length);
        -- 大小文字化
        IF is_upper_salt = 0 THEN
            SET encoded_salt = LOWER(encoded_salt);
        ELSE
            SET encoded_salt = UPPER(encoded_salt);
        END IF;
        -- salt文字列を挿入する
        IF insert_offset = 0 THEN
            SET encoded = CONCAT(encoded_salt, encoded);
        ELSE
            SET encoded = CONCAT(SUBSTRING(encoded, 1, insert_offset), encoded_salt, SUBSTRING(encoded, insert_offset + 1));
        END IF;

        -- ハッシュを取得する
        SET result = SHA1(encoded);

        -- ハッシュ値をセットする
        SET encoded = result;
        SET encoded_salt = SHA1(encoded_salt);

        -- カウンタをインクリメント
        SET idx = idx + 1;
    END WHILE;

    RETURN result;
END//

DELIMITER ;
