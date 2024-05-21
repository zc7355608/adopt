package com.it.adopt.utils;

import java.util.UUID;

/**
 * ClassName: UUIDUtil
 * Package: com.it.adopt.utils
 * Description: UUID的工具类
 *
 * @Author: ZC
 * @Create: 2024/5/11 18:24
 * @Version: 1.0.0
 */

public class UUIDGenerator {

    public static String generate8BitUUID() {
        String uuid = UUID.randomUUID().toString().replace("-", "");
        return uuid.substring(0, 8);
    }
}