package service;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;

public class Base64Util {

    private final static char[] base64Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray();
    private final static int[] base64Lookup = new int[256];

    static {
        Arrays.fill(base64Lookup, -1);
        for (int i = 0; i < base64Chars.length; i++) {
            base64Lookup[base64Chars[i]] = i;
        }
        base64Lookup['='] = 0;
    }

    public static byte[] decode(String base64) {
        int length = base64.length();
        byte[] bytes = new byte[length * 3 / 4 - (base64.endsWith("==") ? 2 : (base64.endsWith("=") ? 1 : 0))];
        int byteIndex = 0;

        for (int i = 0; i < length; i += 4) {
            int bits = (base64Lookup[base64.charAt(i)] << 18) | 
                       (base64Lookup[base64.charAt(i + 1)] << 12) |
                       (base64Lookup[base64.charAt(i + 2)] << 6) |
                       base64Lookup[base64.charAt(i + 3)];
            bytes[byteIndex++] = (byte) (bits >> 16);
            if (byteIndex < bytes.length) bytes[byteIndex++] = (byte) (bits >> 8);
            if (byteIndex < bytes.length) bytes[byteIndex++] = (byte) bits;
        }

        return bytes;
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        String base64String = "SGVsbG8gV29ybGQh"; // Example base64 string
        byte[] decodedBytes = Base64Util.decode(base64String);
        String decodedString = new String(decodedBytes, "UTF-8");
        System.out.println(decodedString); // Outputs "Hello World!"
    }
}