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

          SELECT CASE WHEN '329157fd9f46bdc5407de3f7b19512fe' = smd5(NULL) THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '329157fd9f46bdc5407de3f7b19512fe' = smd5('') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '80cd3e3e4bc70de5d8443433145a451b' = smd5(' ') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '3cfcc4063ed46e9a9d18a8b7e2d299b8' = smd5('  ') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '7be46865ac2138cb1fc2421b7450c5cf' = smd5('0') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'b020e530dce810f85bf12f25d4f65b3d' = smd5('0 ') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '0a7eb243b249bd92cb7df6f2859dad01' = smd5(' 0') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '2bc221bb686d4e7101a95f73b5eab669' = smd5('1') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '5be716b856613b19fdd4e32ecd849382' = smd5('a') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '4c2b9988224e75ff40d5460f74ebed09' = smd5('ab') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'cf345f548c74572f4795aedd78e04bf1' = smd5('A') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'ec16b408c4a880ba5a5028fd22911566' = smd5('AB') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN 'aceb36757fbb89f0e4503d973f3f13ad' = smd5('@') THEN 'OK' ELSE 'NG' END
UNION ALL SELECT CASE WHEN '2c8702633d3d345730adceef09cfa189' = smd5('a@b.com') THEN 'OK' ELSE 'NG' END;
